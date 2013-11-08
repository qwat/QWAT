/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_pressurecontrol CASCADE;
CREATE TABLE distribution.installation_pressurecontrol (id serial NOT NULL);
SELECT setval('distribution.installation_pressurecontrol_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_pressurecontrol IS '';

/* common columns to all installations*/
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN identification     integer                ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN id_status          integer                ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN id_distributor     integer                ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN id_remote          integer                ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN view_schema        boolean NOT NULL default true ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN remarks            text        default '' ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN links              text                   ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN year               smallint    check (year > 1800 AND year < 2100);
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN eca                varchar(30)            ;
/* specific to pressurecontrol */
ALTER TABLE distribution.installation_pressurecontrol ADD COLUMN id_type            smallint               ;


/* geometry */
/*                                 (table_name,         is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('installation_pressurecontrol',true,    true,        true,             false,    true);

/* primary key */
ALTER TABLE distribution.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_status      FOREIGN KEY (id_status)      REFERENCES distribution.vl_status(id)          MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_status       ON distribution.installation_pressurecontrol(id_status)      ;
ALTER TABLE distribution.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_distributor FOREIGN KEY (id_distributor) REFERENCES distribution.distributor(id)        MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_distributor  ON distribution.installation_pressurecontrol(id_distributor) ;
ALTER TABLE distribution.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_remote      FOREIGN KEY (id_remote)      REFERENCES distribution.vl_remote(id)          MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_id_remote       ON distribution.installation_pressurecontrol(id_remote)      ;
ALTER TABLE distribution.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_type        FOREIGN KEY (id_type)        REFERENCES distribution.vl_pressurecontrol(id) MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_vl_type         ON distribution.installation_pressurecontrol(id_type)        ;

