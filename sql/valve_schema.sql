
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view for alternative geometry
*/

BEGIN;

DROP VIEW IF EXISTS distribution.valve_schema CASCADE;		
CREATE VIEW distribution.valve_schema AS 
	SELECT  
		valve.id , 
		valve.sige,
		valve.id_type,
		valve.id_function,
		valve.id_pipe,
		valve.id_node,
		valve.id_district,
		valve.id_maintenance,
		valve.diameter_nominal,
		valve.year,
		valve.closed,
		valve.altitude_dtm,
		valve.altitude_real,
		valve.remarks,
		valve.schema_force_view,
		valve._is_on_map,
		valve.geometry_schematic::geometry(Point,21781) AS geometry,
		valve_function.function AS _function,
		valve_function.shortname AS _function_shortname,
		valve_type.type AS _type,
		CASE 
			WHEN valve_function.shortname IS NULL THEN valve.sige::varchar
			ELSE valve_function.shortname || valve.sige::varchar
		END AS _label
		FROM distribution.valve
		INNER JOIN distribution.valve_type     ON valve.id_function = valve_type.id
		INNER JOIN distribution.valve_function ON valve.id_function = valve_function.id
		WHERE  valve.schema_force_view IS TRUE 
		   OR (valve.schema_force_view IS NULL AND valve_function.schema_view IS TRUE);
		
		
CREATE OR REPLACE RULE valve_update_alternative AS
	ON UPDATE TO distribution.valve_schema DO INSTEAD
		UPDATE distribution.valve SET 
			geometry_schematic = NEW.geometry
		WHERE id = NEW.id;
		
COMMIT;
