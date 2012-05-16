/*
	qWat - QGIS Water Module
	
	SQL file :: valves table
*/
BEGIN;
DROP TABLE IF EXISTS distribution.valves CASCADE;
CREATE TABLE distribution.valves (id serial NOT NULL);
COMMENT ON TABLE distribution.valves IS 'Table for valves.';

ALTER TABLE distribution.valves ADD COLUMN sige             integer ;
ALTER TABLE distribution.valves ADD COLUMN id_pipe          integer ;
ALTER TABLE distribution.valves ADD COLUMN id_node          integer ;
ALTER TABLE distribution.valves ADD COLUMN diameter_nominal varchar(10) ;
ALTER TABLE distribution.valves ADD COLUMN year            smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.valves ADD COLUMN closed           boolean default false ;
ALTER TABLE distribution.valves ADD COLUMN altitude_dtm     decimal(10,3) ;
ALTER TABLE distribution.valves ADD COLUMN altitude_real    decimal(10,3) ;
ALTER TABLE distribution.valves ADD COLUMN remarks          text           ;
ALTER TABLE distribution.valves ADD COLUMN _is_on_map varchar(80) DEFAULT '';      
ALTER TABLE distribution.valves ADD COLUMN _is_on_district varchar(100) DEFAULT '';

SELECT addGeometryColumn('distribution', 'valves', 'geometry', 21781, 'POINT', 2);

/*----------------!!!---!!!----------------*/
/* Add constraints */
/* primary key */
ALTER TABLE distribution.valves ADD CONSTRAINT valves_pkey PRIMARY KEY (id);
/* foreign keys */
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_pipe FOREIGN KEY (id_pipe) REFERENCES distribution.pipes(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_valves_id_pipe ON distribution.valves(id_pipe);
ALTER TABLE distribution.valves ADD CONSTRAINT valves_id_node FOREIGN KEY (id_node) REFERENCES distribution.nodes(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_valves_id_node ON distribution.valves(id_node);
/* GIST index*/
CREATE INDEX valves_geoidx ON distribution.valves USING GIST ( geometry );




/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.valves_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.valves SET 
			id_node            = distribution.node_get_id(NEW.geometry,false),
			id_pipe            = distribution.pipe_get_id(NEW.geometry),
			_is_on_map         = distribution.get_map(NEW.geometry),
			_is_on_district    = distribution.get_district(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.valves_geom() IS 'Fcn/Trigger: updates auto fields of the valve after insert/update.';

CREATE TRIGGER valves_geom_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.valves
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.valves_geom();
COMMENT ON TRIGGER valves_geom_trigger ON distribution.valves IS 'Trigger: updates auto fields of the valve after insert/update.';


COMMIT;

