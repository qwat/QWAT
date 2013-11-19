/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank 
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_installation_tank CASCADE;
CREATE TABLE distribution.od_installation_tank (id serial NOT NULL, CONSTRAINT installation_tank_pk PRIMARY KEY (id) );
SELECT setval('distribution.od_installation_tank_id_seq', 100, true);
COMMENT ON TABLE distribution.od_installation_tank IS 'storage tanks. These are related to installations and are made of cisterns';

/* common columns to all installations*/
ALTER TABLE distribution.od_installation_tank ADD COLUMN name                 varchar(40) default '' ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN identification       integer                ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_status            smallint not null      ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_distributor       smallint not null      ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_remote            smallint               ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_watertype         smallint not null      ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN schema_visible          boolean   default true ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN remark               text        default '' ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN links                text                   ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN year                 smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.od_installation_tank ADD COLUMN open_water_surface   boolean default False  ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN parcel               varchar(30)            ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN eca                  varchar(30)            ;
/* specific to tanks */
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_installation      integer             ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_overflow          integer             ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN id_firestorage       integer             ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN storage_total        numeric(10,1)       ; COMMENT ON COLUMN distribution.od_installation_tank.storage_total  IS 'litres';
ALTER TABLE distribution.od_installation_tank ADD COLUMN storage_supply       numeric(10,1)       ; COMMENT ON COLUMN distribution.od_installation_tank.storage_supply IS 'litres';
ALTER TABLE distribution.od_installation_tank ADD COLUMN storage_fire         numeric(10,1)       ; COMMENT ON COLUMN distribution.od_installation_tank.storage_fire   IS 'litres';
ALTER TABLE distribution.od_installation_tank ADD COLUMN altitude_overflow    numeric(7,3)        ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN altitude_apron       numeric(7,3)        ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN height_max           numeric(7,3)        ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN fire_valve           boolean default NULL;
ALTER TABLE distribution.od_installation_tank ADD COLUMN fire_remote          boolean default NULL;
ALTER TABLE distribution.od_installation_tank ADD COLUMN _litrepercm          numeric(9,3)        ;

ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern1_id_type     integer      ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern1_dimension_1 numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern1_dimension_2 numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern1_storage     numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN _cistern1_litrepercm numeric(9,3) ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern2_id_type     integer      ;
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern2_dimension_1 numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern2_dimension_2 numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN cistern2_storage     numeric(10,2);
ALTER TABLE distribution.od_installation_tank ADD COLUMN _cistern2_litrepercm numeric(9,3) ;


/* geometry */
/*                                 (table_name,         is_node, create_node, create_schematic, get_pipe, auto_district)*/
SELECT distribution.geom_tool_point('od_installation_tank',true,    true,        true,             false,    true);

/* Constraints */
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_status       FOREIGN KEY (id_status)        REFERENCES distribution.vl_status(id)          MATCH FULL;   CREATE INDEX fki_installation_tank_id_status      ON distribution.od_installation_tank(id_status)       ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_distributor  FOREIGN KEY (id_distributor)   REFERENCES distribution.od_distributor(id)        MATCH FULL;   CREATE INDEX fki_installation_tank_id_distributor ON distribution.od_installation_tank(id_distributor)  ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_remote       FOREIGN KEY (id_remote)        REFERENCES distribution.vl_remote(id)          MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_remote      ON distribution.od_installation_tank(id_remote)       ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_watertype    FOREIGN KEY (id_watertype)     REFERENCES distribution.vl_watertype(id)       MATCH FULL;   CREATE INDEX fki_installation_tank_vl_watertype   ON distribution.od_installation_tank(id_watertype)    ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_overflow     FOREIGN KEY (id_overflow)      REFERENCES distribution.vl_overflow(id)        MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_overflow    ON distribution.od_installation_tank(id_overflow)     ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_id_firestorage  FOREIGN KEY (id_firestorage)   REFERENCES distribution.vl_tank_firestorage(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_firestorage ON distribution.od_installation_tank(id_firestorage)  ;
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_cistern1type    FOREIGN KEY (cistern1_id_type) REFERENCES distribution.vl_cistern(id)         MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern1type   ON distribution.od_installation_tank(cistern1_id_type);
ALTER TABLE distribution.od_installation_tank ADD CONSTRAINT installation_tank_cistern2type    FOREIGN KEY (cistern2_id_type) REFERENCES distribution.vl_cistern(id)         MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern2type   ON distribution.od_installation_tank(cistern2_id_type);


/* Function */
CREATE OR REPLACE FUNCTION distribution.litres_per_cm(id_type integer,dim1 double precision, dim2 double precision) RETURNS double precision AS
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
COMMENT ON FUNCTION distribution.litres_per_cm(integer, double precision, double precision) IS 'Calculate the litres_per_cm of a tank cistern.';

/* Triggers */

CREATE OR REPLACE FUNCTION distribution.od_installation_tank_trigger_fcn() RETURNS trigger AS
$BODY$
	DECLARE
		lpc1 double precision;
		lpc2 double precision;
	BEGIN
		SELECT distribution.litres_per_cm(NEW.cistern1_id_type,NEW.cistern1_dimension_1,NEW.cistern1_dimension_2) INTO lpc1;
		SELECT distribution.litres_per_cm(NEW.cistern2_id_type,NEW.cistern2_dimension_1,NEW.cistern2_dimension_2) INTO lpc2;
		 UPDATE distribution.od_installation_tank
			SET _cistern1_litrepercm = lpc1,
			    _cistern2_litrepercm = lpc2,
				_litrepercm = COALESCE(lpc1,0)+COALESCE(lpc2,0)
			WHERE od_installation_tank.id = NEW.id;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';

CREATE TRIGGER installation_trigger 
	AFTER INSERT OR UPDATE OF cistern1_id_type,cistern1_dimension_1,cistern1_dimension_2,
							  cistern2_id_type,cistern2_dimension_1,cistern2_dimension_2
	ON distribution.od_installation_tank
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_installation_tank_trigger_fcn();



