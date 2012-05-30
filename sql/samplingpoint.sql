/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.samplingpoint CASCADE;
CREATE TABLE distribution.samplingpoint (id serial NOT NULL);
SELECT setval('distribution.samplingpoint_id_seq', 200, true);

SELECT AddGeometryColumn('distribution', 'samplingpoint', 'geometry', 21781, 'POINT', 2);                                                                                        

COMMIT; 
