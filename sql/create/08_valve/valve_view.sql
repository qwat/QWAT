
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

/* TODO: maintenance */



DROP VIEW IF EXISTS distribution.valve_view CASCADE;
CREATE VIEW distribution.valve_view AS 
SELECT  
	valve.id                ,
	valve.identification              ,
	valve.id_type           ,
	valve.id_function       ,
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
	valve._schema_view      ,
	valve.geometry::geometry(Point,21781)    ,
	valve_function.name      AS _function    ,
	valve_function.shortname AS _function_shortname ,
	valve_type.type          AS _type        ,
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
	INNER JOIN      distribution.valve_type     ON valve.id_type         = valve_type.id
	INNER JOIN      distribution.valve_function ON valve.id_function     = valve_function.id
	LEFT OUTER JOIN distribution.node           ON valve.id_node         = node.id       
	LEFT OUTER JOIN distribution.district       ON valve.id_district     = district.id       
	LEFT OUTER JOIN distribution.pressurezone   ON valve.id_pressurezone = pressurezone.id;
	
/*	
CREATE OR REPLACE RULE valve_update AS
	ON UPDATE TO distribution.valve_view DO INSTEAD
		UPDATE distribution.valve SET 
			identification                 = NEW.identification             ,		
			id_type              = NEW.id_type          ,		
			id_function          = NEW.id_function      ,				
			id_district          = NEW.id_district      ,		
			id_pressurezone      = NEW.id_pressurezone  ,		
			id_maintenance       = NEW.id_maintenance   ,		
			diameter_nominal     = NEW.diameter_nominal ,		
			"year"               = NEW."year"           ,		
			closed               = NEW.closed           ,				
			altitude_real        = NEW.altitude_real    ,		
			remarks              = NEW.remarks          ,		
			schema_force_view    = NEW.schema_force_view,
			geometry             = NEW.geometry
		WHERE id = NEW.id;
		
CREATE OR REPLACE RULE valve_insert AS
	ON INSERT TO distribution.valve_view DO INSTEAD
		INSERT INTO distribution.valve 
			(    identification,    id_type,    id_function,    id_district,    id_pressurezone,    id_maintenance,    diameter_nominal,    year,    closed,    altitude_real,    remarks,    schema_force_view,    geometry)     
		VALUES
			(NEW.identification,NEW.id_type,NEW.id_function,NEW.id_district,NEW.id_pressurezone,NEW.id_maintenance,NEW.diameter_nominal,NEW.year,NEW.closed,NEW.altitude_real,NEW.remarks,NEW.schema_force_view,NEW.geometry);
			
CREATE OR REPLACE RULE valve_delete AS
	ON DELETE TO distribution.valve_view DO INSTEAD
		DELETE FROM distribution.valve WHERE id = OLD.id;
*/

