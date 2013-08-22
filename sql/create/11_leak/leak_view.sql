/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

DROP VIEW IF EXISTS distribution.leak_view CASCADE;
CREATE VIEW distribution.leak_view AS 
	SELECT  
		leak_type.name   AS type,  
		leak_cause.name  AS cause,
		leak_damage.name AS damage,
		detection_date  ,
		repair_date     ,
		_repaired       ,
		address         ,
		pipe_replaced   ,
		description     ,
		repair          ,
		geometry::geometry(Point,21781)
	FROM distribution.leak
	INNER      JOIN distribution.leak_type   ON leak.id_type  = leak_type.id
	LEFT OUTER JOIN distribution.leak_cause  ON leak.id_cause = leak_cause.id
	INNER      JOIN distribution.leak_damage ON leak.id_damage = leak_damage.id;



