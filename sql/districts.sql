/*
	qWat - QGIS Water Module
	
	SQL file :: districts
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.districts CASCADE;
CREATE TABLE distribution.districts (id serial NOT NULL);

ALTER TABLE distribution.districts ADD COLUMN  name varchar(30);

SELECT AddGeometryColumn('distribution', 'districts', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.districts ADD CONSTRAINT districts_pkey PRIMARY KEY (id);
ALTER TABLE distribution.districts ADD CONSTRAINT districts_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.districts IS 'Districts.';

COMMIT;
