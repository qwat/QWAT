/*
	qWat - QGIS Water Module

	SQL file :: annotationline table
*/


DROP TABLE IF EXISTS distribution.od_annotationline CASCADE;
CREATE TABLE distribution.od_annotationline (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_annotationline IS 'Table for annotationlines.';

/* COLUMNS */
ALTER TABLE distribution.od_annotationline ADD COLUMN visible             boolean not null default true; 
ALTER TABLE distribution.od_annotationline ADD COLUMN visible_schema      boolean not null default true;
ALTER TABLE distribution.od_annotationline ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE distribution.od_annotationline ADD COLUMN labelvisible_schema boolean not null default true;
ALTER TABLE distribution.od_annotationline ADD COLUMN text_size           decimal(7,2);
ALTER TABLE distribution.od_annotationline ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE distribution.od_annotationline ADD COLUMN annotation          text;

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_annotationline', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX node_geoidx ON distribution.od_node USING GIST ( geometry );
