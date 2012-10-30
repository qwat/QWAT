/*
	qWat - QGIS Water Module
	
	SQL file :: installation <- tank <- cistern -> cistern type
*/

BEGIN;


/* Cistern types */
DROP TABLE IF EXISTS distribution.installation_tank_cistern_type CASCADE;
CREATE TABLE distribution.installation_tank_cistern_type (id serial NOT NULL);
ALTER TABLE distribution.installation_tank_cistern_type ADD COLUMN  name              varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_tank_cistern_type ADD CONSTRAINT installation_tank_cistern_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_tank_cistern_type ("name") VALUES ('cuve cirvulaire');
INSERT INTO distribution.installation_tank_cistern_type ("name") VALUES ('cuve rectangulaire');



/* ******************************** */
/* ******************************** */
/* Cistern */
/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_tank_cistern CASCADE;
CREATE TABLE distribution.installation_tank_cistern (id serial NOT NULL);
SELECT setval('distribution.installation_tank_cistern_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_tank_cistern IS 'storage tanks. These are related to installations and are made of cisterns';
/* columns */
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  id_installation   integer                ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  name              varchar(30) DEFAULT '' ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  id_distributor    integer                ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  id_status         integer                ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  id_type           integer                ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  remarks           text                   ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  dimension_1       numeric(10,1)          ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  dimension_2       numeric(10,1)          ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  storage           numeric(10,1)          ;
ALTER TABLE distribution.installation_tank_cistern ADD COLUMN  litres_per_cm     numeric(7,3)           ;
/* primary key */
ALTER TABLE distribution.installation_tank_cistern ADD CONSTRAINT installation_tank_cistern_pkey PRIMARY KEY (id);
/* Constraints */
/* id_type */
ALTER TABLE distribution.installation_tank_cistern ADD CONSTRAINT installation_tank_cistern_id_installation FOREIGN KEY (id_installation) REFERENCES distribution.installation(id)                   MATCH FULL; CREATE INDEX fki_installation_tank_cistern_id_installation   ON distribution.installation_tank_cistern(id_installation) ;
ALTER TABLE distribution.installation_tank_cistern ADD CONSTRAINT installation_tank_cistern_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)                    MATCH FULL; CREATE INDEX fki_installation_tank_cistern_id_distributor    ON distribution.installation_tank_cistern(id_distributor)  ;
ALTER TABLE distribution.installation_tank_cistern ADD CONSTRAINT installation_tank_cistern_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)                         MATCH FULL; CREATE INDEX fki_installation_tank_cistern_id_status         ON distribution.installation_tank_cistern(id_status)       ;
ALTER TABLE distribution.installation_tank_cistern ADD CONSTRAINT installation_tank_cistern_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.installation_tank_cistern_type(id) MATCH FULL; CREATE INDEX fki_installation_tank_cistern_id_type           ON distribution.installation_tank_cistern(id_type)         ;

COMMIT;

