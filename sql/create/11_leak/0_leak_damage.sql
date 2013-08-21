/*
	qWat - QGIS Water Module

	SQL file :: leak_damage table
*/


DROP TABLE IF EXISTS distribution.leak_damage CASCADE;
CREATE TABLE distribution.leak_damage ( id SERIAL, CONSTRAINT "leak_damage_pk" PRIMARY KEY (id));

/* Columns*/
ALTER TABLE distribution.leak_damage ADD COLUMN name VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.leak_damage ADD CONSTRAINT unique_damage UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.leak_damage IS 'Damages to leak';


INSERT INTO distribution.leak_damage ( name ) VALUES ('aucun');  
INSERT INTO distribution.leak_damage ( name ) VALUES ('faible'); 
INSERT INTO distribution.leak_damage ( name ) VALUES ('moyen');  
INSERT INTO distribution.leak_damage ( name ) VALUES ('important');  




