/*
	qWat - QGIS Water Module
	
	SQL file :: draw lines from children to parent (pressurezone)

*/

BEGIN;

CREATE OR REPLACE VIEW distribution.pressurezone_child_parent AS
	SELECT
		a.id as id,
		a.name AS child,
		b.name AS parent,
		ST_MakeLine(ST_Centroid(a.geometry),ST_Centroid(b.geometry))::geometry(LineString,21781) AS geometry
	FROM 
		distribution.pressurezone a
	INNER JOIN 
		distribution.pressurezone b ON a.id_parent = b.id
	WHERE 
		a.id_parent IS NOT NULL;	
COMMIT;
