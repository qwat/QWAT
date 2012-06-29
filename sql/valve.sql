/*
	qWat - QGIS Water Module
	
	SQL file :: valve table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.valve CASCADE;
CREATE TABLE distribution.valve (id serial , CONSTRAINT valve_pkey PRIMARY KEY (id));
COMMENT ON TABLE distribution.valve IS 'Table for valve.';

/* columns */
ALTER TABLE distribution.valve ADD COLUMN sige              integer ;
ALTER TABLE distribution.valve ADD COLUMN id_type           integer ;
ALTER TABLE distribution.valve ADD COLUMN id_function       integer ;
ALTER TABLE distribution.valve ADD COLUMN id_pipe           integer ;
ALTER TABLE distribution.valve ADD COLUMN id_node           integer ;
ALTER TABLE distribution.valve ADD COLUMN id_district       integer ;
ALTER TABLE distribution.valve ADD COLUMN id_maintenane     integer[] ;
ALTER TABLE distribution.valve ADD COLUMN diameter_nominal  varchar(10) ;
ALTER TABLE distribution.valve ADD COLUMN year              smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.valve ADD COLUMN closed            boolean     default false ;
ALTER TABLE distribution.valve ADD COLUMN altitude_dtm      decimal(10,3)  ;
ALTER TABLE distribution.valve ADD COLUMN altitude_real     decimal(10,3)  ;
ALTER TABLE distribution.valve ADD COLUMN remarks           text           ;
ALTER TABLE distribution.valve ADD COLUMN schema_force_view boolean     default NULL::boolean; 
ALTER TABLE distribution.valve ADD COLUMN _is_on_map        varchar(80) default '' ;      


/* geometry */
SELECT addGeometryColumn('distribution', 'valve', 'geometry', 21781, 'POINT', 2);
SELECT addGeometryColumn('distribution', 'valve', 'geometry_schematic', 21781, 'POINT', 2);
CREATE INDEX valve_geoidx     ON distribution.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt ON distribution.valve USING GIST ( geometry_schematic );

/* constraints */
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_type        FOREIGN KEY (id_type)        REFERENCES distribution.valve_type(id)        MATCH FULL   ; CREATE INDEX fki_valve_id_type        ON distribution.valve(id_type)        ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_function    FOREIGN KEY (id_function)    REFERENCES distribution.valve_function(id)    MATCH FULL   ; CREATE INDEX fki_valve_id_function    ON distribution.valve(id_function)    ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_pipe        FOREIGN KEY (id_pipe)        REFERENCES distribution.pipe(id)              MATCH SIMPLE ; CREATE INDEX fki_valve_id_pipe        ON distribution.valve(id_pipe)        ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_node        FOREIGN KEY (id_node)        REFERENCES distribution.node(id)              MATCH SIMPLE ; CREATE INDEX fki_valve_id_node        ON distribution.valve(id_node)        ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_district    FOREIGN KEY (id_district)    REFERENCES distribution.district(id)          MATCH SIMPLE ; CREATE INDEX fki_valve_id_district    ON distribution.valve(id_district)    ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES distribution.valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON distribution.valve(id_maintenance) ;


/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.valve_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.valve SET 
			id_node            = distribution.node_get_id(NEW.geometry,false),
			id_pipe            = distribution.pipe_get_id(NEW.geometry),
			id_district        = distribution.get_district_id(NEW.geometry),
			_is_on_map         = distribution.get_map(NEW.geometry),
			geometry_schematic = NEW.geometry
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.valve_geom() IS 'Fcn/Trigger: updates auto fields of the valve after insert/update.';

CREATE TRIGGER valve_geom_trigger_insert
	AFTER INSERT ON distribution.valve
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.valve_geom();
COMMENT ON TRIGGER valve_geom_trigger_insert ON distribution.valve IS 'Trigger: updates auto fields of the valve after insert.';

CREATE TRIGGER valve_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.valve 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.valve_geom();
COMMENT ON TRIGGER valve_geom_trigger_update ON distribution.valve IS 'Trigger: updates auto fields of the valve after update.';


COMMIT;

