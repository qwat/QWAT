
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.valve_view CASCADE;
CREATE VIEW distribution.valve_view AS 
	SELECT  
		valve.id , 
		valve.sige,
		valve.id_type,
		valve.id_function,
		valve.id_pipe,
		valve.id_node,
		valve.id_district       ,
		valve.id_maintenance    ,
		valve.diameter_nominal  ,
		valve.year              ,
		valve.closed            ,
		valve.altitude_dtm      ,
		valve.altitude_real     ,
		valve.remarks           ,
		valve.schema_force_view ,
		valve._is_on_map        ,
		valve.geometry::geometry(Point,21781)    ,
		valve_function.function  AS _function    ,
		valve_function.shortname AS _function_shortname ,
		valve_type.type          AS _type        ,
		district.name            AS _district    ,
		CASE 
			WHEN valve_function.shortname IS NULL THEN valve.sige::varchar
			ELSE valve_function.shortname || valve.sige::varchar
		END AS _label,
		CASE 
			WHEN valve.schema_force_view IS NULL THEN valve_function.schema_view
			ELSE valve.schema_force_view
		END AS _schema_view
		FROM distribution.valve
		INNER JOIN distribution.valve_type     ON valve.id_type     = valve_type.id
		INNER JOIN distribution.valve_function ON valve.id_function = valve_function.id
		LEFT OUTER JOIN distribution.district  ON valve.id_district = district.id ;
		
CREATE OR REPLACE RULE valve_update AS
	ON UPDATE TO distribution.valve_view DO INSTEAD
		UPDATE distribution.valve SET 
			sige                 = NEW.sige             ,		
			id_type              = NEW.id_type          ,		
			id_function          = NEW.id_function      ,		
			id_pipe              = NEW.id_pipe          ,		
			id_node              = NEW.id_node          ,		
			id_maintenance       = NEW.id_maintenance   ,		
			diameter_nominal     = NEW.diameter_nominal ,		
			"year"               = NEW."year"           ,		
			closed               = NEW.closed           ,		
			altitude_dtm         = NEW.altitude_dtm     ,		
			altitude_real        = NEW.altitude_real    ,		
			remarks              = NEW.remarks          ,		
			schema_force_view    = NEW.schema_force_view,
			geometry             = NEW.geometry
		WHERE id = NEW.id;
		
CREATE OR REPLACE RULE valve_insert AS
	ON INSERT TO distribution.valve_view DO INSTEAD
		INSERT INTO distribution.valve 
			(    sige,    id_type,    id_function,    id_pipe,    id_node,    id_maintenance,    diameter_nominal,    year,    closed,    altitude_dtm,    altitude_real,    remarks,    schema_force_view,    geometry)     
		VALUES
			(NEW.sige,NEW.id_type,NEW.id_function,NEW.id_pipe,NEW.id_node,NEW.id_maintenance,NEW.diameter_nominal,NEW.year,NEW.closed,NEW.altitude_dtm,NEW.altitude_real,NEW.remarks,NEW.schema_force_view,NEW.geometry);
			
CREATE OR REPLACE RULE valve_delete AS
	ON DELETE TO distribution.valve_view DO INSTEAD
		DELETE FROM distribution.valve WHERE id = OLD.id;

COMMIT;
