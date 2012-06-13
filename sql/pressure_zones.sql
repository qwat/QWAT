/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.pressurezones CASCADE;
CREATE TABLE distribution.pressurezones (id serial NOT NULL);
COMMENT ON TABLE distribution.pressurezones IS 'Pressure zones.';

/* columns */
ALTER TABLE distribution.pressurezones ADD COLUMN  short_name    varchar(10);
ALTER TABLE distribution.pressurezones ADD COLUMN  name          varchar(30);
ALTER TABLE distribution.pressurezones ADD COLUMN  consummer_zone varchar(30);

/* geometry */
SELECT AddGeometryColumn('distribution', 'pressurezones', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX pressurezones_geoidx ON distribution.pressurezones USING GIST ( geometry ); 

/* constraints */
ALTER TABLE distribution.pressurezones ADD CONSTRAINT pressurezones_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pressurezones ADD CONSTRAINT pressurezones_name UNIQUE (name);

                 
COMMIT;
