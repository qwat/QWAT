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
ALTER TABLE distribution.installation ADD COLUMN  name            varchar(30) DEFAULT '';
ALTER TABLE distribution.installation ADD COLUMN  id_type         integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_distributor  integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_status       integer                ;
ALTER TABLE distribution.installation ADD COLUMN  remarks         text                    ;
ALTER TABLE distribution.installation ADD COLUMN  schema_force_view  boolean DEFAULT NULL::boolean;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_geoidx ON distribution.installation USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_type        FOREIGN KEY (id_type)        REFERENCES distribution.installation_type(id)    MATCH FULL; CREATE INDEX fki_installation_id_type        ON distribution.installation(id_type)        ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_distributor FOREIGN KEY (id_distributor) REFERENCES distribution.distributor(id)          MATCH FULL; CREATE INDEX fki_installation_id_distributor ON distribution.installation(id_distributor) ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_status      FOREIGN KEY (id_status)      REFERENCES distribution.status(id)               MATCH FULL; CREATE INDEX fki_installation_id_status      ON distribution.installation(id_status)      ;



COMMIT;
