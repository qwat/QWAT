/*
	qWat - QGIS Water Module
	
	SQL file :: wateringoutput
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_wateringoutput CASCADE;
CREATE TABLE qwat.od_wateringoutput (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_wateringoutput IS 'wateringoutput.';

/* COLUMNS */
ALTER TABLE qwat.od_wateringoutput ADD COLUMN identification  varchar(15) default ''  ;
ALTER TABLE qwat.od_wateringoutput ADD COLUMN id_distributor  integer                 ;
ALTER TABLE qwat.od_wateringoutput ADD COLUMN id_status       integer                 ;
ALTER TABLE qwat.od_wateringoutput ADD COLUMN year smallint   CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_wateringoutput ADD COLUMN altitude_real   decimal(10,3)           ;
ALTER TABLE qwat.od_wateringoutput ADD COLUMN remark          text default '';

/* GEOMETRY                        (table_name         , is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_wateringoutput', true,    true,        false,            false,    true,          true );

/* CONSTRAINTS */
ALTER TABLE qwat.od_wateringoutput ADD CONSTRAINT wateringoutput_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)      MATCH FULL  ; CREATE INDEX fki_wateringoutput_id_distributor  ON qwat.od_wateringoutput(id_distributor) ;
ALTER TABLE qwat.od_wateringoutput ADD CONSTRAINT wateringoutput_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_wateringoutput_id_status       ON qwat.od_wateringoutput(id_status)      ;


