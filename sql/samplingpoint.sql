/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/
BEGIN;

/* create */
DROP TABLE IF EXISTS distribution.samplingpoint CASCADE;
CREATE TABLE distribution.samplingpoint (id serial NOT NULL);
SELECT setval('distribution.samplingpoint_id_seq', 200, true);

/* geometry */
SELECT AddGeometryColumn('distribution', 'samplingpoint', 'geometry', 21781, 'POINT', 2);                                                                                        
CREATE INDEX samplingpoint_geoidx ON distribution.samplingpoint USING GIST ( geometry );


COMMIT; 
