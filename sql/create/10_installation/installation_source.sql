/*
	qWat - QGIS Water Module

	SQL file :: installation source
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_source CASCADE;
CREATE TABLE distribution.od_installation_source (id serial NOT NULL, CONSTRAINT installation_source_pk PRIMARY KEY (id) );
SELECT setval('distribution.od_installation_source_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_source IS '';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_source ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE distribution.od_installation_source ADD COLUMN identification     integer                ;
ALTER TABLE distribution.od_installation_source ADD COLUMN id_status          smallint not null      ;
ALTER TABLE distribution.od_installation_source ADD COLUMN id_distributor     smallint not null      ;
ALTER TABLE distribution.od_installation_source ADD COLUMN id_remote          smallint               ;
ALTER TABLE distribution.od_installation_source ADD COLUMN id_watertype       smallint not null      ;
ALTER TABLE distribution.od_installation_source ADD COLUMN schema_visible        boolean NOT NULL default true ;
ALTER TABLE distribution.od_installation_source ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.od_installation_source ADD COLUMN remark             text default '' ;
ALTER TABLE distribution.od_installation_source ADD COLUMN links              text                   ;
ALTER TABLE distribution.od_installation_source ADD COLUMN year               smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_source ADD COLUMN open_water_surface boolean default false  ;
ALTER TABLE distribution.od_installation_source ADD COLUMN parcel             varchar(30)            ;
ALTER TABLE distribution.od_installation_source ADD COLUMN eca                varchar(30)            ;
/* specific to sources */
ALTER TABLE distribution.od_installation_source ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.od_installation_source ADD COLUMN id_quality        smallint     ;
ALTER TABLE distribution.od_installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE distribution.od_installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE distribution.od_installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE distribution.od_installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE distribution.od_installation_source ADD COLUMN gathering_chamber boolean      ;

/* geometry */
/*                                 (table_name,         is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('od_installation_source',true,    true,        true,             false,    true);

/* Constraints */
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.vl_status(id)         MATCH FULL;   CREATE INDEX fki_installation_source_id_status         ON distribution.od_installation_source(id_status)      ;
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.od_distributor(id)       MATCH FULL;   CREATE INDEX fki_installation_source_id_distributor    ON distribution.od_installation_source(id_distributor) ;
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.vl_remote(id)         MATCH SIMPLE; CREATE INDEX fki_installation_source_id_remote         ON distribution.od_installation_source(id_remote)      ;
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.vl_source_type(id)    MATCH FULL;   CREATE INDEX fki_installation_source_vl_source_type    ON distribution.od_installation_source(id_type)        ;
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES distribution.vl_watertype(id)      MATCH FULL;   CREATE INDEX fki_installation_source_vl_watertype      ON distribution.od_installation_source(id_watertype)   ;
ALTER TABLE distribution.od_installation_source ADD CONSTRAINT installation_source_id_quality      FOREIGN KEY (id_quality)      REFERENCES distribution.vl_source_quality(id) MATCH SIMPLE; CREATE INDEX fki_installation_source_vl_source_quality ON distribution.od_installation_source(id_quality)     ;



