/*
	qWat - QGIS Water Module

	SQL file :: annotationline_schema table
*/


DROP TABLE IF EXISTS qwat.od_annotationline_schema CASCADE;
CREATE TABLE qwat.od_annotationline_schema (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_annotationline_schema IS 'Table for annotationline_schemas.';

/* COLUMNS */
ALTER TABLE qwat.od_annotationline_schema ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE qwat.od_annotationline_schema ADD COLUMN text_size           decimal(7,2);
ALTER TABLE qwat.od_annotationline_schema ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE qwat.od_annotationline_schema ADD COLUMN annotation          text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat', 'od_annotationline_schema', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_schema_geoidx ON qwat.od_annotationline_schema USING GIST ( geometry );
