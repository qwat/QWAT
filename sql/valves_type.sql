/*
	qWat - QGIS Water Module
	
	SQL file :: valves_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.valves_type CASCADE;
CREATE TABLE distribution.valves_type ( id SERIAL, CONSTRAINT "valves_type_pk" PRIMARY KEY (id));                          

/* Columns*/
ALTER TABLE distribution.valves_type ADD COLUMN "type" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.valves_type ADD CONSTRAINT unique_type UNIQUE ("type");

/* Comment */
COMMENT ON TABLE distribution.valves_type IS 'Types of valves';


INSERT INTO distribution.valves_type ( type ) VALUES ('vanne à gauche');            /* 1  VG  */                                                                                                                                                                                                                                              
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne clayton');             /* 2  CL  */
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne annulaire');           /* 3  VAN */                                                                                                                                                                                                                 
INSERT INTO distribution.valves_type ( type ) VALUES ('inconnu')   ;                /* 4  I   */
INSERT INTO distribution.valves_type ( type ) VALUES ('jauge');                     /* 5  J   */
INSERT INTO distribution.valves_type ( type ) VALUES ('limiteur de débit');         /* 6  LD  */
INSERT INTO distribution.valves_type ( type ) VALUES ('purge');                     /* 7  PU  */                                                                                                                                                                                                                                                                                                                                                                   
INSERT INTO distribution.valves_type ( type ) VALUES ('soupape automatique');       /* 8  SA  */
INSERT INTO distribution.valves_type ( type ) VALUES ('sprinkler');                 /* 9  SP  */                                                                                                                                                                                                                                                                                                                                                                       
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne');                     /* 10 V   */
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne papillon');            /* 11 P   */                                                                                                                                                                                                                                                                                                                                 
INSERT INTO distribution.valves_type ( type ) VALUES ('Elgef');                     /* 12 E   */
INSERT INTO distribution.valves_type ( type ) VALUES ('arrêt');                     /* 13 A   */                                                                                                                                                                                                                                                              
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne télécommandée');       /* 14 TEL */

COMMIT;
