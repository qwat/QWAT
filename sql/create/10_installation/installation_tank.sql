/*
	qWat - QGIS Water Module
	
	SQL file :: installation <- tank
*/



/* Tank apron */
DROP TABLE IF EXISTS distribution.installation_tank_overflowtype CASCADE;
CREATE TABLE distribution.installation_tank_overflowtype (id serial NOT NULL);
ALTER TABLE distribution.installation_tank_overflowtype ADD COLUMN  name  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_tank_overflowtype ADD CONSTRAINT installation_tank_overflowtype_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_tank_overflowtype ("name") VALUES ('alimentation commandée');
INSERT INTO distribution.installation_tank_overflowtype ("name") VALUES ('en décharge');
INSERT INTO distribution.installation_tank_overflowtype ("name") VALUES ('récupéré');

/* Cistern types */
DROP TABLE IF EXISTS distribution.installation_tank_firestoragetype CASCADE;
CREATE TABLE distribution.installation_tank_firestoragetype (id serial NOT NULL);
ALTER TABLE distribution.installation_tank_firestoragetype ADD COLUMN  name  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_tank_firestoragetype ADD CONSTRAINT installation_tank_firestoragetype_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('aucune');
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('cuve 1 entière');
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('cuve 1 partielle');
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('cuve 2 entière');
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('cuve 2 partielle');
INSERT INTO distribution.installation_tank_firestoragetype ("name") VALUES ('2 cuves partielles');

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
ALTER TABLE distribution.installation_tank ADD COLUMN  id_installation   integer             ;
ALTER TABLE distribution.installation_tank ADD COLUMN  remarks text;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_overflow       integer             ;
ALTER TABLE distribution.installation_tank ADD COLUMN  id_firestorage    integer             ;
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_total     numeric(10,1)       ; COMMENT ON COLUMN distribution.installation_tank.storage_total  IS 'litres';
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_supply    numeric(10,1)       ; COMMENT ON COLUMN distribution.installation_tank.storage_supply IS 'litres';
ALTER TABLE distribution.installation_tank ADD COLUMN  storage_fire      numeric(10,1)       ; COMMENT ON COLUMN distribution.installation_tank.storage_fire   IS 'litres';
ALTER TABLE distribution.installation_tank ADD COLUMN  altitude_overflow numeric(7,3)        ;
ALTER TABLE distribution.installation_tank ADD COLUMN  altitude_apron    numeric(7,3)        ;
ALTER TABLE distribution.installation_tank ADD COLUMN  height_max        numeric(7,3)        ;
ALTER TABLE distribution.installation_tank ADD COLUMN  fire_valve        boolean DEFAULT NULL;
ALTER TABLE distribution.installation_tank ADD COLUMN  fire_remote       boolean DEFAULT NULL;
ALTER TABLE distribution.installation_tank ADD COLUMN  _litrepercm       numeric(9,3)        ;

ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_id_type     integer      ;
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_dimension_1 numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_dimension_2 numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern1_storage     numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  _cistern1_litrepercm numeric(9,3) ;
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_id_type     integer      ;
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_dimension_1 numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_dimension_2 numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  cistern2_storage     numeric(10,2);
ALTER TABLE distribution.installation_tank ADD COLUMN  _cistern2_litrepercm numeric(9,3) ;


/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_tank', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_tank_geoidx ON distribution.installation_tank USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_installation FOREIGN KEY (id_installation)  REFERENCES distribution.installation(id)                      MATCH FULL;   CREATE INDEX fki_installation_tank_id_installation ON distribution.installation_tank(id_installation);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_overflow     FOREIGN KEY (id_overflow)      REFERENCES distribution.installation_tank_overflowtype(id)    MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_overflow     ON distribution.installation_tank(id_overflow);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_id_firestorage  FOREIGN KEY (id_firestorage)   REFERENCES distribution.installation_tank_firestoragetype(id) MATCH SIMPLE; CREATE INDEX fki_installation_tank_id_firestorage  ON distribution.installation_tank(id_firestorage);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_cistern1type    FOREIGN KEY (cistern1_id_type) REFERENCES distribution.installation_tank_cisterntype(id)     MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern1type    ON distribution.installation_tank(cistern1_id_type);
ALTER TABLE distribution.installation_tank ADD CONSTRAINT installation_tank_cistern2type    FOREIGN KEY (cistern2_id_type) REFERENCES distribution.installation_tank_cisterntype(id)     MATCH SIMPLE; CREATE INDEX fki_installation_tank_cistern2type    ON distribution.installation_tank(cistern2_id_type);


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

CREATE OR REPLACE FUNCTION distribution.installation_tank_trigger_fcn() RETURNS trigger AS
$BODY$
	DECLARE
		lpc1 double precision;
		lpc2 double precision;
	BEGIN
		SELECT distribution.litres_per_cm(NEW.cistern1_id_type,NEW.cistern1_dimension_1,NEW.cistern1_dimension_2) INTO lpc1;
		SELECT distribution.litres_per_cm(NEW.cistern2_id_type,NEW.cistern2_dimension_1,NEW.cistern2_dimension_2) INTO lpc2;
		 UPDATE distribution.installation_tank
			SET _cistern1_litrepercm = lpc1,
			    _cistern2_litrepercm = lpc2,
				_litrepercm = COALESCE(lpc1,0)+COALESCE(lpc2,0)
			WHERE installation_tank.id = NEW.id;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';

CREATE TRIGGER installation_trigger 
	AFTER INSERT OR UPDATE OF cistern1_id_type,cistern1_dimension_1,cistern1_dimension_2,
							  cistern2_id_type,cistern2_dimension_1,cistern2_dimension_2
	ON distribution.installation_tank
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.installation_tank_trigger_fcn();



