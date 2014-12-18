
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

/* TODO: maintenance */

DROP VIEW IF EXISTS qwat.vw_valve CASCADE;
CREATE VIEW qwat.vw_valve AS 
SELECT  
	od_valve.id                ,
	od_valve.identification    ,
	od_valve.id_type           ,
	od_valve.id_function       ,
	od_valve.id_status         ,
	od_valve.id_precision      ,
	od_valve.id_maintenance    ,
	od_valve.id_pipe           ,
	od_valve.diameter_nominal  ,
	od_valve.year              ,
	od_valve.closed            ,
	od_valve.altitude_real     ,
	od_valve.remark            ,
	od_valve.schema_force_view ,
	od_valve.id_node           ,
	od_valve.id_district       ,
	od_valve.id_pressurezone   ,
	od_valve.id_printmap       ,
	od_valve._district         ,
	od_valve._pressurezone     ,
	od_valve._printmaps        ,
	od_valve._schema_visible      ,
	od_valve.geometry::geometry(Point,21781)    ,
	vl_valve_function.value_fr AS _function    ,
	vl_valve_function.short_fr AS _function_shortname ,
	vl_valve_type.value_fr     AS _type        ,
	CASE 
		WHEN vl_valve_function.short_fr IS NULL THEN od_valve.identification::varchar
		ELSE vl_valve_function.short_fr || od_valve.identification::varchar
	END AS _label,
	vl_status.value_fr          AS _status,
	vl_status.active            AS _status_active,
	od_node.altitude_dtm       AS _altitude_dtm,
	od_pressurezone.colorcode  AS _pressurezone_colorcode
	FROM qwat.od_valve
	INNER JOIN      qwat.vl_valve_type     ON od_valve.id_type         = vl_valve_type.id
	INNER JOIN      qwat.vl_valve_function ON od_valve.id_function     = vl_valve_function.id
	INNER      JOIN qwat.vl_status         ON od_valve.id_status       = vl_status.id
	LEFT OUTER JOIN qwat.od_node           ON od_valve.id_node         = od_node.id       
	LEFT OUTER JOIN qwat.od_district       ON od_valve.id_district     = od_district.id       
	LEFT OUTER JOIN qwat.od_pressurezone   ON od_valve.id_pressurezone = od_pressurezone.id;
	
