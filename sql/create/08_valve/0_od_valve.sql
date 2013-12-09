/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
DROP TABLE IF EXISTS distribution.od_valve CASCADE;
CREATE TABLE distribution.od_valve (id serial , CONSTRAINT valve_pk PRIMARY KEY (id));
COMMENT ON TABLE distribution.od_valve IS 'Table for valve.';
SELECT setval('distribution.od_pipe_id_seq', 20000, true);

/* columns */
ALTER TABLE distribution.od_valve ADD COLUMN identification         varchar(20) default '';
ALTER TABLE distribution.od_valve ADD COLUMN id_type                integer not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_function            integer not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_precision           integer not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_precisionalti       integer not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_labelvisible        boolean default null;
ALTER TABLE distribution.od_valve ADD COLUMN id_labelvisible_schema boolean default null;
ALTER TABLE distribution.od_valve ADD COLUMN id_maintenance         integer[];
ALTER TABLE distribution.od_valve ADD COLUMN diameter_nominal       varchar(10) default '';
ALTER TABLE distribution.od_valve ADD COLUMN year                   smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_valve ADD COLUMN closed                 boolean       default false ;
ALTER TABLE distribution.od_valve ADD COLUMN networkseparation      boolean       default false ;
ALTER TABLE distribution.od_valve ADD COLUMN altitude_real          decimal(10,3)  ;
ALTER TABLE distribution.od_valve ADD COLUMN remark                 text          default '';
ALTER TABLE distribution.od_valve ADD COLUMN labelremark            varchar(150) default '';
ALTER TABLE distribution.od_valve ADD COLUMN labelremark_schema     varchar(150) default '';

/* schema view */
SELECT distribution.fn_enable_schemaview('od_valve','vl_valve_function','id_function');

/* geometry (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_valve',true,false,true,true,true,true);

/* constraints */
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_type                FOREIGN KEY (id_type)                REFERENCES distribution.vl_valve_type(id)     MATCH FULL; CREATE INDEX fki_valve_id_type                ON distribution.od_valve(id_type)               ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_function            FOREIGN KEY (id_function)            REFERENCES distribution.vl_valve_function(id) MATCH FULL; CREATE INDEX fki_valve_id_function            ON distribution.od_valve(id_function)           ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_precision           FOREIGN KEY (id_precision)           REFERENCES distribution.vl_precision(id)      MATCH FULL; CREATE INDEX fki_valve_id_precision           ON distribution.od_valve(id_precision)          ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_precisionalti       FOREIGN KEY (id_precisionalti)       REFERENCES distribution.vl_precisionalti(id)  MATCH FULL; CREATE INDEX fki_valve_id_precisionalti       ON distribution.od_valve(id_precisionalti)      ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_labelvisible        FOREIGN KEY (id_labelvisible)        REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_valve_id_labelvisible        ON distribution.od_valve(id_labelvisible)       ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_labelvisible_schema FOREIGN KEY (id_labelvisible_schema) REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_valve_id_labelvisible_schema ON distribution.od_valve(id_labelvisible_schema);
/* cannot create constraint on arrays yet
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES distribution.vl_valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON distribution.od_valve(id_maintenance) ;
*/





