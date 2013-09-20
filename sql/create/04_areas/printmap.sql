/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.printmap CASCADE;
CREATE TABLE distribution.printmap (id serial NOT NULL);
COMMENT ON TABLE distribution.printmap IS 'This table is used for polygons for predefined printable maps. shortname would be used as label string, and long_mame would be used in the print composer.';

/* columns */
ALTER TABLE distribution.printmap ADD COLUMN name         varchar(20);
ALTER TABLE distribution.printmap ADD COLUMN id_district  smallint;
ALTER TABLE distribution.printmap ADD COLUMN remarks      text;
ALTER TABLE distribution.printmap ADD COLUMN version_date date;

/* geometry */
SELECT AddGeometryColumn('distribution', 'printmap', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX printmap_geoidx ON distribution.printmap USING GIST ( geometry ); 

/* Constraints */
ALTER TABLE distribution.printmap ADD CONSTRAINT print_pkey PRIMARY KEY (id);
ALTER TABLE distribution.printmap ADD CONSTRAINT printmap_id_district FOREIGN KEY (id_district) REFERENCES distribution.printmap (id) MATCH SIMPLE ; CREATE INDEX fki_printmap_id_district ON distribution.district(id);
