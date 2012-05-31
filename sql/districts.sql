/*
	qWat - QGIS Water Module
	
	SQL file :: districts
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.districts CASCADE;
CREATE TABLE distribution.districts (id serial NOT NULL);
COMMENT ON TABLE distribution.districts IS 'Districts.';

/* columns */
ALTER TABLE distribution.districts ADD COLUMN  name  varchar(40);
ALTER TABLE distribution.districts ADD COLUMN  shortname  varchar(12);
ALTER TABLE distribution.districts ADD COLUMN  zip  varchar(12);
ALTER TABLE distribution.districts ADD COLUMN  land_registry  varchar(12);
ALTER TABLE distribution.districts ADD COLUMN  subscriber_prefix  varchar(12);

ALTER TABLE distribution.districts ADD COLUMN  lbl_x double precision;
ALTER TABLE distribution.districts ADD COLUMN  lbl_y double precision;
ALTER TABLE distribution.districts ADD COLUMN  lbl_a double precision;

/* geometry */
SELECT AddGeometryColumn('distribution', 'districts', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX districts_geoidx ON distribution.districts USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.districts ADD CONSTRAINT districts_pkey PRIMARY KEY (id);
ALTER TABLE distribution.districts ADD CONSTRAINT districts_name UNIQUE (name);


/*----------------!!!---!!!----------------*/
/* get districts function */
CREATE OR REPLACE FUNCTION distribution.get_district(geometry) RETURNS text AS '
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT left(distribution.tsum(districts.name || '', ''),-2) INTO result
			FROM  distribution.districts
			WHERE ST_Intersects(geom,districts.geometry) IS TRUE;
		RETURN result;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_district(geometry) IS 'Returns a string contaning all the names of the polygons in table districts which overlap the given geometry.';

/* get district id function */
CREATE OR REPLACE FUNCTION distribution.get_district_id(geometry) RETURNS integer AS '
	DECLARE
		geom ALIAS FOR $1;
		id_district integer;
	BEGIN
		SELECT districts.id INTO id_district
			FROM  distribution.districts
			WHERE ST_Intersects(geom,districts.geometry) IS TRUE
			LIMIT 1;
		RETURN id_district;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_district_id(geometry) IS 'Returns the id of the first overlapping district.';

COMMIT;
