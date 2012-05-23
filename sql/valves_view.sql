
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.valves_view CASCADE;
CREATE VIEW distribution.valves_view AS 
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
		valves.geometry::geometry(Point,21781),
		valves_function.function AS _function,
		valves_function.shortname AS _function_shortname,
		valves_type.type AS _type,
		CASE 
			WHEN valves_function.shortname IS NULL THEN valves.sige::varchar
			ELSE valves_function.shortname || valves.sige::varchar
		END AS _label,
		CASE 
			WHEN valves.schema_force_view IS NULL THEN valves_function.schema_view
			ELSE valves.schema_force_view
		END AS _schema_view
		FROM distribution.valves
		INNER JOIN distribution.valves_type     ON valves.id_function = valves_type.id
		INNER JOIN distribution.valves_function ON valves.id_function = valves_function.id;
		
CREATE OR REPLACE RULE valves_update AS
	ON UPDATE TO distribution.valves_view DO INSTEAD
		UPDATE distribution.valves SET 
			sige                 = NEW.sige,		
			id_type              = NEW.id_type,		
			id_function          = NEW.id_function,		
			id_pipe              = NEW.id_pipe,		
			id_node              = NEW.id_node,		
			diameter_nominal     = NEW.diameter_nominal,		
			"year"               = NEW."year",		
			closed               = NEW.closed,		
			altitude_dtm         = NEW.altitude_dtm,		
			altitude_real        = NEW.altitude_real,		
			remarks              = NEW.remarks,		
			schema_force_view    = NEW.schema_force_view,
			geometry             = NEW.geometry
		WHERE id = NEW.id;
		
CREATE OR REPLACE RULE valves_insert AS
	ON INSERT TO distribution.valves_view DO INSTEAD
		INSERT INTO distribution.valves 
			(     sige,    id_type,     id_function,    id_pipe,    id_node,    diameter_nominal,    year,    closed,    altitude_dtm,    altitude_real,    remarks,    schema_force_view,    geometry)     
		VALUES
			(NEW.sige,NEW.id_type,NEW.id_function,NEW.id_pipe,NEW.id_node,NEW.diameter_nominal,NEW.year,NEW.closed,NEW.altitude_dtm,NEW.altitude_real,NEW.remarks,NEW.schema_force_view,NEW.geometry);
			
CREATE OR REPLACE RULE valves_delete AS
	ON DELETE TO distribution.valves_view DO INSTEAD
		DELETE FROM distribution.valves WHERE id = OLD.id;

COMMIT;
