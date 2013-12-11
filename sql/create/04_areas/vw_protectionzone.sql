/*
	qWat - QGIS Water Module
	
	SQL file :: protection zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS distribution.vw_protectionzone CASCADE;
CREATE VIEW distribution.vw_protectionzone AS 
	SELECT 
		od_protectionzone.*, 
		vl_protectionzone_type.value_fr AS _type_long,
		vl_protectionzone_type.short_fr AS _type
	FROM distribution.od_protectionzone
	INNER JOIN distribution.vl_protectionzone_type ON od_protectionzone.id_type = vl_protectionzone_type.id ;

