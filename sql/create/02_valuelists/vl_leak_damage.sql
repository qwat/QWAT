/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_damage table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_damage CASCADE;
CREATE TABLE distribution.vl_leak_damage ( id SERIAL, CONSTRAINT "vl_leak_damage_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_damage IS 'Damages to leak';

/* COLUMNS*/
ALTER TABLE distribution.vl_leak_damage ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_damage ADD COLUMN value_en VARCHAR(30) default '';


/* VALUES */
INSERT INTO distribution.vl_leak_damage ( value_fr ) VALUES ('aucun');  
INSERT INTO distribution.vl_leak_damage ( value_fr ) VALUES ('faible'); 
INSERT INTO distribution.vl_leak_damage ( value_fr ) VALUES ('moyen');  
INSERT INTO distribution.vl_leak_damage ( value_fr ) VALUES ('important');  




