/*
	qWat - QGIS Water Module
	
	SQL file :: installation <- tank
*/

BEGIN;

/* Cistern types */
DROP TABLE IF EXISTS distribution.installation_tank_cisterntype CASCADE;
CREATE TABLE distribution.installation_tank_cisterntype (id serial NOT NULL);
ALTER TABLE distribution.installation_tank_cisterntype ADD COLUMN  name  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_tank_cisterntype ADD CONSTRAINT installation_tank_cistern_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_tank_cisterntype ("name") VALUES ('cuve cirvulaire');
INSERT INTO distribution.installation_tank_cisterntype ("name") VALUES ('cuve rectangulaire');





/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_tank CASCADE;
CREATE TABLE distribution.installation_tank (id serial NOT NULL);
SELECT setval('distribution.installation_tank_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_tank IS 'storage tanks. These are related to installations and are made of cisterns';

/* columns */
ALTER TABLE distribution.installation_tank ADD COLUMN  id_installation   integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  name              varchar(30) DEFAULT '' ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_distributor    integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_remote         integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_status         integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  remarks           text                   ;
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_total     numeric(10,1)          ; COMMENT ON COLUMN distribution.installation_tank.storage_total  IS 'cubic meters m3';
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_supply    numeric(10,1)          ; COMMENT ON COLUMN distribution.installation_tank.storage_supply IS 'cubic meters m3';
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_fire      numeric(10,1)          ; COMMENT ON COLUMN distribution.installation_tank.storage_fire   IS 'cubic meters m3';
ALTER TABLE distribution.installation_tank ADD COLUMN  altitude_overflow numeric(7,3)           ;
ALTER TABLE distribution.installation_tank ADD COLUMN  altitude_apron    numeric(7,3)           ;
ALTER TABLE distribution.installation_tank ADD COLUMN  fire_valve        boolean DEFAULT NULL   ;
ALTER TABLE distribution.installation_tank ADD COLUMN  fire_remote       boolean DEFAULT NULL   ;

ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_id_type     integer      ;
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_dimension_1 numeric(10,1);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_dimension_2 numeric(10,1);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_storage     numeric(10,1);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_id_type     integer      ;
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_dimension_1 numeric(10,1);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_dimension_2 numeric(10,1);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_storage     numeric(10,1);

ALTER TABLE distribution.installation_tank ADD COLUMN  litres_per_cm     numeric(7,3)    ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_tank', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_tank_geoidx ON distribution.installation_tank USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_installation FOREIGN KEY (id_installation) REFERENCES distribution.installation(id)        MATCH FULL;   CREATE INDEX fki_installation_tank_id_installation         ON distribution.installation_tank(id_installation);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)         MATCH FULL;   CREATE INDEX fki_installation_tank_id_distributor          ON distribution.installation_tank(id_distributor) ;
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.installation_remote(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_installation_remote  ON distribution.installation_tank(id_remote)      ;
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)              MATCH FULL;   CREATE INDEX fki_installation_tank_id_status               ON distribution.installation_tank(id_status)      ;
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_cistern1type    FOREIGN KEY (cistern1_id_type) REFERENCES distribution.installation_tank_cisterntype(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern1type ON distribution.installation_tank(cistern1_id_type);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_cistern2type    FOREIGN KEY (cistern2_id_type) REFERENCES distribution.installation_tank_cisterntype(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern2type ON distribution.installation_tank(cistern2_id_type);

COMMIT;

