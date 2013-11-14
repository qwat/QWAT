/*
	qWat - QGIS Water Module
	
	SQL file :: installation treatment
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_treatment CASCADE;
CREATE TABLE distribution.od_installation_treatment (id serial NOT NULL);
SELECT setval('distribution.od_installation_treatment_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_treatment IS 'storage treatments. These are related to installations and are made of cisterns';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_treatment ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN identification     integer                ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN id_status          smallint not null      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN id_distributor     smallint not null      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN id_remote          smallint               ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN id_watertype       smallint not null      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN schema_visible        boolean NOT NULL default true ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN remarks            text        default '' ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN links              text                   ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN year               smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_treatment ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN eca                varchar(30)            ;
/* specific to treatment */
ALTER TABLE distribution.od_installation_treatment ADD COLUMN sanitization_uv               boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN sanitization_chlorine_liquid  boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN sanitization_chlorine_gazeous boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN sanitization_ozone            boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN filtration_membrane           boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN filtration_sandorgravel       boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN flocculation                  boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN activatedcharcoal             boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN settling                      boolean      ;
ALTER TABLE distribution.od_installation_treatment ADD COLUMN treatment_capacity            decimal(10,2);

/* geometry */
/*                                 (table_name,              is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('installation_treatment',true,    true,        true,             false,    true);

/* primary key */
ALTER TABLE distribution.od_installation_treatment ADD CONSTRAINT installation_treatment_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.od_installation_treatment ADD CONSTRAINT installation_treatment_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)    MATCH FULL;   CREATE INDEX fki_installation_treatment_id_status      ON distribution.od_installation_treatment(id_status)      ;
ALTER TABLE distribution.od_installation_treatment ADD CONSTRAINT installation_treatment_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.od_distributor(id)  MATCH FULL;   CREATE INDEX fki_installation_treatment_id_distributor ON distribution.od_installation_treatment(id_distributor) ;
ALTER TABLE distribution.od_installation_treatment ADD CONSTRAINT installation_treatment_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)    MATCH SIMPLE; CREATE INDEX fki_installation_treatment_id_remote      ON distribution.od_installation_treatment(id_remote)      ;
ALTER TABLE distribution.od_installation_treatment ADD CONSTRAINT installation_treatment_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES distribution.vl_watertype(id) MATCH FULL;   CREATE INDEX fki_installation_treatment_vl_watertype   ON distribution.od_installation_treatment(id_watertype)   ;


