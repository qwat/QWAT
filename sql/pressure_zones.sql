/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.pressure_zones CASCADE;
CREATE TABLE distribution.pressure_zones (id serial NOT NULL);

ALTER TABLE distribution.pressure_zones ADD COLUMN  short_name    varchar(10);
ALTER TABLE distribution.pressure_zones ADD COLUMN  name          varchar(30);
ALTER TABLE distribution.pressure_zones ADD COLUMN  consummer_zone varchar(30);

SELECT AddGeometryColumn('distribution', 'pressure_zones', 'geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.pressure_zones ADD CONSTRAINT pressure_zones_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pressure_zones ADD CONSTRAINT pressure_zones_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.pressure_zones IS 'Pressure zones.';
                 
COMMIT;
