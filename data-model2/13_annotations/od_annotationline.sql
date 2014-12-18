/*
	qWat - QGIS Water Module

	SQL file :: annotationline table
*/


DROP TABLE IF EXISTS qwat.od_annotationline CASCADE;
CREATE TABLE qwat.od_annotationline (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_annotationline IS 'Table for annotationlines.';

/* COLUMNS */
ALTER TABLE qwat.od_annotationline ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE qwat.od_annotationline ADD COLUMN text_size           decimal(7,2);
ALTER TABLE qwat.od_annotationline ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE qwat.od_annotationline ADD COLUMN annotation          text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat', 'od_annotationline', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_geoidx ON qwat.od_annotationline USING GIST ( geometry );
