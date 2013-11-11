/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipe_schema_visibleableitems select pipe which are viewable in schema with the alternative geometry
view pipe_schema_items         get the parent id of each pipe
view pipe_schema_merged        merge the pipe by grouping by id
view pipe_schema               join with pipe_view to get pipe properties
*/



/* create a view with the viewable items */
DROP VIEW IF EXISTS distribution.pipe_schema_visibleableitems CASCADE;
CREATE VIEW distribution.pipe_schema_visibleableitems AS 
	SELECT 	
		pipe.id,
		pipe.id_parent,
		pipe._length2d,
		pipe._length3d,
		pipe.tunnel_or_bridge,
		pipe.geometry_schematic::geometry(LineString,21781) AS geometry,
		pipe._valve_count,
		pipe._valve_closed
	FROM distribution.pipe
	INNER JOIN distribution.vl_status ON pipe.id_status = vl_status.id
	WHERE _schema_visible IS TRUE
	AND vl_status.active IS TRUE;
COMMENT ON VIEW distribution.pipe_schema_visibleableitems IS 'viewable pipe in the schematic view (before merge)';

CREATE OR REPLACE RULE pipe_update_alternative AS
	ON UPDATE TO distribution.pipe_schema_visibleableitems DO INSTEAD
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
			FROM distribution.pipe_schema_visibleableitems
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
		tunnel_or_bridge,
		_valve_count,
		_valve_closed
	  FROM distribution.pipe_schema_visibleableitems;
	  
/* 
Merging of pipe based on the group ID
*/
CREATE OR REPLACE VIEW distribution.pipe_schema_merged AS
	SELECT	groupid AS id, 
			ST_LineMerge(ST_Union(geometry))::geometry(LineString,21781) AS geometry,
			COUNT(groupid) AS number_of_pipe,
			SUM(_length2d) AS _length2d,
			SUM(_length3d) AS _length3d,
			bool_or(tunnel_or_bridge) AS tunnel_or_bridge,
			SUM(_valve_count) AS _valve_count,
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
			pipe.id				               ,
			pipe.id_function                   ,
			pipe.id_installmethod              ,
			pipe.id_material                   ,
			pipe.id_distributor                ,
			pipe.id_precision                  ,
			pipe.id_protection                 ,
			pipe.id_status                     ,
			pipe.id_pressurezone               ,
			pipe.id_labelview                  ,
			pipe.id_labelschema_visible           ,
			pipe.year                          ,
			pipe.pressure_nominal              ,
			pipe.folder                        ,
			pipe.remarks                       , 
			pipe.id_printmap                   ,
			pipe._printmaps                    ,
			pipe.id_district                   ,
			pipe._districts                    ,
			pipe_schema_merged._length2d       ,
			pipe_schema_merged._length3d       ,
			pipe_schema_merged.number_of_pipe  ,
			pipe_schema_merged.tunnel_or_bridge,
			pipe_schema_merged._valve_count    ,
			pipe_schema_merged._valve_closed   ,
			pipe_schema_merged.geometry::geometry(LineString,21781) AS geometry
	  FROM distribution.pipe_schema_merged
	 INNER JOIN distribution.pipe ON pipe.id = pipe_schema_merged.id;
COMMENT ON VIEW distribution.pipe_schema IS 'Final view for schema';


/* 
Add node id
*/
DROP VIEW IF EXISTS distribution.pipe_schema_node ;
CREATE VIEW distribution.pipe_schema_node AS
	SELECT 
		foo.*,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN NULL
			ELSE abs(node_a.altitude_dtm-node_b.altitude_dtm)
		END AS _diff_elevation,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN NULL
			ELSE abs(node_a.altitude_dtm-node_b.altitude_dtm)/_length3d
		END AS _slope
	FROM
		( SELECT	
			pipe_schema.*,
			distribution.node_get_id(ST_StartPoint(geometry),true) AS id_node_a,
			distribution.node_get_id(ST_EndPoint(  geometry),true) AS id_node_b	
			FROM distribution.pipe_schema 
		) AS foo
		LEFT OUTER JOIN distribution.node AS node_a ON id_node_a = node_a.id
		LEFT OUTER JOIN distribution.node AS node_b ON id_node_b = node_b.id; 
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



