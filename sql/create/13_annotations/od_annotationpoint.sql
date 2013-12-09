/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint table
*/


DROP TABLE IF EXISTS distribution.od_annotationpoint CASCADE;
CREATE TABLE distribution.od_annotationpoint (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_annotationpoint IS 'Table for annotationpoints.';

/* COLUMNS */
ALTER TABLE distribution.od_annotationpoint ADD COLUMN text_size        decimal(7,2);
ALTER TABLE distribution.od_annotationpoint ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE distribution.od_annotationpoint ADD COLUMN annotation       text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_annotationpoint', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_geoidx ON distribution.od_node USING GIST ( geometry );

