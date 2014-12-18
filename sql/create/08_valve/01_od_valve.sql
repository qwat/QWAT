/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
DROP TABLE IF EXISTS qwat.od_valve CASCADE;
CREATE TABLE qwat.od_valve (id serial , CONSTRAINT valve_pk PRIMARY KEY (id));
COMMENT ON TABLE qwat.od_valve IS 'Table for valve.';


/* columns */
ALTER TABLE qwat.od_valve ADD COLUMN identification         varchar(20) default '';
ALTER TABLE qwat.od_valve ADD COLUMN id_type                integer not null ;
ALTER TABLE qwat.od_valve ADD COLUMN id_function            integer not null ;
ALTER TABLE qwat.od_valve ADD COLUMN id_status              integer not null ; 
ALTER TABLE qwat.od_valve ADD COLUMN id_precision           integer not null ;
ALTER TABLE qwat.od_valve ADD COLUMN id_precisionalti       integer not null ;
ALTER TABLE qwat.od_valve ADD COLUMN id_maintenance         integer[];
ALTER TABLE qwat.od_valve ADD COLUMN diameter_nominal       varchar(10) default '';
ALTER TABLE qwat.od_valve ADD COLUMN year                   smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_valve ADD COLUMN closed                 boolean       default false ;
ALTER TABLE qwat.od_valve ADD COLUMN networkseparation      boolean       default false ;
ALTER TABLE qwat.od_valve ADD COLUMN altitude_real          decimal(10,3)  ;
ALTER TABLE qwat.od_valve ADD COLUMN remark                 text          default '';
ALTER TABLE qwat.od_valve ADD COLUMN labelremark            varchar(150) default '';
ALTER TABLE qwat.od_valve ADD COLUMN label_visible_1        smallint default 1;
ALTER TABLE qwat.od_valve ADD COLUMN label_x_1              double precision default null;
ALTER TABLE qwat.od_valve ADD COLUMN label_y_1              double precision default null;
ALTER TABLE qwat.od_valve ADD COLUMN label_r_1              double precision default null;
ALTER TABLE qwat.od_valve ADD COLUMN label_visible_2        smallint default 1;
ALTER TABLE qwat.od_valve ADD COLUMN label_x_2              double precision default null;
ALTER TABLE qwat.od_valve ADD COLUMN label_y_2              double precision default null;
ALTER TABLE qwat.od_valve ADD COLUMN label_r_2              double precision default null;


/* schema view */
SELECT qwat.fn_enable_schemaview('od_valve','vl_valve_function','id_function');

/* geometry                  (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_valve',true    ,false,        true,             true,       true,          true);

/* constraints */
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_type          FOREIGN KEY (id_type)          REFERENCES qwat.vl_valve_type(id)       MATCH FULL; CREATE INDEX fki_valve_id_type          ON qwat.od_valve(id_type)         ;
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_function      FOREIGN KEY (id_function)      REFERENCES qwat.vl_valve_function(id)   MATCH FULL; CREATE INDEX fki_valve_id_function      ON qwat.od_valve(id_function)     ;
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_status        FOREIGN KEY (id_status)        REFERENCES qwat.vl_status(id)           MATCH FULL; CREATE INDEX fki_valve_id_status        ON qwat.od_valve(id_status)       ;
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_precision     FOREIGN KEY (id_precision)     REFERENCES qwat.vl_precision(id)        MATCH FULL; CREATE INDEX fki_valve_id_precision     ON qwat.od_valve(id_precision)    ;
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_precisionalti FOREIGN KEY (id_precisionalti) REFERENCES qwat.vl_precisionalti(id)    MATCH FULL; CREATE INDEX fki_valve_id_precisionalti ON qwat.od_valve(id_precisionalti);
ALTER TABLE qwat.od_valve ADD CONSTRAINT pipe_label_visible_1    FOREIGN KEY (label_visible_1)   REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_valve_label_visible_1   ON qwat.od_valve(label_visible_1)  ;
ALTER TABLE qwat.od_valve ADD CONSTRAINT pipe_label_visible_2    FOREIGN KEY (label_visible_2)   REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_valve_label_visible_2   ON qwat.od_valve(label_visible_2)  ;
/* cannot create constraint on arrays yet
ALTER TABLE qwat.od_valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES qwat.vl_valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON qwat.od_valve(id_maintenance) ;
*/





