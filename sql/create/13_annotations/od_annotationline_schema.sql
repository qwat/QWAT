/*
	qWat - QGIS Water Module

	SQL file :: annotationline_schema table
*/


DROP TABLE IF EXISTS distribution.od_annotationline_schema CASCADE;
CREATE TABLE distribution.od_annotationline_schema (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_annotationline_schema IS 'Table for annotationline_schemas.';

/* COLUMNS */
ALTER TABLE distribution.od_annotationline_schema ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE distribution.od_annotationline_schema ADD COLUMN text_size           decimal(7,2);
ALTER TABLE distribution.od_annotationline_schema ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE distribution.od_annotationline_schema ADD COLUMN annotation          text;

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_annotationline_schema', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_schema_geoidx ON distribution.od_node USING GIST ( geometry );
