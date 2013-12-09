/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint view
*/

DROP VIEW IF EXISTS distribution.vw_samplingpoint CASCADE;
CREATE VIEW distribution.vw_samplingpoint AS 
	SELECT  
		od_samplingpoint.id             ,
		od_samplingpoint.identification ,
		od_samplingpoint.id_district    ,
		od_samplingpoint.id_printmap    ,
		od_samplingpoint.id_pressurezone,
		od_samplingpoint._district      ,
		od_samplingpoint._pressurezone  ,
		od_samplingpoint._printmaps     ,
		od_samplingpoint.remark         ,
		od_samplingpoint.geometry::geometry(Point,21781),
		od_pressurezone.colorcode     AS _pressurezone_colorcode
		FROM distribution.od_samplingpoint
		LEFT OUTER JOIN distribution.od_district      ON od_samplingpoint.id_district     = od_district.id       
		LEFT OUTER JOIN  distribution.od_pressurezone ON od_samplingpoint.id_pressurezone = od_pressurezone.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.vw_samplingpoint IS 'View for samplingpoint. This view is not editable.';
