/*
	qWat - QGIS Water Module
	
	SQL file :: district
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_district CASCADE;
CREATE TABLE distribution.od_district (id serial NOT NULL);
COMMENT ON TABLE distribution.od_district IS 'Districts.';

/* columns */
ALTER TABLE distribution.od_district ADD COLUMN name          varchar(40);
ALTER TABLE distribution.od_district ADD COLUMN shortname     varchar(12);
ALTER TABLE distribution.od_district ADD COLUMN zip           varchar(12);
ALTER TABLE distribution.od_district ADD COLUMN land_registry varchar(12);
ALTER TABLE distribution.od_district ADD COLUMN prefix        varchar(12);
ALTER TABLE distribution.od_district ADD COLUMN colorcode     smallint default 1;

/* geometry */
SELECT AddGeometryColumn('distribution', 'district', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX district_geoidx ON distribution.od_district USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.od_district ADD CONSTRAINT district_pkey PRIMARY KEY (id);
ALTER TABLE distribution.od_district ADD CONSTRAINT district_name UNIQUE (name);

ALTER TABLE distribution.od_district ADD CONSTRAINT district_nooverlap CHECK ( ST_Overlaps(geometry,district.geometry) IS False );


