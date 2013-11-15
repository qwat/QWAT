/*
	qWat - QGIS Water Module
	
	SQL file :: protection view
*/

DROP VIEW IF EXISTS distribution.vw_protectionzone CASCADE;
CREATE VIEW distribution.vw_protectionzone AS 
	SELECT 
		od_protectionzone.id         ,
		od_protectionzone.id_type    ,
		od_protectionzone.name       ,
		od_protectionzone.validated  ,
		od_protectionzone.date       ,
		od_protectionzone.agent      ,
		od_protectionzone.geometry::geometry(MultiPolygon,21781),	
		vl_protectionzone_type.short_fr AS _type     ,
		vl_protectionzone_type.value_fr AS _typelong
		FROM distribution.od_protectionzone
		INNER JOIN distribution.vl_protectionzone_type ON od_protectionzone.id_type = vl_protectionzone_type.id;
/* Comment */	
COMMENT ON VIEW distribution.vw_protectionzone IS 'View for protectionzone. This view is not editable.';


