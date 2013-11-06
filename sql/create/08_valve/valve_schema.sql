
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view for alternative geometry
*/



DROP VIEW IF EXISTS distribution.valve_schema CASCADE;		
CREATE VIEW distribution.valve_schema AS 
	SELECT  
		valve.id , 
		valve.identification,
		valve.id_type,
		valve.id_function,
		valve.id_pipe,
		valve.id_maintenance,
		valve.diameter_nominal,
		valve.year,
		valve.closed,
		valve.altitude_real,
		valve.remarks,
		valve.schema_force_view,
		valve.id_node,
		valve.id_district,
		valve.id_pressurezone,
		valve._districts,
		valve._printmaps,		
		valve.geometry_schematic::geometry(Point,21781) AS geometry,
		vl_valve_function.value_fr AS _function,
		vl_valve_function.short_fr AS _function_shortname,
		vl_valve_type.value_fr     AS _type,
		CASE 
			WHEN vl_valve_function.short_fr IS NULL THEN valve.identification::varchar
			ELSE vl_valve_function.short_fr || valve.identification::varchar
		END AS _label,
		node.altitude_dtm       AS _altitude_dtm,
		district.name           AS _district,
		pressurezone.name       AS _pressurezone,
		pressurezone.shortname  AS _pressurezone_shortname,
		pressurezone.colorcode  AS _pressurezone_colorcode
		FROM distribution.valve
		INNER JOIN distribution.vl_valve_type     ON valve.id_function = vl_valve_type.id
		INNER JOIN distribution.vl_valve_function ON valve.id_function = vl_valve_function.id
		LEFT OUTER JOIN distribution.node         ON valve.id_node         = node.id       
		LEFT OUTER JOIN distribution.district     ON valve.id_district     = district.id       
		LEFT OUTER JOIN distribution.pressurezone ON valve.id_pressurezone = pressurezone.id
		WHERE valve._schema_view IS TRUE;
		
		
CREATE OR REPLACE RULE valve_update_alternative AS
	ON UPDATE TO distribution.valve_schema DO INSTEAD
		UPDATE distribution.valve SET 
			geometry_schematic = NEW.geometry
		WHERE id = NEW.id;
		

