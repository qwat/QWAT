/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipe_schema_visibleitems select pipe which are visible in schema with the alternative geometry
view pipe_schema_items         get the parent id of each pipe
view pipe_schema_merged        merge the pipe by grouping by id
view pipe_schema               join with pipe_view to get pipe properties
*/



/* create a view with the visible items */
DROP VIEW IF EXISTS qwat.vw_pipe_schema_visibleitems CASCADE;
CREATE VIEW qwat.vw_pipe_schema_visibleitems AS 
	SELECT 	
		od_pipe.id,
		od_pipe.id_parent,
		od_pipe._length2d,
		od_pipe._length3d,
		od_pipe.tunnel_or_bridge,
		od_pipe.geometry_alt2::geometry(LineString,21781) AS geometry,
		od_pipe._valve_count,
		od_pipe._valve_closed
	FROM qwat.od_pipe
	INNER JOIN qwat.vl_status ON od_pipe.id_status = vl_status.id
	WHERE _schema_visible IS TRUE
	AND vl_status.active IS TRUE;
COMMENT ON VIEW qwat.vw_pipe_schema_visibleitems IS 'visible pipe in the schematic view (before merge)';

CREATE OR REPLACE RULE pipe_update_alternative AS
	ON UPDATE TO qwat.vw_pipe_schema_visibleitems DO INSTEAD
		UPDATE qwat.od_pipe SET
			id_parent = NEW.id_parent,
			geometry_alt2 = NEW.geometry
		WHERE id = NEW.id;
	
CREATE OR REPLACE RULE pipe_delete_alternative AS
	ON DELETE TO qwat.vw_pipe_schema_visibleitems DO INSTEAD
		UPDATE qwat.od_pipe SET
			geometry_alt2 = NULL::geometry(LineString,21781)
		WHERE id = OLD.id;	

/* 
Function to get a group ID (parent/children).
Also works in case of sub-parent
*/
CREATE OR REPLACE FUNCTION qwat.fn_get_parent(integer,integer) RETURNS integer AS '
	DECLARE
		childid ALIAS FOR $1;
		parentid ALIAS FOR $2;
	BEGIN
		IF parentid IS NULL THEN
			RETURN childid;
		END IF;
		LOOP
			SELECT id_parent INTO childid 
			FROM qwat.vw_pipe_schema_visibleitems
			WHERE id = parentid;

			IF childid IS NOT NULL THEN
				parentid := childid;
			ELSE
				RETURN parentid;
			END IF;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_parent(integer,integer) IS 'Function to get a group ID (parent/children). Also works in case of sub-parent';

/* 
View of pipe with group ID
*/
CREATE OR REPLACE VIEW qwat.vw_pipe_schema_items AS 
	SELECT 
		geometry::geometry(LineString,21781),
		qwat.fn_get_parent(id,id_parent) AS groupid,
		_length2d,
		_length3d,
		tunnel_or_bridge,
		_valve_count,
		_valve_closed
	  FROM qwat.vw_pipe_schema_visibleitems;
	  
/* 
Merging of pipe based on the group ID
*/
CREATE OR REPLACE VIEW qwat.vw_pipe_schema_merged AS
	SELECT	groupid AS id, 
			ST_LineMerge(ST_Union(geometry))::geometry(LineString,21781) AS geometry,
			COUNT(groupid) AS number_of_pipe,
			SUM(_length2d) AS _length2d,
			SUM(_length3d) AS _length3d,
			bool_or(tunnel_or_bridge) AS tunnel_or_bridge,
			SUM(_valve_count) AS _valve_count,
			bool_or(_valve_closed) AS _valve_closed
	  FROM qwat.vw_pipe_schema_items
	 GROUP BY groupid ;
COMMENT ON VIEW qwat.vw_pipe_schema_merged IS 'Merging of pipe based on the group ID';

/* 
Join with pipe_view to get pipe properties
*/
DROP VIEW IF EXISTS qwat.vw_pipe_schema ;
CREATE VIEW qwat.vw_pipe_schema AS
	SELECT	
			od_pipe.id				              ,
			od_pipe.id_function                   ,
			od_pipe.id_installmethod              ,
			od_pipe.id_material                   ,
			od_pipe.id_distributor                ,
			od_pipe.id_precision                  ,
			od_pipe.id_protection                 ,
			od_pipe.id_status                     ,
			od_pipe.year                          ,
			od_pipe.pressure_nominal              ,
			od_pipe.folder                        ,
			od_pipe.remark                        , 
			od_pipe.id_district                   ,
			od_pipe.id_pressurezone               ,
			od_pipe.id_printmap                   ,
			od_pipe._district                     ,
			od_pipe._printmaps                    ,
			od_pipe.label_visible_1                ,
			od_pipe.label_visible_2                ,
			vw_pipe_schema_merged._length2d       ,
			vw_pipe_schema_merged._length3d       ,
			vw_pipe_schema_merged.number_of_pipe  ,
			vw_pipe_schema_merged.tunnel_or_bridge,
			vw_pipe_schema_merged._valve_count    ,
			vw_pipe_schema_merged._valve_closed   ,
			od_pressurezone.name AS _pressurezone ,
			od_pressurezone.colorcode AS _pressurezone_colorcode,
			vw_pipe_schema_merged.geometry::geometry(LineString,21781) AS geometry
	  FROM qwat.vw_pipe_schema_merged
	 INNER JOIN qwat.od_pipe         ON od_pipe.id = vw_pipe_schema_merged.id
	 INNER JOIN qwat.od_pressurezone ON od_pipe.id_pressurezone = od_pressurezone.id;
COMMENT ON VIEW qwat.vw_pipe_schema IS 'Final view for schema';


/* 
Add node id
*/
DROP MATERIALIZED VIEW IF EXISTS qwat.vw_pipe_schema_node ;
CREATE MATERIALIZED VIEW qwat.vw_pipe_schema_node AS
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
			vw_pipe_schema.*,
			qwat.fn_node_get_id(ST_StartPoint(geometry),true) AS id_node_a,
			qwat.fn_node_get_id(ST_EndPoint(  geometry),true) AS id_node_b	
			FROM qwat.vw_pipe_schema 
		) AS foo
		LEFT OUTER JOIN qwat.od_node AS node_a ON id_node_a = node_a.id
		LEFT OUTER JOIN qwat.od_node AS node_b ON id_node_b = node_b.id; 
COMMENT ON MATERIALIZED VIEW qwat.vw_pipe_schema_node IS 'Final view for schema completed with node.';

/*
Report schema errors
*/
CREATE OR REPLACE VIEW qwat.vw_pipe_schema_error AS
	SELECT id, geometry FROM 
	 ( 	SELECT 	groupid AS id, 
				ST_Multi(ST_LineMerge(ST_Union(geometry)))::geometry(MultiLineString,21781) AS geometry
		  FROM qwat.vw_pipe_schema_items
		 GROUP BY groupid 
	 ) AS foo
	 WHERE geometryType(ST_CollectionHomogenize(geometry)) != 'LINESTRING';
COMMENT ON VIEW qwat.vw_pipe_schema_error IS 'Report IDs of parent pipe where pipe concatenation leads to a MultiLineString and not to a LineString.';



