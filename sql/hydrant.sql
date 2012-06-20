/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.hydrant CASCADE;
CREATE TABLE distribution.hydrant (id serial NOT NULL);
SELECT setval('distribution.hydrant_id_seq', 100, true);
COMMENT ON TABLE distribution.hydrant IS 'hydrant.';

/* columns */
ALTER TABLE distribution.hydrant ADD COLUMN  sige             character varying (15)  ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_type          integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_distributor   integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_status        integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_provider      integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_district      integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_pressurezone  integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_node          integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.hydrant ADD COLUMN  altitude         decimal(10,3)           ;
ALTER TABLE distribution.hydrant ADD COLUMN  model            varchar(30)             ;
ALTER TABLE distribution.hydrant ADD COLUMN  _is_on_map       varchar(30)             ;
ALTER TABLE distribution.hydrant ADD COLUMN  remarks          text                    ;

/*
partie inferieure
sortie centrale checkbox
plaque montee cb
emplacement
precis alti
statut
troncons
*/

/* geometry */
SELECT AddGeometryColumn('distribution', 'hydrant', 'geometry', 21781, 'POINT', 2);
CREATE INDEX hydrant_geoidx ON distribution.hydrant USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.hydrant_type(id)     MATCH FULL  ; CREATE INDEX fki_hydrant_id_type         ON distribution.hydrant(id_type)        ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)      MATCH FULL  ; CREATE INDEX fki_hydrant_id_distributor  ON distribution.hydrant(id_distributor) ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)           MATCH FULL  ; CREATE INDEX fki_hydrant_id_status       ON distribution.hydrant(id_status)      ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_provider     FOREIGN KEY (id_provider)     REFERENCES distribution.hydrant_provider(id) MATCH SIMPLE; CREATE INDEX fki_hydrant_id_provider     ON distribution.hydrant(id_provider)    ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)         MATCH SIMPLE; CREATE INDEX fki_hydrant_id_district     ON distribution.hydrant(id_district)    ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id)     MATCH SIMPLE; CREATE INDEX fki_hydrant_id_pressurezone ON distribution.hydrant(id_pressurezone);
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_node         FOREIGN KEY (id_node)         REFERENCES distribution.node(id)             MATCH SIMPLE; CREATE INDEX fki_hydrant_id_node         ON distribution.hydrant(id_node)        ;



/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.hydrant_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.hydrant SET 
			id_node            = distribution.node_get_id(NEW.geometry,false),
			id_district        = distribution.get_district_id(NEW.geometry),
			_is_on_map         = distribution.get_map(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.hydrant_geom() IS 'Fcn/Trigger: updates auto fields of the hydrant after insert/update.';

CREATE TRIGGER hydrant_geom_trigger_insert
	AFTER INSERT ON distribution.hydrant
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.hydrant_geom();
COMMENT ON TRIGGER hydrant_geom_trigger_insert ON distribution.hydrant IS 'Trigger: updates auto fields of the hydrant after insert.';

CREATE TRIGGER hydrant_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.hydrant 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.hydrant_geom();
COMMENT ON TRIGGER hydrant_geom_trigger_update ON distribution.hydrant IS 'Trigger: updates auto fields of the hydrant after geom update.';


COMMIT;
