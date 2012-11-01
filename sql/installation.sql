/*
	qWat - QGIS Water Module
	
	SQL file :: installation
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation CASCADE;
CREATE TABLE distribution.installation (id serial NOT NULL);
SELECT setval('distribution.installation_id_seq', 100, true);
COMMENT ON TABLE distribution.installation IS 'installation.';

/* columns */
ALTER TABLE distribution.installation ADD COLUMN  name               varchar(30) DEFAULT '' ;
ALTER TABLE distribution.installation ADD COLUMN  sige               integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_status          integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_distributor     integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_type            integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_node            integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_district        integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_pressurezone    integer                ;
ALTER TABLE distribution.installation ADD COLUMN  remarks            text                   ;
ALTER TABLE distribution.installation ADD COLUMN  year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.installation ADD COLUMN  schema_force_view  boolean DEFAULT NULL::boolean;
ALTER TABLE distribution.installation ADD COLUMN  altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.installation ADD COLUMN  _is_on_map         varchar(30)            ;
ALTER TABLE distribution.installation ADD COLUMN  open_water_surface boolean DEFAULT False  ;
ALTER TABLE distribution.installation ADD COLUMN  parcel             varchar(30)            ;
ALTER TABLE distribution.installation ADD COLUMN  eca                varchar(30)            ;


/* geometry */
SELECT AddGeometryColumn('distribution', 'installation', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_geoidx ON distribution.installation USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)       MATCH FULL; CREATE INDEX fki_installation_id_distributor    ON distribution.installation(id_distributor) ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)            MATCH FULL; CREATE INDEX fki_installation_id_status         ON distribution.installation(id_status)      ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.installation_type(id) MATCH FULL; CREATE INDEX fki_installation_id_type           ON distribution.installation(id_type)        ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_node         FOREIGN KEY (id_node)         REFERENCES distribution.node(id)              MATCH SIMPLE; CREATE INDEX fki_installation_id_node         ON distribution.installation(id_node)        ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)          MATCH SIMPLE; CREATE INDEX fki_installation_id_district     ON distribution.installation(id_district)    ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id)      MATCH SIMPLE; CREATE INDEX fki_installation_id_pressurezone ON distribution.installation(id_pressurezone);


/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.installation_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.installation SET 
			id_node            = distribution.node_get_id(NEW.geometry,false),
			id_district        = distribution.get_district_id(NEW.geometry),
			id_pressurezone    = distribution.get_pressurezone_id(NEW.geometry),
			_is_on_map         = distribution.get_map(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.installation_geom() IS 'Fcn/Trigger: updates auto fields of the installation after insert/update.';

CREATE TRIGGER installation_geom_trigger_insert
	AFTER INSERT ON distribution.installation
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.installation_geom();
COMMENT ON TRIGGER installation_geom_trigger_insert ON distribution.installation IS 'Trigger: updates auto fields of the installation after insert.';

CREATE TRIGGER installation_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.installation 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.installation_geom();
COMMENT ON TRIGGER installation_geom_trigger_update ON distribution.installation IS 'Trigger: updates auto fields of the installation after geom update.';


COMMIT;
