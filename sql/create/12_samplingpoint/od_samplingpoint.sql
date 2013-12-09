/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
DROP TABLE IF EXISTS distribution.od_samplingpoint CASCADE;
CREATE TABLE distribution.od_samplingpoint (id serial PRIMARY KEY);
SELECT setval('distribution.od_samplingpoint_id_seq', 200, true);

/* columns */
ALTER TABLE distribution.od_samplingpoint ADD COLUMN identification varchar(20) not null default '';
ALTER TABLE distribution.od_samplingpoint ADD COLUMN remark         text default '';

/* geometry */
SELECT distribution.fn_geom_tool_point('od_samplingpoint',false,false,false,false,true, true);




 
