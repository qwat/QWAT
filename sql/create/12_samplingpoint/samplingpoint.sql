/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
DROP TABLE IF EXISTS distribution.od_samplingpoint CASCADE;
CREATE TABLE distribution.od_samplingpoint (id serial NOT NULL);
SELECT setval('distribution.od_samplingpoint_id_seq', 200, true);

/* columns */
ALTER TABLE distribution.od_samplingpoint ADD COLUMN  identification             integer       ;

ALTER TABLE distribution.od_samplingpoint ADD COLUMN  remarks text;

/* geometry */
SELECT distribution.geom_tool_point('samplingpoint',false,false,false,false,true);




 
