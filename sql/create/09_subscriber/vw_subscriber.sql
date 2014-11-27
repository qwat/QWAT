/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber view
*/

DROP VIEW IF EXISTS qwat.vw_subscriber CASCADE;
CREATE VIEW qwat.vw_subscriber AS 
	SELECT 
		od_subscriber.id			  ,
		od_subscriber.id_type         ,
		od_subscriber.id_pipe         ,
		od_subscriber.identification       ,
		od_subscriber._identification_full ,
		od_subscriber.parcel          ,
		od_subscriber.id_district     ,
		od_subscriber.id_pressurezone ,
		od_subscriber.id_printmap     ,
		od_subscriber._pressurezone   ,
		od_subscriber._printmaps      ,
		od_subscriber.geometry::geometry(Point,21781),	
		vl_subscriber_type.value_fr AS _type     ,
		od_district.name            AS _district ,
		od_pressurezone.colorcode   AS _pressurezone_colorcode
		FROM qwat.od_subscriber
		INNER      JOIN qwat.vl_subscriber_type ON od_subscriber.id_type         = vl_subscriber_type.id 
		LEFT OUTER JOIN qwat.od_district        ON od_subscriber.id_district     = od_district.id
		LEFT OUTER JOIN qwat.od_pressurezone    ON od_subscriber.id_pressurezone = od_pressurezone.id;
/* Comment */	
COMMENT ON VIEW qwat.vw_subscriber IS 'View for subscriber. This view is not editable ';


