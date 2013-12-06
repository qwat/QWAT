/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_printmap CASCADE;
CREATE TABLE distribution.od_printmap (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_printmap IS 'This table is used for polygons for predefined printable maps. shortname would be used as label string, and long_mame would be used in the print composer.';

/* columns */
ALTER TABLE distribution.od_printmap ADD COLUMN name         varchar(20) default '';
ALTER TABLE distribution.od_printmap ADD COLUMN id_district  smallint;
ALTER TABLE distribution.od_printmap ADD COLUMN remark       text;
ALTER TABLE distribution.od_printmap ADD COLUMN version_date date;

ALTER TABLE distribution.od_printmap ADD COLUMN x_min double precision;
ALTER TABLE distribution.od_printmap ADD COLUMN y_min double precision;
ALTER TABLE distribution.od_printmap ADD COLUMN x_max double precision;
ALTER TABLE distribution.od_printmap ADD COLUMN y_max double precision;

/* geometry */
SELECT AddGeometryColumn('distribution', 'od_printmap', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX printmap_geoidx ON distribution.od_printmap USING GIST ( geometry ); 

/* Constraints */
ALTER TABLE distribution.od_printmap ADD CONSTRAINT printmap_id_district FOREIGN KEY (id_district) REFERENCES distribution.od_district (id) MATCH SIMPLE ; CREATE INDEX fki_printmap_id_district ON distribution.od_printmap(id);
