/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.zones CASCADE;
CREATE TABLE distribution.zones (id serial NOT NULL);

ALTER TABLE distribution.zones ADD COLUMN  short_name    varchar(10);
ALTER TABLE distribution.zones ADD COLUMN  name          varchar(30);
ALTER TABLE distribution.zones ADD COLUMN  conummer_zone varchar(30);

SELECT AddGeometryColumn('distribution', 'zones', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.zones ADD CONSTRAINT zones_pkey PRIMARY KEY (id);
ALTER TABLE distribution.zones ADD CONSTRAINT zones_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.zones IS 'pressure zones.';
                      
COMMIT;
