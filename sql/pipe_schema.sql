/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipe_schema_viewableitems select pipe which are viewable in schema with the alternative geometry
view pipe_schema_items         get the parent id of each pipe
view pipe_schema_merged        merge the pipe by grouping by id
view pipe_schema               join with pipe_view to get pipe properties
*/

BEGIN;

/* create a view with the viewable items */
DROP VIEW IF EXISTS distribution.pipe_schema_viewableitems CASCADE;
CREATE VIEW distribution.pipe_schema_viewableitems AS 
	SELECT 	
		pipe.id,
		pipe.id_parent,
		pipe._length2d,
		pipe._length3d,
		pipe._length3d_uptodate,
		pipe.tunnel_or_bridge,
		pipe.geometry_schematic::geometry(LineString,21781) AS geometry,
		pipe_view._valve_closed
	  FROM distribution.pipe
	  INNER JOIN distribution.pipe_view ON pipe.id = pipe_view.id
		WHERE _schema_view IS TRUE
		AND _status_active IS TRUE;
COMMENT ON VIEW distribution.pipe_schema_viewableitems IS 'viewable pipe in the schematic view (before merge)';

CREATE OR REPLACE RULE pipe_update_alternative AS
	ON UPDATE TO distribution.pipe_schema_viewableitems DO INSTEAD
		UPDATE distribution.pipe SET 
			geometry_schematic = NEW.geometry
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
			FROM distribution.pipe_schema_viewableitems
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
View of pipe with group ID
*/
CREATE OR REPLACE VIEW distribution.pipe_schema_items AS 
	SELECT 
		geometry::geometry(LineString,21781),
		distribution.get_parent(id,id_parent) AS groupid,
		_length2d,
		_length3d,
		_length3d_uptodate,
		tunnel_or_bridge,
		_valve_closed
	  FROM distribution.pipe_schema_viewableitems;
	  
/* 
Merging of pipe based on the group ID
*/
CREATE OR REPLACE VIEW distribution.pipe_schema_merged AS
	SELECT	groupid AS id, 
			ST_LineMerge(ST_Union(geometry))::geometry(LineString,21781) AS geometry,
			COUNT(groupid) AS number_of_pipe,
			SUM(_length2d) AS _length2d,
			SUM(_length3d) AS _length3d,
			bool_and(_length3d_uptodate) AS _length3d_uptodate,
			bool_or(tunnel_or_bridge) AS tunnel_or_bridge,
			bool_or(_valve_closed) AS _valve_closed
	  FROM distribution.pipe_schema_items
	 GROUP BY groupid ;
COMMENT ON VIEW distribution.pipe_schema_merged IS 'Merging of pipe based on the group ID';

/* 
Join with pipe_view to get pipe properties
*/
DROP VIEW IF EXISTS distribution.pipe_schema ;
CREATE VIEW distribution.pipe_schema AS
	SELECT	
			pipe_view.id				         ,
			pipe_view.id_parent                  ,
			pipe_view.id_function                ,
			pipe_view.id_install_method          ,
			pipe_view.id_material                ,
			pipe_view.id_distributor             ,
			pipe_view.id_precision               ,
			pipe_view.id_protection              ,
			pipe_view.id_status                  ,
			pipe_view.id_pressurezone            ,
			pipe_view.schema_force_view          ,
			pipe_view.year                       ,
			pipe_view.pressure_nominale          ,
			pipe_view.folder                     ,
			pipe_view.remarks                    , 
			pipe_view._is_on_map                 ,
			pipe_view._is_on_district            ,
			pipe_view._slope                     ,
			pipe_view._function_name             , 
			pipe_view._install_method            ,
			pipe_view._material_name             ,
			pipe_view._material_longname         ,
			pipe_view._material_diameter         ,
			pipe_view._material_diameter_internal,
			pipe_view._distributor               ,
			pipe_view._precision                 ,
			pipe_view._protection                ,
			pipe_view._status_name               ,
			pipe_view._status_active             ,
			pipe_view._pressurezone              ,
			pipe_view._pressurezone_shortname    ,
			pipe_view._consummerzone             ,
			pipe_view._pressurezone_colorcode    ,
			pipe_view._schema_view               ,	
			pipe_view._valve_closed              ,	
			pipe_schema_merged._length2d         ,
			pipe_schema_merged._length3d         ,
			pipe_schema_merged._length3d_uptodate,
			pipe_schema_merged.number_of_pipe    ,
			pipe_schema_merged.tunnel_or_bridge  ,
			pipe_schema_merged._valve_closed     ,
			pipe_schema_merged.geometry::geometry(LineString,21781) AS geometry
	  FROM distribution.pipe_schema_merged
	 INNER JOIN distribution.pipe_view ON pipe_view.id = pipe_schema_merged.id;
COMMENT ON VIEW distribution.pipe_schema IS 'Final view for schema';


/* 
Add node id
*/
DROP VIEW IF EXISTS distribution.pipe_schema_node ;
CREATE VIEW distribution.pipe_schema_node AS
	SELECT	
		*,
		distribution.node_get_id(ST_StartPoint(geometry),true) AS id_node_a,
		distribution.node_get_id(ST_EndPoint(  geometry),true) AS id_node_b
	FROM distribution.pipe_schema ; 
COMMENT ON VIEW distribution.pipe_schema_node IS 'Final view for schema completed with node.';


/*
Report schema errors
*/
CREATE OR REPLACE VIEW distribution.pipe_schema_error AS
	SELECT id FROM 
	 ( 	SELECT 	groupid AS id, 
				ST_Multi(ST_LineMerge(ST_Union(geometry)))::geometry(MultiLineString,21781) AS geometry
		  FROM distribution.pipe_schema_items
		 GROUP BY groupid 
	 ) AS foo
	 WHERE geometryType(ST_CollectionHomogenize(geometry)) != 'LINESTRING';
COMMENT ON VIEW distribution.pipe_schema_error IS 'Report IDs of parent pipe where pipe concatenation leads to a MultiLineString and not to a LineString.';


COMMIT;
