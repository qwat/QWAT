/*
	qWat - QGIS Water Module
	
	SQL file :: district
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.district CASCADE;
CREATE TABLE distribution.district (id serial NOT NULL);
COMMENT ON TABLE distribution.district IS 'Districts.';

/* columns */
ALTER TABLE distribution.district ADD COLUMN  name               varchar(40);
ALTER TABLE distribution.district ADD COLUMN  shortname          varchar(12);
ALTER TABLE distribution.district ADD COLUMN  zip                varchar(12);
ALTER TABLE distribution.district ADD COLUMN  land_registry      varchar(12);
ALTER TABLE distribution.district ADD COLUMN  subscriber_prefix  varchar(12);
ALTER TABLE distribution.district ADD COLUMN  colorcode          smallint default 1;

/* geometry */
SELECT AddGeometryColumn('distribution', 'district', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX district_geoidx ON distribution.district USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.district ADD CONSTRAINT district_pkey PRIMARY KEY (id);
ALTER TABLE distribution.district ADD CONSTRAINT district_name UNIQUE (name);

ALTER TABLE distribution.district ADD CONSTRAINT district_nooverlap CHECK ( ST_Overlaps(geometry,district.geometry) IS False );


