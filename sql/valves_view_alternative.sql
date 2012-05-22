
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view for alternative geometry
*/

BEGIN;

DROP VIEW IF EXISTS distribution.valves_view_alternative CASCADE;		
CREATE VIEW distribution.valves_view_alternative AS 
	SELECT  
		valves.id , 
		valves.sige,
		valves.id_type,
		valves.id_function,
		valves.id_pipe,
		valves.id_node,
		valves.diameter_nominal,
		valves.year,
		valves.closed,
		valves.altitude_dtm,
		valves.altitude_real,
		valves.remarks,
		valves.schema_force_view,
		valves._is_on_map,
		valves._is_on_district,
		valves.geometry_alternative::geometry(Point,21781),
		valves_function.function,
		valves_type.type
		FROM distribution.valves
		INNER JOIN distribution.valves_type     ON valves.id_function = valves_type.id
		INNER JOIN distribution.valves_function ON valves.id_function = valves_function.id
		WHERE  valves.schema_force_view IS TRUE 
		   OR (valves.schema_force_view IS NULL AND valves_function.schema_view IS TRUE);
		
		
CREATE OR REPLACE RULE valves_update_alternative AS
	ON UPDATE TO distribution.valves_view_alternative DO INSTEAD
		UPDATE distribution.valves SET 
			geometry_alternative = NEW.geometry_alternative
		WHERE id = NEW.id;
		
COMMIT;
