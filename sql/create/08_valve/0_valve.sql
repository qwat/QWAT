/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
DROP TABLE IF EXISTS distribution.valve CASCADE;
CREATE TABLE distribution.valve (id serial , CONSTRAINT valve_pkey PRIMARY KEY (id));
COMMENT ON TABLE distribution.valve IS 'Table for valve.';
SELECT setval('distribution.pipe_id_seq', 20000, true);

/* columns */
ALTER TABLE distribution.valve ADD COLUMN identification    integer ;
ALTER TABLE distribution.valve ADD COLUMN id_type           integer not null ;
ALTER TABLE distribution.valve ADD COLUMN id_function       integer not null ;
ALTER TABLE distribution.valve ADD COLUMN id_precision      integer not null ;
ALTER TABLE distribution.valve ADD COLUMN id_maintenance    integer[];
ALTER TABLE distribution.valve ADD COLUMN diameter_nominal  varchar(10) ;
ALTER TABLE distribution.valve ADD COLUMN year              smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.valve ADD COLUMN closed            boolean     default false ;
ALTER TABLE distribution.valve ADD COLUMN altitude_real     decimal(10,3)  ;
ALTER TABLE distribution.valve ADD COLUMN remarks text;
ALTER TABLE distribution.valve ADD COLUMN id_labelview integer default 2;              
ALTER TABLE distribution.valve ADD COLUMN id_labelview_schema integer default 2;         

/* schema view */
SELECT distribution.enable_schemaview('valve','vl_valve_function','id_function');

/* geometry */
SELECT distribution.geom_tool_point('valve',true,false,true,true,true);

/* constraints */
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_type             FOREIGN KEY (id_type)             REFERENCES distribution.vl_valve_type(id)     MATCH FULL; CREATE INDEX fki_valve_id_type             ON distribution.valve(id_type)         ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_function         FOREIGN KEY (id_function)         REFERENCES distribution.vl_valve_function(id) MATCH FULL; CREATE INDEX fki_valve_id_function         ON distribution.valve(id_function)     ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_labelview        FOREIGN KEY (id_labelview)        REFERENCES distribution.vl_labelview(id)      MATCH FULL; CREATE INDEX fki_valve_id_labelview        ON distribution.valve(id_labelview)       ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_labelview_schema FOREIGN KEY (id_labelview_schema) REFERENCES distribution.vl_labelview(id)      MATCH FULL; CREATE INDEX fki_valve_id_labelview_schema ON distribution.valve(id_labelview_schema);
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_precision        FOREIGN KEY (id_precision)        REFERENCES distribution.vl_precision(id)      MATCH FULL; CREATE INDEX fki_valve_id_precision        ON distribution.valve(id_precision)   ;
/* cannot create constraint on arrays yet
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES distribution.vl_valvemaintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON distribution.valve(id_maintenance) ;
*/





