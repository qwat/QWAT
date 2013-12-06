/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_pressurecontrol CASCADE;
CREATE TABLE distribution.od_installation_pressurecontrol (id serial PRIMARY KEY);
SELECT setval('distribution.od_installation_pressurecontrol_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_pressurecontrol IS '';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN identification     varchar(25) not null default '' ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_installation    integer                ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_status          integer not null       ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_remote          integer                ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN remark             text        default '' ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN links              text                   ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN year               smallint    check (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN parcel             varchar(30)  default '';
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN eca                varchar(30)  default '';
/* specific to pressurecontrol */
ALTER TABLE distribution.od_installation_pressurecontrol ADD COLUMN id_type            integer not null       ;


/* GEOMETRY */
/*                                 (table_name,                       is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_installation_pressurecontrol',true,    true,       false,             false,    true,          false);

/* CONSTRAINTS */
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_installation FOREIGN KEY (id_installation) REFERENCES distribution.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_id_installation ON distribution.od_installation_pressurecontrol(id_installation);
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_status       ON distribution.od_installation_pressurecontrol(id_status)      ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_distributor  ON distribution.od_installation_pressurecontrol(id_distributor) ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_id_remote       ON distribution.od_installation_pressurecontrol(id_remote)      ;
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES distribution.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_vl_watertype    ON distribution.od_installation_pressurecontrol(id_watertype)   ;
/* SPECIFIC */
ALTER TABLE distribution.od_installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.vl_pressurecontrol(id)       MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_vl_type         ON distribution.od_installation_pressurecontrol(id_type)        ;


/* VIEW */
CREATE OR REPLACE VIEW distribution.vw_installation_pressurecontrol_fr AS
SELECT
	od_installation_pressurecontrol.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype,
	vl_pressurecontrol.value_fr AS type
	FROM distribution.od_installation_pressurecontrol
	INNER JOIN      distribution.vl_status          ON vl_status.id          = od_installation_pressurecontrol.id_status
	INNER JOIN      distribution.od_distributor     ON od_distributor.id     = od_installation_pressurecontrol.id_distributor
	LEFT OUTER JOIN distribution.vl_remote          ON vl_remote.id          = od_installation_pressurecontrol.id_remote
	INNER JOIN      distribution.vl_watertype       ON vl_watertype.id       = od_installation_pressurecontrol.id_watertype
	INNER JOIN      distribution.vl_pressurecontrol ON vl_pressurecontrol.id = od_installation_pressurecontrol.id_type;





