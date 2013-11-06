/*
	qWat - QGIS Water Module

	SQL file :: vl_valve_type table
*/


/* CREATE */
DROP TABLE IF EXISTS distribution.vl_valve_type CASCADE;
CREATE TABLE distribution.vl_valve_type ( id SERIAL, CONSTRAINT "vl_valve_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_valve_type IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE distribution.vl_valve_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE distribution.vl_valve_type ADD COLUMN value_fr VARCHAR(30) default '';

/* COLUMNS */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 1, 'vanne à gauche');            /* 1  VG  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 2, 'vanne clayton');             /* 2  CL  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 3, 'vanne annulaire');           /* 3  VAN */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 4, 'inconnu')   ;                /* 4  I   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 5, 'jauge');                     /* 5  J   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 6, 'limiteur de débit');         /* 6  LD  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 7, 'purge');                     /* 7  PU  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 8, 'soupape automatique');       /* 8  SA  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES ( 9, 'sprinkler');                 /* 9  SP  */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES (10, 'vanne');                     /* 10 V   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES (11, 'vanne papillon');            /* 11 P   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES (12, 'Elgef');                     /* 12 E   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES (13, 'arrêt');                     /* 13 A   */
INSERT INTO distribution.vl_valve_type ( id, value_fr ) VALUES (14, 'vanne télécommandée');       /* 14 TEL */


