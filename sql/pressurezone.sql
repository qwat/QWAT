/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.pressurezone CASCADE;
CREATE TABLE distribution.pressurezone (id serial NOT NULL);
COMMENT ON TABLE distribution.pressurezone IS 'Pressure zones.';

/* columns */
ALTER TABLE distribution.pressurezone ADD COLUMN short_name    varchar(10);
ALTER TABLE distribution.pressurezone ADD COLUMN name          varchar(30);
ALTER TABLE distribution.pressurezone ADD COLUMN consummer_zone varchar(30);

/* geometry */
SELECT AddGeometryColumn('distribution', 'pressurezone', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX pressurezone_geoidx ON distribution.pressurezone USING GIST ( geometry ); 

/* constraints */
ALTER TABLE distribution.pressurezone ADD CONSTRAINT pressurezone_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);

                 
COMMIT;
