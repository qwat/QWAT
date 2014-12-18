/*
	qWat - QGIS Water Module
	
	SQL file :: protection zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS qwat.vw_protectionzone CASCADE;
CREATE VIEW qwat.vw_protectionzone AS 
	SELECT 
		od_protectionzone.*, 
		vl_protectionzone_type.value_fr AS _type_long,
		vl_protectionzone_type.short_fr AS _type
	FROM qwat.od_protectionzone
	INNER JOIN qwat.vl_protectionzone_type ON od_protectionzone.id_type = vl_protectionzone_type.id ;

