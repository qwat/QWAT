/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_tank CASCADE;
CREATE TABLE distribution.installation_tank (id serial NOT NULL);
SELECT setval('distribution.installation_tank_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_tank IS 'storage tanks. These are related to installations and are made of cisterns';

/* columns */
ALTER TABLE distribution.installation_tank ADD COLUMN  id_installation   integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  name              varchar(30) DEFAULT '' ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_distributor    integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_status         integer                ;
ALTER TABLE distribution.installation_tank ADD COLUMN  remarks           text                   ;
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_total     numeric(10,1)          ;
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_activ     numeric(10,1)          ;
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_fire      numeric(10,1)          ;
ALTER TABLE distribution.installation_tank ADD COLUMN  height_max        numeric(7,3)           ;
ALTER TABLE distribution.installation_tank ADD COLUMN  litres_per_cm     numeric(7,3)           ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_tank', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_tank_geoidx ON distribution.installation_tank USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_pkey PRIMARY KEY (id);

/* Constraints */
/* id_type */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_installation FOREIGN KEY (id_installation) REFERENCES distribution.installation(id)      MATCH FULL; CREATE INDEX fki_installation_tank_id_installation   ON distribution.installation_tank(id_installation) ;
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)       MATCH FULL; CREATE INDEX fki_installation_tank_id_distributor    ON distribution.installation_tank(id_distributor) ;
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)            MATCH FULL; CREATE INDEX fki_installation_tank_id_status         ON distribution.installation_tank(id_status)      ;

COMMIT;
