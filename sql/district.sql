/*
	qWat - QGIS Water Module
	
	SQL file :: district
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.district CASCADE;
CREATE TABLE distribution.district (id serial NOT NULL);
COMMENT ON TABLE distribution.district IS 'Districts.';

/* columns */
ALTER TABLE distribution.district ADD COLUMN  name  varchar(40);
ALTER TABLE distribution.district ADD COLUMN  shortname  varchar(12);
ALTER TABLE distribution.district ADD COLUMN  zip  varchar(12);
ALTER TABLE distribution.district ADD COLUMN  land_registry  varchar(12);
ALTER TABLE distribution.district ADD COLUMN  subscriber_prefix  varchar(12);

ALTER TABLE distribution.district ADD COLUMN  lbl_x double precision;
ALTER TABLE distribution.district ADD COLUMN  lbl_y double precision;
ALTER TABLE distribution.district ADD COLUMN  lbl_a double precision;

/* geometry */
SELECT AddGeometryColumn('distribution', 'district', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX district_geoidx ON distribution.district USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.district ADD CONSTRAINT district_pkey PRIMARY KEY (id);
ALTER TABLE distribution.district ADD CONSTRAINT district_name UNIQUE (name);


/*----------------!!!---!!!----------------*/
/* get district function */
CREATE OR REPLACE FUNCTION distribution.get_district(geometry) RETURNS text AS '
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(district.name , '', '') INTO result
			FROM  distribution.district
			WHERE ST_Intersects(geom,district.geometry) IS TRUE;
		RETURN result;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_district(geometry) IS 'Returns a string contaning all the names of the polygons in table district which overlap the given geometry.';

/* get district id function */
CREATE OR REPLACE FUNCTION distribution.get_district_id(geometry) RETURNS integer AS '
	DECLARE
		geom ALIAS FOR $1;
		id_district integer;
	BEGIN
		SELECT district.id INTO id_district
			FROM  distribution.district
			WHERE ST_Intersects(geom,district.geometry) IS TRUE
			LIMIT 1;
		RETURN id_district;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_district_id(geometry) IS 'Returns the id of the first overlapping district.';

COMMIT;
