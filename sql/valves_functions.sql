/*
	qWat - QGIS Water Module
	
	SQL file :: valves_function table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.valves_function CASCADE;
CREATE TABLE distribution.valves_function ( id SERIAL, CONSTRAINT "valves_function_pk" PRIMARY KEY (id));                          

/* Columns*/
ALTER TABLE distribution.valves_function ADD COLUMN "function" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.valves_function ADD CONSTRAINT unique_function UNIQUE ("function");

/* Comment */
COMMENT ON TABLE distribution.valves_function IS 'Types of valves';

INSERT INTO distribution.valves_function ( function ) VALUES ('vanne de régulation');
INSERT INTO distribution.valves_function ( function ) VALUES ('ventouse');           
INSERT INTO distribution.valves_function ( function ) VALUES ('vanne by-pass');      
INSERT INTO distribution.valves_function ( function ) VALUES ('vanne d''ouvrage');   
INSERT INTO distribution.valves_function ( function ) VALUES ('organe abonné');      
INSERT INTO distribution.valves_function ( function ) VALUES ('prise de secours');   
INSERT INTO distribution.valves_function ( function ) VALUES ('vanne incendie');     
INSERT INTO distribution.valves_function ( function ) VALUES ('vanne d''hydrant');   
INSERT INTO distribution.valves_function ( function ) VALUES ('inconnu');            
INSERT INTO distribution.valves_function ( function ) VALUES ('vidange');            
INSERT INTO distribution.valves_function ( function ) VALUES ('organe réseau');      
INSERT INTO distribution.valves_function ( function ) VALUES ('vidange-ventouse');   

COMMIT;
