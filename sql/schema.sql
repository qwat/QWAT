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
*/
CREATE OR REPLACE VIEW distribution.pipe_child_parent AS
	SELECT a.id AS child ,b.id AS parent, 
		ST_MakeLine( ST_Line_Interpolate_Point(a.wkb_geometry,.5) , ST_Line_Interpolate_Point(b.wkb_geometry,.5) )::geometry(LineString,21781) AS wkb_geometry
	FROM distribution.pipes a 
	INNER JOIN distribution.pipes b ON a.id_parent = b.id
	WHERE a.id_parent IS NOT NULL;
SELECT populate_geometry_columns('distribution.pipe_child_parent'::regclass);

COMMIT;
