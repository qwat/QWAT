/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view
*/

/* create a view with the viewable items */
CREATE OR REPLACE VIEW distribution.pipes_schema_viewableitems AS 
	SELECT 	id,id_parent,wkb_geometry
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
	SELECT 	wkb_geometry,
		distribution.get_parent(id,id_parent) AS groupid
	  FROM distribution.pipes_schema_viewableitems;

/* 
Merging of pipes based on the group ID
TODO: controler que c'est bien les champs du parent qui sont utilises => faire un join avec pipe_table
*/
CREATE OR REPLACE VIEW distribution.pipes_schema AS
	SELECT groupid, LineMerge(ST_Union(wkb_geometry)) AS wkb_geometry
	  FROM distribution.pipes_schema_items
	 GROUP BY groupid ;
COMMENT ON VIEW distribution.pipes_schema IS 'Merging of pipes based on the group ID';

/* 
Add geometry column info into PostGIS
It is a multilinestring as it could happen to a merge of separated pipes (but it should not)
*/
DELETE FROM geometry_columns WHERE f_table_name = 'pipes_schema';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type") 
	VALUES  ('' , 'distribution', 'pipes_schema', 'wkb_geometry', 2, 21781, 'MULTILINESTRING');

