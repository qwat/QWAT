/*
	qWat - QGIS Water Module
	
	SQL file :: draw lines from children to parent (pressurezone)

*/



CREATE OR REPLACE VIEW distribution.od_pressurezone_child_parent AS
	SELECT
		a.id as id,
		a.name AS child,
		b.name AS parent,
		ST_MakeLine(ST_Centroid(a.geometry),ST_Centroid(b.geometry))::geometry(LineString,21781) AS geometry
	FROM 
		distribution.od_pressurezone a
	INNER JOIN 
		distribution.od_pressurezone b ON a.id_parent = b.id
	WHERE 
		a.id_parent IS NOT NULL;	

