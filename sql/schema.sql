/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view
*/
BEGIN;

/* create a view with the viewable items */
CREATE OR REPLACE VIEW distribution.pipes_schema_viewableitems AS 
	SELECT 	id,id_parent,wkb_geometry::geometry(LineString,21781)
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
	SELECT 	wkb_geometry::geometry(LineString,21781),
		distribution.get_parent(id,id_parent) AS groupid
	  FROM distribution.pipes_schema_viewableitems;

/* 
Merging of pipes based on the group ID
TODO: controler que c'est bien les champs du parent qui sont utilises => faire un join avec pipe_table
*/
CREATE OR REPLACE VIEW distribution.pipes_schema AS
	SELECT groupid, ST_LineMerge(ST_Union(wkb_geometry))::geometry(MultiLineString,21781) AS wkb_geometry
	  FROM distribution.pipes_schema_items
	 GROUP BY groupid ;
COMMENT ON VIEW distribution.pipes_schema IS 'Merging of pipes based on the group ID';


/*
view to display arrows from children to parent
this shoud be used as soon as ST_lineToCurve works for 3 points
		ST_CurveToLine(ST_LineToCurve( ST_AddPoint( vector , ST_MakePoint( ST_X(middle_point)+distance*cos(azimuth),ST_Y(middle_point)+distance*sin(azimuth) ) , 1 ) ) ,15)::geometry(LineString,21781) AS wkb_geometry
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
		),15)::geometry(LineString,21781) AS wkb_geometry
	FROM (
		SELECT child,parent,
			start_point , end_point ,
			pi()/2+ST_Azimuth(start_point,end_point) AS azimuth,
			.5*ST_Distance(start_point,end_point) AS distance,
			ST_Line_Interpolate_Point(ST_MakeLine( start_point , end_point ),.5)::geometry(Point,21781) AS middle_point
		FROM (
			SELECT a.id AS child ,b.id AS parent, 
					ST_Line_Interpolate_Point(a.wkb_geometry,.5)::geometry(Point,21781) AS start_point,
					ST_ClosestPoint(ST_MakeLine(  
						ST_Line_Interpolate_Point(b.wkb_geometry,   LEAST(1,  a._length2d/b._length2d/2))::geometry(Point,21781) ,
						ST_Line_Interpolate_Point(b.wkb_geometry,GREATEST(0,1-a._length2d/b._length2d/2))::geometry(Point,21781) 
					),a.wkb_geometry) AS end_point
			FROM distribution.pipes a 
			INNER JOIN distribution.pipes b ON a.id_parent = b.id
			WHERE a.id_parent IS NOT NULL
		) AS foo
	) AS foo2;
COMMIT;
