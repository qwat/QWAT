/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint_schema table
*/


DROP TABLE IF EXISTS distribution.od_annotationpoint_schema CASCADE;
CREATE TABLE distribution.od_annotationpoint_schema (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_annotationpoint_schema IS 'Table for annotationpoint_schemas.';

/* COLUMNS */
ALTER TABLE distribution.od_annotationpoint_schema ADD COLUMN text_size        decimal(7,2);
ALTER TABLE distribution.od_annotationpoint_schema ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE distribution.od_annotationpoint_schema ADD COLUMN annotation       text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_annotationpoint_schema', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_schema_geoidx ON distribution.od_annotationpoint_schema USING GIST ( geometry );

