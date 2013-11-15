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
ALTER TABLE distribution.od_valve ADD COLUMN identification         integer ;
ALTER TABLE distribution.od_valve ADD COLUMN id_type                smallint not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_function            smallint not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_precision           smallint not null ;
ALTER TABLE distribution.od_valve ADD COLUMN id_maintenance         integer[];
ALTER TABLE distribution.od_valve ADD COLUMN diameter_nominal       varchar(10) ;
ALTER TABLE distribution.od_valve ADD COLUMN year                   smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_valve ADD COLUMN closed                 boolean       default false ;
ALTER TABLE distribution.od_valve ADD COLUMN networkseparation      boolean       default false ;
ALTER TABLE distribution.od_valve ADD COLUMN altitude_real          decimal(10,3)  ;
ALTER TABLE distribution.od_valve ADD COLUMN remarks                text          default '';
ALTER TABLE distribution.od_valve ADD COLUMN id_label_visible       boolean       default null;  
ALTER TABLE distribution.od_valve ADD COLUMN id_labelschema_visible boolean       default null;

/* schema view */
SELECT distribution.enable_schemaview('od_valve','vl_valve_function','id_function');

/* geometry */
SELECT distribution.geom_tool_point('od_valve',true,false,true,true,true);

/* constraints */
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_type                FOREIGN KEY (id_type)                REFERENCES distribution.vl_valve_type(id)     MATCH FULL; CREATE INDEX fki_valve_id_type                ON distribution.od_valve(id_type)               ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_function            FOREIGN KEY (id_function)            REFERENCES distribution.vl_valve_function(id) MATCH FULL; CREATE INDEX fki_valve_id_function            ON distribution.od_valve(id_function)           ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_precision           FOREIGN KEY (id_precision)           REFERENCES distribution.vl_precision(id)      MATCH FULL; CREATE INDEX fki_valve_id_precision           ON distribution.od_valve(id_precision)          ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_label_visible       FOREIGN KEY (id_label_visible)       REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_valve_id_label_visible       ON distribution.od_valve(id_label_visible)      ;
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_labelschema_visible FOREIGN KEY (id_labelschema_visible) REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_valve_id_labelschema_visible ON distribution.od_valve(id_labelschema_visible);
/* cannot create constraint on arrays yet
ALTER TABLE distribution.od_valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES distribution.vl_valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON distribution.od_valve(id_maintenance) ;
*/





