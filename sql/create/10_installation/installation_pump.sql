/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_pump CASCADE;
CREATE TABLE distribution.od_installation_pump (id serial NOT NULL, CONSTRAINT installation_pump_pk PRIMARY KEY (id) );
SELECT setval('distribution.od_installation_pump_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_pump IS '';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_pump ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN identification     integer                ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_status          smallint not null      ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_distributor     smallint not null      ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_remote          smallint               ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_watertype       smallint not null      ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN schema_visible        boolean NOT NULL default true ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN remark             text default '' ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN links              text                   ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_pump ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN eca                varchar(30)            ;
/* specific to pumps */
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_installation   smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE distribution.od_installation_pump ADD COLUMN nb_pump           smallint     ;
ALTER TABLE distribution.od_installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE distribution.od_installation_pump ADD COLUMN manometric_height decimal(10,2);

/* geometry */
/*                                 (table_name,         is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('od_installation_pump',true,    true,        true,             false,    true);

/* Constraints */
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)    MATCH FULL;   CREATE INDEX fki_installation_pump_id_status      ON distribution.od_installation_pump(id_status)      ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.od_distributor(id)  MATCH FULL;   CREATE INDEX fki_installation_pump_id_distributor ON distribution.od_installation_pump(id_distributor) ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)    MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_remote      ON distribution.od_installation_pump(id_remote)      ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES distribution.vl_watertype(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_watertype   ON distribution.od_installation_pump(id_watertype)   ;
ALTER TABLE distribution.od_installation_pump ADD CONSTRAINT installation_pump_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.vl_pump_type(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_pump_type   ON distribution.od_installation_pump(id_type)        ;



