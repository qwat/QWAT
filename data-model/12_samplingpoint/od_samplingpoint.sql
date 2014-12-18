/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
DROP TABLE IF EXISTS qwat.od_samplingpoint CASCADE;
CREATE TABLE qwat.od_samplingpoint (id serial PRIMARY KEY);


/* columns */
ALTER TABLE qwat.od_samplingpoint ADD COLUMN identification varchar(20) default '';
ALTER TABLE qwat.od_samplingpoint ADD COLUMN remark         text default '';

/* geometry */
SELECT qwat.fn_geom_tool_point('od_samplingpoint',false,false,false,false,true, true);




 
