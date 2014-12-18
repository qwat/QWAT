/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_installation_pump CASCADE;
CREATE TABLE qwat.od_installation_pump (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_installation_pump IS '';

/* common columns to all installations*/
ALTER TABLE qwat.od_installation_pump ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN identification     varchar(25) default '';
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_installation    integer                ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_status          integer not null       ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_remote          integer                ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN remark             text default '' ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_installation_pump ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN eca                varchar(30) default '' ; COMMENT ON COLUMN qwat.od_installation_pump.eca IS 'fire brigade id';
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_remark       varchar(150) default '';
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_visible_1    smallint default 1;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_installation_pump ADD COLUMN label_r_2       double precision default null;
/* specific to pumps */
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_pipe_in        integer      ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_pipe_out       integer      ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE qwat.od_installation_pump ADD COLUMN no_pumps          smallint     ;
ALTER TABLE qwat.od_installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE qwat.od_installation_pump ADD COLUMN manometric_height decimal(10,2);

/* geometry */
/*                                 ( table_name,    is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_installation_pump',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_installation FOREIGN KEY (id_installation) REFERENCES qwat.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_installation ON qwat.od_installation_pump(id_installation);
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_pump_id_status       ON qwat.od_installation_pump(id_status)      ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pump_id_distributor  ON qwat.od_installation_pump(id_distributor) ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_remote       FOREIGN KEY (id_remote)       REFERENCES qwat.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_remote       ON qwat.od_installation_pump(id_remote)      ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES qwat.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pump_vl_watertype    ON qwat.od_installation_pump(id_watertype)   ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_pump_labelvisible_1  ON qwat.od_installation_pump(label_visible_1) ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_pump_labelvisible_2  ON qwat.od_installation_pump(label_visible_2) ;
/* specific */                                                                                                                                                                                                                                     
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_type     FOREIGN KEY (id_type)     REFERENCES qwat.vl_pump_type(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_pump_type ON qwat.od_installation_pump(id_type)     ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_pipe_in  FOREIGN KEY (id_pipe_in)  REFERENCES qwat.od_pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_od_pipe_in   ON qwat.od_installation_pump(id_pipe_in)  ;
ALTER TABLE qwat.od_installation_pump ADD CONSTRAINT installation_pump_id_pipe_out FOREIGN KEY (id_pipe_out) REFERENCES qwat.od_pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_od_pipe_out  ON qwat.od_installation_pump(id_pipe_out) ;


/* VIEW */
CREATE OR REPLACE VIEW qwat.vw_installation_pump_fr AS
SELECT
	od_installation_pump.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype,
	vl_pump_type.value_fr AS type
	FROM qwat.od_installation_pump
	INNER JOIN      qwat.vl_status          ON vl_status.id      = od_installation_pump.id_status
	INNER JOIN      qwat.od_distributor     ON od_distributor.id = od_installation_pump.id_distributor
	LEFT OUTER JOIN qwat.vl_remote          ON vl_remote.id      = od_installation_pump.id_remote
	INNER JOIN      qwat.vl_watertype       ON vl_watertype.id   = od_installation_pump.id_watertype
	INNER JOIN      qwat.vl_pump_type       ON vl_pump_type.id   = od_installation_pump.id_type;


