
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

/* TODO: maintenance */

DROP VIEW IF EXISTS distribution.valve_view CASCADE;
CREATE VIEW distribution.valve_view AS 
SELECT  
	valve.id                ,
	valve.identification    ,
	valve.id_type           ,
	valve.id_function       ,
	valve.id_precision      ,
	valve.id_maintenance    ,
	valve.id_pipe           ,
	valve.diameter_nominal  ,
	valve.year              ,
	valve.closed            ,
	valve.altitude_real     ,
	valve.remarks           ,
	valve.schema_force_view ,
	valve.id_node           ,
	valve.id_district       ,
	valve.id_pressurezone   ,
	valve.id_printmap       ,
	valve._printmaps        ,
	valve._districts        ,
	valve._schema_visible      ,
	valve.geometry::geometry(Point,21781)    ,
	vl_valve_function.value_fr AS _function    ,
	vl_valve_function.short_fr AS _function_shortname ,
	vl_valve_type.value_fr     AS _type        ,
	CASE 
		WHEN vl_valve_function.short_fr IS NULL THEN valve.identification::varchar
		ELSE vl_valve_function.short_fr || valve.identification::varchar
	END AS _label,
	node.altitude_dtm          AS _altitude_dtm,
	district.name              AS _district,
	pressurezone.name          AS _pressurezone,
	pressurezone.shortname     AS _pressurezone_shortname,
	pressurezone.colorcode     AS _pressurezone_colorcode
	FROM distribution.valve
	INNER JOIN      distribution.vl_valve_type     ON valve.id_type      = vl_valve_type.id
	INNER JOIN      distribution.vl_valve_function ON valve.id_function  = vl_valve_function.id
	LEFT OUTER JOIN distribution.node           ON valve.id_node         = node.id       
	LEFT OUTER JOIN distribution.district       ON valve.id_district     = district.id       
	LEFT OUTER JOIN distribution.pressurezone   ON valve.id_pressurezone = pressurezone.id;
	
