/*
	qWat - QGIS Water Module
	
	SQL file :: installations
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installations CASCADE;
CREATE TABLE distribution.installations (id serial NOT NULL);
SELECT setval('distribution.installations_id_seq', 100, true);
COMMENT ON TABLE distribution.installations IS 'installations.';

/* columns */
ALTER TABLE distribution.installations ADD COLUMN  name            varchar(30) DEFAULT '';
ALTER TABLE distribution.installations ADD COLUMN  id_type         integer                ;
ALTER TABLE distribution.installations ADD COLUMN  id_distributor  integer                ;
ALTER TABLE distribution.installations ADD COLUMN  id_status       integer                ;
ALTER TABLE distribution.installations ADD COLUMN  remarks         text                    ;
ALTER TABLE distribution.installations ADD COLUMN  schema_force_view  boolean DEFAULT NULL::boolean;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installations', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installations_geoidx ON distribution.installations USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installations ADD CONSTRAINT installations_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.installations ADD CONSTRAINT installations_id_type        FOREIGN KEY (id_type)        REFERENCES distribution.installations_type(id)   MATCH FULL; CREATE INDEX fki_installations_id_type        ON distribution.installations(id_type)        ;
ALTER TABLE distribution.installations ADD CONSTRAINT installations_id_distributor FOREIGN KEY (id_distributor) REFERENCES distribution.distributor(id)          MATCH FULL; CREATE INDEX fki_installations_id_distributor ON distribution.installations(id_distributor) ;
ALTER TABLE distribution.installations ADD CONSTRAINT installations_id_status      FOREIGN KEY (id_status)      REFERENCES distribution.status(id)               MATCH FULL; CREATE INDEX fki_installations_id_status      ON distribution.installations(id_status)      ;



COMMIT;
