/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

DROP VIEW IF EXISTS distribution.leak_view CASCADE;
CREATE VIEW distribution.leak_view AS 
	SELECT  
		vl_leak_type.value_fr   AS type,  
		vl_leak_cause.value_fr  AS cause,
		vl_leak_damage.value_fr AS damage,
		detection_date  ,
		repair_date     ,
		_repaired       ,
		address         ,
		pipe_replaced   ,
		description     ,
		repair          ,
		geometry::geometry(Point,21781)
	FROM distribution.leak
	INNER      JOIN distribution.vl_leak_type   ON leak.id_type   = vl_leak_type.id
	LEFT OUTER JOIN distribution.vl_leak_cause  ON leak.id_cause  = vl_leak_cause.id
	INNER      JOIN distribution.vl_leak_damage ON leak.id_damage = vl_leak_damage.id;



