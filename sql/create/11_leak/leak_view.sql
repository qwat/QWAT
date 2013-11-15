/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

DROP VIEW IF EXISTS distribution.od_leak_view CASCADE;
CREATE VIEW distribution.od_leak_view AS 
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
	FROM distribution.od_leak
	INNER      JOIN distribution.vl_leak_type   ON od_leak.id_type   = vl_leak_type.id
	LEFT OUTER JOIN distribution.vl_leak_cause  ON od_leak.id_cause  = vl_leak_cause.id
	INNER      JOIN distribution.vl_leak_damage ON od_leak.id_damage = vl_leak_damage.id;



