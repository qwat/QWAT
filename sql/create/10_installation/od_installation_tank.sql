/*
	qWat - QGIS Water Module

	SQL file :: installation tank
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_installation_tank CASCADE;
CREATE TABLE qwat.od_installation_tank (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_installation_tank IS 'storage tanks. These are related to installations and are made of cisterns';

/* common columns to all installations*/
ALTER TABLE qwat.od_installation_tank ADD COLUMN name                 varchar(40) default '' ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN identification       varchar(25) default '' ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_installation      integer                ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_status            integer not null       ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_distributor       integer not null       ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_remote            integer                ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_watertype         integer not null       ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN schema_visible       boolean not null default true ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN remark               text        default '' ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN year                 smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_installation_tank ADD COLUMN open_water_surface   boolean default False  ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN parcel               varchar(30) default '' ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN eca                  varchar(30) default '' ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_remark         varchar(150) default '';
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_visible_1      smallint default 1;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_installation_tank ADD COLUMN label_r_2       double precision default null;
/* specific to tanks */
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_overflow          integer             ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN id_firestorage       integer             ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN storage_total        numeric(10,1)       ; COMMENT ON COLUMN qwat.od_installation_tank.storage_total  IS 'litres';
ALTER TABLE qwat.od_installation_tank ADD COLUMN storage_supply       numeric(10,1)       ; COMMENT ON COLUMN qwat.od_installation_tank.storage_supply IS 'litres';
ALTER TABLE qwat.od_installation_tank ADD COLUMN storage_fire         numeric(10,1)       ; COMMENT ON COLUMN qwat.od_installation_tank.storage_fire   IS 'litres';
ALTER TABLE qwat.od_installation_tank ADD COLUMN altitude_overflow    numeric(7,3)        ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN altitude_apron       numeric(7,3)        ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN height_max           numeric(7,3)        ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN fire_valve           boolean default NULL;
ALTER TABLE qwat.od_installation_tank ADD COLUMN fire_remote          boolean default NULL;
ALTER TABLE qwat.od_installation_tank ADD COLUMN _litrepercm          numeric(9,3)        ;

ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern1_id_type     integer      ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern1_dimension_1 numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern1_dimension_2 numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern1_storage     numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN _cistern1_litrepercm numeric(9,3) ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern2_id_type     integer      ;
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern2_dimension_1 numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern2_dimension_2 numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN cistern2_storage     numeric(10,2);
ALTER TABLE qwat.od_installation_tank ADD COLUMN _cistern2_litrepercm numeric(9,3) ;


/* geometry */
/*                                 (table_name,     is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_installation_tank',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_installation FOREIGN KEY (id_installation)  REFERENCES qwat.od_installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_installation ON qwat.od_installation_tank(id_installation) ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_status       FOREIGN KEY (id_status)        REFERENCES qwat.vl_status(id)                MATCH FULL;   CREATE INDEX fki_installation_tank_id_status       ON qwat.od_installation_tank(id_status)       ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_distributor  FOREIGN KEY (id_distributor)   REFERENCES qwat.od_distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_tank_id_distributor  ON qwat.od_installation_tank(id_distributor)  ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_remote       FOREIGN KEY (id_remote)        REFERENCES qwat.vl_remote(id)                MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_remote       ON qwat.od_installation_tank(id_remote)       ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_watertype    FOREIGN KEY (id_watertype)     REFERENCES qwat.vl_watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_tank_vl_watertype    ON qwat.od_installation_tank(id_watertype)    ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_tank_labelvisible_1  ON qwat.od_installation_tank(label_visible_1) ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_tank_labelvisible_2  ON qwat.od_installation_tank(label_visible_2) ;
/* specific */
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_overflow     FOREIGN KEY (id_overflow)      REFERENCES qwat.vl_overflow(id)              MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_overflow     ON qwat.od_installation_tank(id_overflow)     ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_id_firestorage  FOREIGN KEY (id_firestorage)   REFERENCES qwat.vl_tank_firestorage(id)      MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_firestorage  ON qwat.od_installation_tank(id_firestorage)  ;
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_cistern1type    FOREIGN KEY (cistern1_id_type) REFERENCES qwat.vl_cistern(id)               MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern1type    ON qwat.od_installation_tank(cistern1_id_type);
ALTER TABLE qwat.od_installation_tank ADD CONSTRAINT installation_tank_cistern2type    FOREIGN KEY (cistern2_id_type) REFERENCES qwat.vl_cistern(id)               MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern2type    ON qwat.od_installation_tank(cistern2_id_type);


/* Function */
CREATE OR REPLACE FUNCTION qwat.fn_litres_per_cm(id_type integer,dim1 double precision, dim2 double precision) RETURNS double precision AS
$BODY$
	BEGIN
		IF id_type = 1 THEN
			return pi()*(dim1/2)^2*10;
		ELSEIF id_type = 2 THEN
			return dim2*dim2*10;
		ELSE
			return NULL;
		END IF;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_litres_per_cm(integer, double precision, double precision) IS 'Calculate the litres_per_cm of a tank cistern.';

/* Triggers */

CREATE OR REPLACE FUNCTION qwat.ft_installation_tank() RETURNS trigger AS
$BODY$
	BEGIN
		NEW._cistern1_litrepercm := qwat.fn_litres_per_cm(NEW.cistern1_id_type,NEW.cistern1_dimension_1,NEW.cistern1_dimension_2);
		NEW._cistern2_litrepercm := qwat.fn_litres_per_cm(NEW.cistern2_id_type,NEW.cistern2_dimension_1,NEW.cistern2_dimension_2);
		NEW._litrepercm := COALESCE(_cistern1_litrepercm,0)+COALESCE(_cistern2_litrepercm,0);
		RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';

CREATE TRIGGER tr_installation
	BEFORE INSERT OR UPDATE OF cistern1_id_type,cistern1_dimension_1,cistern1_dimension_2,
							   cistern2_id_type,cistern2_dimension_1,cistern2_dimension_2
	ON qwat.od_installation_tank
	FOR EACH ROW
	EXECUTE PROCEDURE qwat.ft_installation_tank();



/* VIEW */
CREATE OR REPLACE VIEW qwat.vw_installation_tank_fr AS
SELECT
	od_installation_tank.*,
	vl_status.value_fr AS status,
	vl_status.active AS active,
	od_distributor.name AS distributor,
	vl_remote.value_fr AS remote,
	vl_watertype.value_fr AS watertype,
	vl_overflow.value_fr AS overflow,
	vl_tank_firestorage.value_fr AS firestorage,
	cis1.value_fr AS cistern1,
	cis2.value_fr AS cistern2
	FROM qwat.od_installation_tank
	INNER JOIN      qwat.vl_status           ON vl_status.id           = od_installation_tank.id_status
	INNER JOIN      qwat.od_distributor      ON od_distributor.id      = od_installation_tank.id_distributor
	LEFT OUTER JOIN qwat.vl_remote           ON vl_remote.id           = od_installation_tank.id_remote
	INNER JOIN      qwat.vl_watertype        ON vl_watertype.id        = od_installation_tank.id_watertype
	LEFT OUTER JOIN qwat.vl_overflow         ON vl_overflow.id         = od_installation_tank.id_overflow    
	LEFT OUTER JOIN qwat.vl_tank_firestorage ON vl_tank_firestorage.id = od_installation_tank.id_firestorage
	LEFT OUTER JOIN qwat.vl_cistern    cis1  ON cis1.id          = od_installation_tank.cistern1_id_type
	LEFT OUTER JOIN qwat.vl_cistern    cis2  ON cis2.id          = od_installation_tank.cistern2_id_type;


