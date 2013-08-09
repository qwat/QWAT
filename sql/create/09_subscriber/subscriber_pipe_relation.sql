/*
	qWat - QGIS Water Module
	
	SQL file :: draw lines from subscriber to their pipe

*/



CREATE OR REPLACE VIEW distribution.subscriber_pipe_relation AS
	SELECT
		a.id as id,
		a._client_identification_full as _client_identification_full,
		ST_MakeLine(a.geometry,ST_Line_Interpolate_Point(b.geometry,.5))::geometry(LineString,21781) AS geometry
	FROM 
		distribution.subscriber a
	INNER JOIN 
		distribution.pipe b ON a.id_pipe = b.id
	WHERE 
		a.id_pipe IS NOT NULL;	

