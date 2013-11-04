/*
	qWat - QGIS Water Module
	
	SQL file :: wateringoutput
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.wateringoutput CASCADE;
CREATE TABLE distribution.wateringoutput (id serial NOT NULL);
SELECT setval('distribution.wateringoutput_id_seq', 100, true);
COMMENT ON TABLE distribution.wateringoutput IS 'wateringoutput.';

/* columns */
ALTER TABLE distribution.wateringoutput ADD COLUMN  identification  character varying (15)  ;
ALTER TABLE distribution.wateringoutput ADD COLUMN  id_distributor   integer                 ;
ALTER TABLE distribution.wateringoutput ADD COLUMN  id_status        integer                 ;
ALTER TABLE distribution.wateringoutput ADD COLUMN  year smallint    CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.wateringoutput ADD COLUMN  altitude_real    decimal(10,3)           ;
ALTER TABLE distribution.wateringoutput ADD COLUMN  remarks text;

/* geometry                        (table_name, is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('wateringoutput',  true,    true,        false,            false,    true);

/* primary key */
ALTER TABLE distribution.wateringoutput ADD CONSTRAINT wateringoutput_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.wateringoutput ADD CONSTRAINT wateringoutput_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)      MATCH FULL  ; CREATE INDEX fki_wateringoutput_id_distributor  ON distribution.wateringoutput(id_distributor) ;
ALTER TABLE distribution.wateringoutput ADD CONSTRAINT wateringoutput_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_wateringoutput_id_status       ON distribution.wateringoutput(id_status)      ;


