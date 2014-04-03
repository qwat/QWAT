/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_pump CASCADE;
CREATE TABLE distribution.od_installation_pump (id serial PRIMARY KEY);

COMMENT ON TABLE distribution.od_installation_pump IS '';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_pump ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN identification     varchar(25) default '';
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_installation    integer                ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_status          integer not null       ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_remote          integer                ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN remark             text default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_pump ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN eca                varchar(30) default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_labelvisible        boolean default null;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_labelvisible_schema boolean default null;
ALTER TABLE distribution.od_installation_pump ADD COLUMN labelremark            varchar(150) default '';
/* specific to pumps */
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_pipe_in        integer      ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_pipe_out       integer      ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE distribution.od_installation_pump ADD COLUMN nb_pump           smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE distribution.od_installation_pump ADD COLUMN manometric_height decimal(10,2);

/* geometry */
/*                                 ( table_name,           is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_installation_pump',true,    true,       false,             false,    true,          false);

/* Constraints */
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_installation FOREIGN KEY (id_installation) REFERENCES distribution.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_installation ON distribution.od_installation_pump(id_installation);
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_pump_id_status       ON distribution.od_installation_pump(id_status)      ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pump_id_distributor  ON distribution.od_installation_pump(id_distributor) ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_remote       ON distribution.od_installation_pump(id_remote)      ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES distribution.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pump_vl_watertype    ON distribution.od_installation_pump(id_watertype)   ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_labelvisible        FOREIGN KEY (id_labelvisible)        REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_installation_pump_id_labelvisible        ON distribution.od_installation_pump(id_labelvisible)       ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_labelvisible_schema FOREIGN KEY (id_labelvisible_schema) REFERENCES distribution.vl_visible(vl_code)   MATCH FULL; CREATE INDEX fki_installation_pump_id_labelvisible_schema ON distribution.od_installation_pump(id_labelvisible_schema);
/* specific */                                                                                                                                                                                                                                     
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_type     FOREIGN KEY (id_type)     REFERENCES distribution.vl_pump_type(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_pump_type ON distribution.od_installation_pump(id_type)     ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_pipe_in  FOREIGN KEY (id_pipe_in)  REFERENCES distribution.od_pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_od_pipe_in   ON distribution.od_installation_pump(id_pipe_in)  ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_pipe_out FOREIGN KEY (id_pipe_out) REFERENCES distribution.od_pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_od_pipe_out  ON distribution.od_installation_pump(id_pipe_out) ;


/* VIEW */
CREATE OR REPLACE VIEW distribution.vw_installation_pump_fr AS
SELECT
	od_installation_pump.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype,
	vl_pump_type.value_fr AS type
	FROM distribution.od_installation_pump
	INNER JOIN      distribution.vl_status          ON vl_status.id      = od_installation_pump.id_status
	INNER JOIN      distribution.od_distributor     ON od_distributor.id = od_installation_pump.id_distributor
	LEFT OUTER JOIN distribution.vl_remote          ON vl_remote.id      = od_installation_pump.id_remote
	INNER JOIN      distribution.vl_watertype       ON vl_watertype.id   = od_installation_pump.id_watertype
	INNER JOIN      distribution.vl_pump_type       ON vl_pump_type.id   = od_installation_pump.id_type;


