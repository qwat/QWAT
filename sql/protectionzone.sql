/*
	qWat - QGIS Water Module
	
	SQL file :: protection zone
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.protectionzone CASCADE;
CREATE TABLE distribution.protectionzone (id serial NOT NULL);
COMMENT ON TABLE distribution.protectionzone IS 'protectionzones.';

/* columns */
ALTER TABLE distribution.protectionzone ADD COLUMN  id_type            integer;
ALTER TABLE distribution.protectionzone ADD COLUMN  name               varchar(40);
ALTER TABLE distribution.protectionzone ADD COLUMN  definitive         boolean     default True;
ALTER TABLE distribution.protectionzone ADD COLUMN  date_accepted      date;
ALTER TABLE distribution.protectionzone ADD COLUMN  agent              varchar(12);

/* geometry */
SELECT AddGeometryColumn('distribution', 'protectionzone', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX protectionzone_geoidx ON distribution.protectionzone USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.protectionzone ADD CONSTRAINT protectionzone_pkey PRIMARY KEY (id);
ALTER TABLE distribution.protectionzone ADD CONSTRAINT protectionzone_name UNIQUE (name);
ALTER TABLE distribution.protectionzone ADD CONSTRAINT protectionzone_id_type FOREIGN KEY (id_type) REFERENCES distribution.protectionzone_type (id) MATCH FULL ; CREATE INDEX fki_protectionzone_id_type ON distribution.protectionzone(id_type);

COMMIT;
