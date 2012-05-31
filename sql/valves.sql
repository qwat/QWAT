/*
	qWat - QGIS Water Module
	
	SQL file :: valves table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.valves CASCADE;
CREATE TABLE distribution.valves (id serial NOT NULL);
COMMENT ON TABLE distribution.valves IS 'Table for valves.';

/* columns */
ALTER TABLE distribution.valves ADD COLUMN sige             integer ;
ALTER TABLE distribution.valves ADD COLUMN id_type          integer ;
ALTER TABLE distribution.valves ADD COLUMN id_function      integer ;
ALTER TABLE distribution.valves ADD COLUMN id_pipe          integer ;
ALTER TABLE distribution.valves ADD COLUMN id_node          integer ;
ALTER TABLE distribution.valves ADD COLUMN diameter_nominal varchar(10) ;
ALTER TABLE distribution.valves ADD COLUMN year            smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.valves ADD COLUMN closed           boolean default false ;
ALTER TABLE distribution.valves ADD COLUMN altitude_dtm     decimal(10,3) ;
ALTER TABLE distribution.valves ADD COLUMN altitude_real    decimal(10,3) ;
ALTER TABLE distribution.valves ADD COLUMN remarks          text           ;
ALTER TABLE distribution.valves ADD COLUMN schema_force_view  boolean DEFAULT NULL::boolean; 
ALTER TABLE distribution.valves ADD COLUMN _is_on_map varchar(80) DEFAULT '';      
ALTER TABLE distribution.valves ADD COLUMN _is_on_district varchar(100) DEFAULT '';

/* geometry */
SELECT addGeometryColumn('distribution', 'valves', 'geometry', 21781, 'POINT', 2);
SELECT addGeometryColumn('distribution', 'valves', 'geometry_alternative', 21781, 'POINT', 2);
CREATE INDEX valves_geoidx     ON distribution.valves USING GIST ( geometry );
CREATE INDEX valves_geoidx_alt ON distribution.valves USING GIST ( geometry_alternative );

/* constraints */
ALTER TABLE distribution.valves ADD CONSTRAINT valves_pkey PRIMARY KEY (id);
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_type     FOREIGN KEY (id_type)     REFERENCES distribution.valves_type(id)     MATCH FULL ;  CREATE INDEX fki_valves_id_type ON distribution.valves(id_type);
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_function FOREIGN KEY (id_function) REFERENCES distribution.valves_function(id) MATCH FULL ;  CREATE INDEX fki_valves_id_function ON distribution.valves(id_function);
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_pipe     FOREIGN KEY (id_pipe)     REFERENCES distribution.pipes(id)           MATCH SIMPLE ; CREATE INDEX fki_valves_id_pipe ON distribution.valves(id_pipe);
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_node     FOREIGN KEY (id_node)     REFERENCES distribution.nodes(id)           MATCH SIMPLE ; CREATE INDEX fki_valves_id_node ON distribution.valves(id_node);


/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.valves_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.valves SET 
			id_node              = distribution.node_get_id(NEW.geometry,false),
			id_pipe              = distribution.pipe_get_id(NEW.geometry),
			_is_on_map           = distribution.get_map(NEW.geometry),
			_is_on_district      = distribution.get_district(NEW.geometry),
			geometry_alternative = NEW.geometry
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.valves_geom() IS 'Fcn/Trigger: updates auto fields of the valve after insert/update.';

CREATE TRIGGER valves_geom_trigger_insert
	AFTER INSERT ON distribution.valves
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.valves_geom();
COMMENT ON TRIGGER valves_geom_trigger_insert ON distribution.valves IS 'Trigger: updates auto fields of the valve after insert.';

CREATE TRIGGER valves_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.valves 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.valves_geom();
COMMENT ON TRIGGER valves_geom_trigger_update ON distribution.valves IS 'Trigger: updates auto fields of the valve after update.';


COMMIT;

