/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipes_schema_viewableitems select pipes which are viewable in schema with the alternative geometry
view pipes_schema_items         get the parent id of each pipe
view pipes_schema_merged        merge the pipes by grouping by id
view pipes_schema               join with pipes_view to get pipes properties
*/

BEGIN;

/* create a view with the viewable items */
CREATE OR REPLACE VIEW distribution.pipes_schema_viewableitems AS 
	SELECT 	
		pipes.id,
		pipes.id_parent,
		pipes._length2d,
		pipes._length3d,
		pipes._length3d_uptodate,
		pipes.tunnel_or_bridge,
		pipes.geometry_alternative::geometry(LineString,21781) AS geometry
	  FROM distribution.pipes
	  INNER JOIN distribution.pipes_view ON pipes.id = pipes_view.id
		WHERE _schema_view IS TRUE
		AND _status_active IS TRUE;
COMMENT ON VIEW distribution.pipes_schema_viewableitems IS 'viewable pipes in the schematic view (before merge)';

CREATE OR REPLACE RULE pipes_update_alternative AS
	ON UPDATE TO distribution.pipes_schema_viewableitems DO INSTEAD
		UPDATE distribution.pipes SET 
			geometry_alternative = NEW.geometry
		WHERE id = NEW.id;
		

/* 
Function to get a group ID (parent/children).
Also works in case of sub-parent
*/
CREATE OR REPLACE FUNCTION distribution.get_parent(integer,integer) RETURNS integer AS '
	DECLARE
		childid ALIAS FOR $1;
		parentid ALIAS FOR $2;
	BEGIN
		IF parentid IS NULL THEN
			RETURN childid;
		END IF;
		LOOP
			SELECT id_parent INTO childid 
			FROM distribution.pipes_schema_viewableitems
			WHERE id = parentid;

			IF childid IS NOT NULL THEN
				parentid := childid;
			ELSE
				RETURN parentid;
			END IF;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_parent(integer,integer) IS 'Function to get a group ID (parent/children). Also works in case of sub-parent';

/* 
View of pipes with group ID
*/
CREATE OR REPLACE VIEW distribution.pipes_schema_items AS 
	SELECT 
		geometry::geometry(LineString,21781),
		distribution.get_parent(id,id_parent) AS groupid,
		_length2d,
		_length3d,
		_length3d_uptodate,
		tunnel_or_bridge
	  FROM distribution.pipes_schema_viewableitems;

/* 
Merging of pipes based on the group ID
*/
CREATE OR REPLACE VIEW distribution.pipes_schema_merged AS
	SELECT 	groupid AS id, 
			ST_LineMerge(ST_Union(geometry))::geometry(LineString,21781) AS geometry,
			COUNT(groupid) AS number_of_pipes,
			SUM(_length2d) AS _length2d,
			SUM(_length3d) AS _length3d,
			bool_and(_length3d_uptodate) AS _length3d_uptodate,
			bool_or(tunnel_or_bridge) AS tunnel_or_bridge
	  FROM distribution.pipes_schema_items
	 GROUP BY groupid ;
COMMENT ON VIEW distribution.pipes_schema_merged IS 'Merging of pipes based on the group ID';

/* 
Join with pipes_view to get pipes properties
*/
DROP VIEW IF EXISTS distribution.pipes_schema ;
CREATE VIEW distribution.pipes_schema AS
	SELECT	
			pipes_view.id				          ,
			pipes_view.id_parent                  ,
			pipes_view.id_function                ,
			pipes_view.id_install_method          ,
			pipes_view.id_material                ,
			pipes_view.id_owner                   ,
			pipes_view.id_precision               ,
			pipes_view.id_protection              ,
			pipes_view.id_status                  ,
			pipes_view.id_pressure_zone           ,
			pipes_view.id_node_a                  ,
			pipes_view.id_node_b                  ,
			pipes_view.schema_force_view          ,
			pipes_view.year                       ,
			pipes_view.pressure_nominale          ,
			pipes_view.folder                     ,
			pipes_view.remarks                    , 
			pipes_view._is_on_map                 ,
			pipes_view._is_on_district            ,
			pipes_view._slope                     ,
			pipes_view._function_name             , 
			pipes_view._install_method            ,
			pipes_view._material_name             ,
			pipes_view._material_longname         ,
			pipes_view._material_diameter         ,
			pipes_view._material_diameter_internal,
			pipes_view._owner                     ,
			pipes_view._precision                 ,
			pipes_view._protection                ,
			pipes_view._status_name               ,
			pipes_view._status_active             ,
			pipes_view._pressure_zone             ,
			pipes_view._schema_view               ,	
			pipes_schema_merged._length2d         ,
			pipes_schema_merged._length3d         ,
			pipes_schema_merged._length3d_uptodate,
			pipes_schema_merged.number_of_pipes   ,
			pipes_schema_merged.tunnel_or_bridge  ,
			pipes_schema_merged.geometry::geometry(LineString,21781) AS geometry
	  FROM distribution.pipes_schema_merged
	 INNER JOIN distribution.pipes_view ON pipes_view.id = pipes_schema_merged.id;
COMMENT ON VIEW distribution.pipes_schema IS 'Final view for schema';

/*
Report schema errors
*/
CREATE OR REPLACE VIEW distribution.pipes_schema_error AS
	SELECT id FROM 
	 ( 	SELECT 	groupid AS id, 
				ST_Multi(ST_LineMerge(ST_Union(geometry)))::geometry(MultiLineString,21781) AS geometry
		  FROM distribution.pipes_schema_items
		 GROUP BY groupid 
	 ) AS foo
	 WHERE geometryType(ST_CollectionHomogenize(geometry)) != 'LINESTRING';
COMMENT ON VIEW distribution.pipes_schema_error IS 'Report IDs of parent pipes where pipe concatenation leads to a MultiLineString and not to a LineString.';


COMMIT;
