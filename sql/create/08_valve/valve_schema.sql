
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
		valve._printmaps,		valve.geometry_schematic::geometry(Point,21781) AS geometry,
		valve_function.function  AS _function,
		valve_function.shortname AS _function_shortname,
		valve_type.type          AS _type,
		CASE 
			WHEN valve_function.shortname IS NULL THEN valve.identification::varchar
			ELSE valve_function.shortname || valve.identification::varchar
		END AS _label,
		node.altitude_dtm          AS _altitude_dtm,
		district.name              AS _district,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
		pressurezone.colorcode     AS _pressurezone_colorcode
		FROM distribution.valve
		INNER JOIN distribution.valve_type     ON valve.id_function = valve_type.id
		INNER JOIN distribution.valve_function ON valve.id_function = valve_function.id
		LEFT OUTER JOIN distribution.node           ON valve.id_node         = node.id       
		LEFT OUTER JOIN distribution.district       ON valve.id_district     = district.id       
		LEFT OUTER JOIN distribution.pressurezone   ON valve.id_pressurezone = pressurezone.id
		WHERE  valve.schema_force_view IS TRUE 
		   OR (valve.schema_force_view IS NULL AND valve_function.schema_view IS TRUE);
		
		
CREATE OR REPLACE RULE valve_update_alternative AS
	ON UPDATE TO distribution.valve_schema DO INSTEAD
		UPDATE distribution.valve SET 
			geometry_schematic = NEW.geometry
		WHERE id = NEW.id;
		

