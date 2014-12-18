/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_hydrant CASCADE;
CREATE TABLE qwat.od_hydrant (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_hydrant IS 'hydrant.';

/* COLUMNS */
ALTER TABLE qwat.od_hydrant ADD COLUMN identification     varchar(15) default '';
ALTER TABLE qwat.od_hydrant ADD COLUMN id_distributor     integer not null      ;
ALTER TABLE qwat.od_hydrant ADD COLUMN id_status          integer not null      ;
ALTER TABLE qwat.od_hydrant ADD COLUMN id_provider        integer               ;
ALTER TABLE qwat.od_hydrant ADD COLUMN id_precision       integer not null      ;
ALTER TABLE qwat.od_hydrant ADD COLUMN id_precisionalti   integer not null      ;
ALTER TABLE qwat.od_hydrant ADD COLUMN year               smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_hydrant ADD COLUMN model              varchar(30)           default '';
ALTER TABLE qwat.od_hydrant ADD COLUMN underground        boolean default false ;
ALTER TABLE qwat.od_hydrant ADD COLUMN altitude_real      decimal(10,3)         ;
ALTER TABLE qwat.od_hydrant ADD COLUMN marked        	  boolean default false ; COMMENT ON COLUMN qwat.od_hydrant.marked IS 'does it have markings pointing to it';
ALTER TABLE qwat.od_hydrant ADD COLUMN remark             text    default ''    ;
ALTER TABLE qwat.od_hydrant ADD COLUMN pressure_static    decimal(5,2)          ; COMMENT ON COLUMN qwat.od_hydrant.pressure_static IS 'pression statique [bar]';
ALTER TABLE qwat.od_hydrant ADD COLUMN pressure_dynamic   decimal(5,2)          ; COMMENT ON COLUMN qwat.od_hydrant.pressure_dynamic IS 'pression dynamique [bar]';
ALTER TABLE qwat.od_hydrant ADD COLUMN flow               decimal(8,2)          ; COMMENT ON COLUMN qwat.od_hydrant.flow IS 'debit [l/min]';
ALTER TABLE qwat.od_hydrant ADD COLUMN observation_date   date                  ;
ALTER TABLE qwat.od_hydrant ADD COLUMN observation_source varchar(45)           default '';
ALTER TABLE qwat.od_hydrant ADD COLUMN label_visible_1    smallint default 1;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_x_1          double precision default null;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_y_1          double precision default null;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_r_1          double precision default null;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_visible_2    smallint default 1;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_x_2          double precision default null;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_y_2          double precision default null;
ALTER TABLE qwat.od_hydrant ADD COLUMN label_r_2          double precision default null;

/* geometry                     (table_name,  is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_hydrant',   true,    true,        true,             false,    true,          true);

/* CONSTRAINTS */
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_id_distributor   FOREIGN KEY (id_distributor)   REFERENCES qwat.od_distributor(id)      MATCH FULL  ; CREATE INDEX fki_hydrant_id_distributor   ON qwat.od_hydrant(id_distributor)  ;
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_id_status        FOREIGN KEY (id_status)        REFERENCES qwat.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_hydrant_id_status        ON qwat.od_hydrant(id_status)       ;
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_id_provider      FOREIGN KEY (id_provider)      REFERENCES qwat.vl_hydrant_provider(id) MATCH SIMPLE; CREATE INDEX fki_hydrant_id_provider      ON qwat.od_hydrant(id_provider)     ;
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_id_precision     FOREIGN KEY (id_precision)     REFERENCES qwat.vl_precision(id)        MATCH FULL  ; CREATE INDEX fki_hydrant_id_precision     ON qwat.od_hydrant(id_precision)    ;
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_id_precisionalti FOREIGN KEY (id_precisionalti) REFERENCES qwat.vl_precisionalti(id)    MATCH FULL  ; CREATE INDEX fki_hydrant_id_precisionalti ON qwat.od_hydrant(id_precisionalti);
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_label_visible_1  FOREIGN KEY (label_visible_1)  REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL;   CREATE INDEX fki_hydrant_label_visible_1  ON qwat.od_hydrant(label_visible_1)  ;
ALTER TABLE qwat.od_hydrant ADD CONSTRAINT hydrant_label_visible_2  FOREIGN KEY (label_visible_2)  REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL;   CREATE INDEX fki_hydrant_label_visible_2  ON qwat.od_hydrant(label_visible_2)  ;


