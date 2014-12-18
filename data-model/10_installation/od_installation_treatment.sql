/*
	qWat - QGIS Water Module
	
	SQL file :: installation treatment
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_installation_treatment CASCADE;
CREATE TABLE qwat.od_installation_treatment (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_installation_treatment IS 'storage treatments. These are related to installations and are made of cisterns';

/* common columns to all installations*/
ALTER TABLE qwat.od_installation_treatment ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN identification     varchar(25) default '' ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN id_installation    integer                ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN id_status          integer not null       ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN id_remote          integer                ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN remark             text        default '' ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN year               smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_installation_treatment ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN eca                varchar(30) default '' ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_remark       varchar(150) default '';
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_visible_1    smallint default 1;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN label_r_2       double precision default null;

/* specific to treatment */
ALTER TABLE qwat.od_installation_treatment ADD COLUMN sanitization_uv               boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN sanitization_chlorine_liquid  boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN sanitization_chlorine_gazeous boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN sanitization_ozone            boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN filtration_membrane           boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN filtration_sandorgravel       boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN flocculation                  boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN activatedcharcoal             boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN settling                      boolean      ;
ALTER TABLE qwat.od_installation_treatment ADD COLUMN treatment_capacity            decimal(10,2);

/* geometry */
/*                                 ( table_name,        is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_installation_treatment',true,    true,        true,            false,    true,          false);

/* Constraints */
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_id_installation FOREIGN KEY (id_installation) REFERENCES qwat.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_treatment_id_installation ON qwat.od_installation_treatment(id_installation);
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_treatment_id_status       ON qwat.od_installation_treatment(id_status)      ;
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_treatment_id_distributor  ON qwat.od_installation_treatment(id_distributor) ;
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_id_remote       FOREIGN KEY (id_remote)       REFERENCES qwat.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_treatment_id_remote       ON qwat.od_installation_treatment(id_remote)      ;
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES qwat.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_treatment_vl_watertype    ON qwat.od_installation_treatment(id_watertype)   ;
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_treatment_labelvisible_1  ON qwat.od_installation_treatment(label_visible_1) ;
ALTER TABLE qwat.od_installation_treatment ADD CONSTRAINT installation_treatment_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_treatment_labelvisible_2  ON qwat.od_installation_treatment(label_visible_2) ;

/* VIEW */
CREATE OR REPLACE VIEW qwat.vw_installation_treatment_fr AS
SELECT
	od_installation_treatment.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype
	FROM qwat.od_installation_treatment
	INNER JOIN      qwat.vl_status          ON vl_status.id          = od_installation_treatment.id_status
	INNER JOIN      qwat.od_distributor     ON od_distributor.id     = od_installation_treatment.id_distributor
	LEFT OUTER JOIN qwat.vl_remote          ON vl_remote.id          = od_installation_treatment.id_remote
	INNER JOIN      qwat.vl_watertype       ON vl_watertype.id       = od_installation_treatment.id_watertype;
