/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
DROP TABLE IF EXISTS distribution.samplingpoint CASCADE;
CREATE TABLE distribution.samplingpoint (id serial NOT NULL);
SELECT setval('distribution.samplingpoint_id_seq', 200, true);

/* columns */
ALTER TABLE distribution.samplingpoint ADD COLUMN  identification             integer       ;

ALTER TABLE distribution.samplingpoint ADD COLUMN  remarks text default '';

/* geometry */
SELECT distribution.geom_tool_point('samplingpoint',false,false,false,false,true);




 
