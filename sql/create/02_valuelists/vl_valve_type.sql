/*
	qWat - QGIS Water Module

	SQL file :: vl_valve_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat.vl_valve_type CASCADE;
CREATE TABLE qwat.vl_valve_type ( id integer not null, CONSTRAINT "vl_valve_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat.vl_valve_type IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE qwat.vl_valve_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN short_fr VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN short_en VARCHAR(5) default '';

/* COLUMNS */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6301, 'vanne à gauche');            /* 1  VG  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6302, 'vanne clayton');             /* 2  CL  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6303, 'vanne annulaire');           /* 3  VAN */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6304, 'inconnu')   ;                /* 4  I   */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6305, 'jauge');                     /* 5  J   */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6306, 'limiteur de débit');         /* 6  LD  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6307, 'purge');                     /* 7  PU  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6308, 'soupape automatique');       /* 8  SA  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6309, 'sprinkler');                 /* 9  SP  */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6310, 'vanne');                     /* 10 V   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, short_fr ) VALUES (6311, 'vanne papillon', 'P'); /* 11 P   */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6312, 'Elgef');                     /* 12 E   */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6313, 'arrêt');                     /* 13 A   */
INSERT INTO qwat.vl_valve_type ( id, value_fr ) VALUES (6314, 'vanne télécommandée');       /* 14 TEL */


