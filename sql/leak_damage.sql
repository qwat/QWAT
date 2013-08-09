/*
	qWat - QGIS Water Module

	SQL file :: leak_damage table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.leak_damage CASCADE;
CREATE TABLE distribution.leak_damage ( id SERIAL, CONSTRAINT "leak_damage_pk" PRIMARY KEY (id));

/* Columns*/
ALTER TABLE distribution.leak_damage ADD COLUMN "damage" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.leak_damage ADD CONSTRAINT unique_damage UNIQUE ("damage");

/* Comment */
COMMENT ON TABLE distribution.leak_damage IS 'Types of leak';


INSERT INTO distribution.leak_damage ( damage ) VALUES ('aucun');  
INSERT INTO distribution.leak_damage ( damage ) VALUES ('faible'); 
INSERT INTO distribution.leak_damage ( damage ) VALUES ('moyen');  
INSERT INTO distribution.leak_damage ( damage ) VALUES ('important');  



COMMIT;
