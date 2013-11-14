/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_pressurezone CASCADE;
CREATE TABLE distribution.od_pressurezone (id serial NOT NULL);
COMMENT ON TABLE distribution.od_pressurezone IS 'Pressure zones.';

/* columns */
ALTER TABLE distribution.od_pressurezone ADD COLUMN shortname  varchar(10);
ALTER TABLE distribution.od_pressurezone ADD COLUMN name       varchar(30);
ALTER TABLE distribution.od_pressurezone ADD COLUMN id_parent  integer;     /* FK self reference */
ALTER TABLE distribution.od_pressurezone ADD COLUMN colorcode  smallint;

/* geometry */
SELECT AddGeometryColumn('distribution', 'pressurezone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX pressurezone_geoidx ON distribution.od_pressurezone USING GIST ( geometry ); 

/* constraints */
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_pkey PRIMARY KEY (id);
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_id_parent FOREIGN KEY (id_parent) REFERENCES distribution.od_pressurezone (id) MATCH SIMPLE ; CREATE INDEX fki_pressurezone_id_parent  ON distribution.od_pressurezone(id_parent);
        
/* get pressurezone id function */
CREATE OR REPLACE FUNCTION distribution.get_pressurezone_id(geometry) RETURNS integer AS
$BODY$ 
	DECLARE
		geom ALIAS FOR $1;
		id_pressurezone integer;
	BEGIN
		SELECT pressurezone.id INTO id_pressurezone
			FROM  distribution.od_pressurezone
			WHERE ST_Intersects(geom,pressurezone.geometry) IS TRUE
			ORDER BY ST_Length(ST_Intersection(geom,pressurezone.geometry)) DESC
			LIMIT 1;
		RETURN id_pressurezone;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_pressurezone_id(geometry) IS 'Returns the id of the first overlapping pressurezone.';
        

