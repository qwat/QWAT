/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_damage table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_damage CASCADE;
CREATE TABLE distribution.vl_leak_damage ( id integer not null, CONSTRAINT "vl_leak_damage_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_damage IS 'Damages to leak';

/* COLUMNS*/
ALTER TABLE distribution.vl_leak_damage ADD COLUMN vl_active boolean defaut true;
ALTER TABLE distribution.vl_leak_damage ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_damage ADD COLUMN value_en VARCHAR(30) default '';


/* VALUES */
INSERT INTO distribution.vl_leak_damage (id,value_fr) VALUES (9201,'aucun');  
INSERT INTO distribution.vl_leak_damage (id,value_fr) VALUES (9202,'faible'); 
INSERT INTO distribution.vl_leak_damage (id,value_fr) VALUES (9203,'moyen');  
INSERT INTO distribution.vl_leak_damage (id,value_fr) VALUES (9204,'important');  




