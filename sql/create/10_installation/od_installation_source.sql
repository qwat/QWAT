/*
	qWat - QGIS Water Module

	SQL file :: installation source
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_installation_source CASCADE;
CREATE TABLE qwat.od_installation_source (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_installation_source IS '';

/* common columns to all installations*/
ALTER TABLE qwat.od_installation_source ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat.od_installation_source ADD COLUMN identification     varchar(25) default '' ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_installation    integer                ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_status          integer not null       ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_remote          integer                ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE qwat.od_installation_source ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat.od_installation_source ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat.od_installation_source ADD COLUMN remark             text default '' ;
ALTER TABLE qwat.od_installation_source ADD COLUMN year               smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_installation_source ADD COLUMN open_water_surface boolean default false  ;
ALTER TABLE qwat.od_installation_source ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE qwat.od_installation_source ADD COLUMN eca                varchar(30) default '' ;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_remark            varchar(150) default '';
ALTER TABLE qwat.od_installation_source ADD COLUMN label_visible_1     smallint default 1;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_installation_source ADD COLUMN label_r_2       double precision default null;
/* specific to sources */
ALTER TABLE qwat.od_installation_source ADD COLUMN id_type           smallint     ;
ALTER TABLE qwat.od_installation_source ADD COLUMN id_quality        smallint     ;
ALTER TABLE qwat.od_installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE qwat.od_installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE qwat.od_installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE qwat.od_installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE qwat.od_installation_source ADD COLUMN gathering_chamber boolean      ;

/* geometry */
/*                                 (table_name,      is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_installation_source',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_installation FOREIGN KEY (id_installation) REFERENCES qwat.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_source_id_installation   ON qwat.od_installation_source(id_installation);
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_source_id_status         ON qwat.od_installation_source(id_status)      ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_source_id_distributor    ON qwat.od_installation_source(id_distributor) ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_remote       FOREIGN KEY (id_remote)       REFERENCES qwat.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_source_id_remote         ON qwat.od_installation_source(id_remote)      ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES qwat.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_source_vl_watertype      ON qwat.od_installation_source(id_watertype)   ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_source_labelvisible_1  ON qwat.od_installation_source(label_visible_1) ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_source_labelvisible_2  ON qwat.od_installation_source(label_visible_2) ;
/* specific */
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_type         FOREIGN KEY (id_type)         REFERENCES qwat.vl_source_type(id)           MATCH FULL;   CREATE INDEX fki_installation_source_vl_source_type    ON qwat.od_installation_source(id_type)        ;
ALTER TABLE qwat.od_installation_source ADD CONSTRAINT installation_source_id_quality      FOREIGN KEY (id_quality)      REFERENCES qwat.vl_source_quality(id)        MATCH SIMPLE; CREATE INDEX fki_installation_source_vl_source_quality ON qwat.od_installation_source(id_quality)     ;



/* VIEW */
CREATE OR REPLACE VIEW qwat.vw_installation_source_fr AS
SELECT
	od_installation_source.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype,
	vl_source_type.value_fr AS type,
	vl_source_quality.value_fr AS quality
	FROM qwat.od_installation_source
	INNER JOIN      qwat.vl_status         ON vl_status.id         = od_installation_source.id_status
	INNER JOIN      qwat.od_distributor    ON od_distributor.id    = od_installation_source.id_distributor
	LEFT OUTER JOIN qwat.vl_remote         ON vl_remote.id         = od_installation_source.id_remote
	INNER JOIN      qwat.vl_watertype      ON vl_watertype.id      = od_installation_source.id_watertype
	INNER JOIN      qwat.vl_source_type    ON vl_source_type.id    = od_installation_source.id_type
	LEFT OUTER JOIN qwat.vl_source_quality ON vl_source_quality.id = od_installation_source.id_quality;

