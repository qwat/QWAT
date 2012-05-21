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


INSERT INTO distribution.valves_type ( type ) VALUES ('vanne à gauche');                                                                                                                                                                                                                                                           
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne clayton');                 
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne annulaire');                                                                                                                                                                                                                                 
INSERT INTO distribution.valves_type ( type ) VALUES ('inconnu')   ;                 
INSERT INTO distribution.valves_type ( type ) VALUES ('jauge');
INSERT INTO distribution.valves_type ( type ) VALUES ('limiteur de débit');
INSERT INTO distribution.valves_type ( type ) VALUES ('purge');                                                                                                                                                                                                                                                                                                                                                                                             
INSERT INTO distribution.valves_type ( type ) VALUES ('soupape automatique');
INSERT INTO distribution.valves_type ( type ) VALUES ('sprinkler');                                                                                                                                                                                                                                                                                                                                                                                             
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne');
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne papillon');                                                                                                                                                                                                                                                                                                                                                  
INSERT INTO distribution.valves_type ( type ) VALUES ('Elgef');
INSERT INTO distribution.valves_type ( type ) VALUES ('arrêt');                                                                                                                                                                                                                                                                                        
INSERT INTO distribution.valves_type ( type ) VALUES ('vanne télécommandée');   

COMMIT;
