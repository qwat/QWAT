/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipes_schema_viewableitems select pipes which are viewable in schema
view pipes_schema_items         get the parent id of each pipe
view pipes_schema_merged        merge the pipes by grouping by id
view pipes_schema               join with pipes_view to get pipes properties
*/

BEGIN;

/* create a view with the viewable items */
CREATE OR REPLACE VIEW distribution.pipes_schema_viewableitems AS 
	SELECT 	
		id,
		id_parent,
		_length2d,
		_length3d,
		_length3d_uptodate,
		geometry::geometry(LineString,21781)
	  FROM distribution.pipes_view
		WHERE _schema_view IS TRUE
		AND _status_active IS TRUE;
COMMENT ON VIEW distribution.pipes_schema_viewableitems IS 'viewable pipes in the schematic view (before merge)';

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
		_length3d_uptodate
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
			bool_and(_length3d_uptodate) AS _length3d_uptodate
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
/*
view to display arrows from children to parent
this shoud be used as soon as ST_lineToCurve works for 3 points
		ST_CurveToLine(ST_LineToCurve( ST_AddPoint( vector , ST_MakePoint( ST_X(middle_point)+distance*cos(azimuth),ST_Y(middle_point)+distance*sin(azimuth) ) , 1 ) ) ,15)::geometry(LineString,21781) AS geometry
then this should be added to select of foo2
		ST_MakeLine( start_point , end_point )::geometry(LineString,21781) AS vector,
*/
CREATE OR REPLACE VIEW distribution.pipe_child_parent AS
	SELECT child, parent,
		 ST_CurveToLine(ST_GeomFromEWKT('SRID=21781;CIRCULARSTRING('
			||ST_X(start_point)||' '||ST_Y(start_point)
			||','||
			ST_X(middle_point)+distance*cos(azimuth)||' '||ST_Y(middle_point)+distance*sin(azimuth)
			||','||
			ST_X(end_point)||' '||ST_Y(end_point) 
			||')'
		),15)::geometry(LineString,21781) AS geometry
	FROM (
		SELECT child,parent,
			start_point , end_point ,
			pi()/2+ST_Azimuth(start_point,end_point) AS azimuth,
			.5*ST_Distance(start_point,end_point) AS distance,
			ST_Line_Interpolate_Point(ST_MakeLine( start_point , end_point ),.5)::geometry(Point,21781) AS middle_point
		FROM (
			SELECT a.id AS child ,b.id AS parent, 
					ST_Line_Interpolate_Point(a.geometry,.5)::geometry(Point,21781) AS start_point,
					/* select end_point at 4 meters from the closest side of the pipe */
					ST_ClosestPoint(ST_MakeLine(  
						ST_Line_Interpolate_Point(b.geometry,   LEAST(1,  4/b._length2d/2))::geometry(Point,21781) ,
						ST_Line_Interpolate_Point(b.geometry,GREATEST(0,1-4/b._length2d/2))::geometry(Point,21781) 
					),a.geometry) AS end_point
			FROM distribution.pipes a 
			INNER JOIN distribution.pipes b ON a.id_parent = b.id
			WHERE a.id_parent IS NOT NULL
		) AS foo
	) AS foo2;
COMMIT;
