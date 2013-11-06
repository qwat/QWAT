/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_pump CASCADE;
CREATE TABLE distribution.installation_pump (id serial NOT NULL);
SELECT setval('distribution.installation_pump_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_pump IS '';

/* common columns to all installations*/
ALTER TABLE distribution.installation_pump ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.installation_pump ADD COLUMN identification     integer                ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_status          integer                ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_distributor     integer                ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_remote          integer                ;
ALTER TABLE distribution.installation_pump ADD COLUMN view_schema        boolean      default true ;
ALTER TABLE distribution.installation_pump ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.installation_pump ADD COLUMN remarks            text default '' ;
ALTER TABLE distribution.installation_pump ADD COLUMN links              text                   ;
ALTER TABLE distribution.installation_pump ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.installation_pump ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE distribution.installation_pump ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.installation_pump ADD COLUMN eca                varchar(30)            ;
/* specific to pumps */
ALTER TABLE distribution.installation_pump ADD COLUMN id_installation   smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE distribution.installation_pump ADD COLUMN nb_pump           smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE distribution.installation_pump ADD COLUMN manometric_height decimal(10,2);

/* geometry */
/*                                 (table_name,         is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('installation_pump',true,    true,        true,             false,    true);

/* primary key */
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)                 MATCH FULL;   CREATE INDEX fki_installation_pump_id_status       ON distribution.installation_pump(id_status)      ;
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)            MATCH FULL;   CREATE INDEX fki_installation_pump_id_distributor  ON distribution.installation_pump(id_distributor) ;
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)            MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_remote  ON distribution.installation_pump(id_remote)      ;
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.vl_pump_type(id) MATCH FULL;   CREATE INDEX fki_vl_pump_type            ON distribution.installation_pump(id_type)        ;



