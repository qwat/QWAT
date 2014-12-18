/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_printmap CASCADE;
CREATE TABLE qwat.od_printmap (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_printmap IS 'This table is used for polygons for predefined printable maps. shortname would be used as label string, and long_mame would be used in the print composer.';

/* columns */
ALTER TABLE qwat.od_printmap ADD COLUMN name         varchar(20) default '';
ALTER TABLE qwat.od_printmap ADD COLUMN id_district  smallint;
ALTER TABLE qwat.od_printmap ADD COLUMN remark       text default '';
ALTER TABLE qwat.od_printmap ADD COLUMN version_date date;

ALTER TABLE qwat.od_printmap ADD COLUMN x_min double precision;
ALTER TABLE qwat.od_printmap ADD COLUMN y_min double precision;
ALTER TABLE qwat.od_printmap ADD COLUMN x_max double precision;
ALTER TABLE qwat.od_printmap ADD COLUMN y_max double precision;

/* geometry */
SELECT AddGeometryColumn('qwat', 'od_printmap', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX printmap_geoidx ON qwat.od_printmap USING GIST ( geometry ); 

/* Constraints */
ALTER TABLE qwat.od_printmap ADD CONSTRAINT printmap_id_district FOREIGN KEY (id_district) REFERENCES qwat.od_district (id) MATCH SIMPLE ; CREATE INDEX fki_printmap_id_district ON qwat.od_printmap(id);
