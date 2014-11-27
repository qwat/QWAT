/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint table
*/


DROP TABLE IF EXISTS qwat.od_annotationpoint CASCADE;
CREATE TABLE qwat.od_annotationpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_annotationpoint IS 'Table for annotationpoints.';

/* COLUMNS */
ALTER TABLE qwat.od_annotationpoint ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat.od_annotationpoint ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat.od_annotationpoint ADD COLUMN annotation       text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat', 'od_annotationpoint', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_geoidx ON qwat.od_annotationpoint USING GIST ( geometry );

