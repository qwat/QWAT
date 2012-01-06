/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.zones CASCADE;
CREATE TABLE distribution.zones (id serial NOT NULL);

ALTER TABLE distribution.zones ADD COLUMN  short_name varchar(10);
ALTER TABLE distribution.zones ADD COLUMN  name       varchar(30);
ALTER TABLE distribution.zones ADD COLUMN  lbl_x double precision;
ALTER TABLE distribution.zones ADD COLUMN  lbl_y double precision;
ALTER TABLE distribution.zones ADD COLUMN  lbl_a double precision;

SELECT AddGeometryColumn('distribution', 'zones', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.zones ADD CONSTRAINT zones_pkey PRIMARY KEY (id);
ALTER TABLE distribution.zones ADD CONSTRAINT zones_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.zones IS 'pressure zones.';

INSERT INTO distribution.zones (short_name,name) VALUES ('SAS',  'Sassey');                       
INSERT INTO distribution.zones (short_name,name) VALUES ('AVG',  'Avants-Glion');                 
INSERT INTO distribution.zones (short_name,name) VALUES ('BAU',  'Baume');                        
INSERT INTO distribution.zones (short_name,name) VALUES ('BOUV', 'Bouveret');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('CAUX', 'Caux');                         
INSERT INTO distribution.zones (short_name,name) VALUES ('CHAM', 'Chamby');                       
INSERT INTO distribution.zones (short_name,name) VALUES ('BIG',  'Bignières');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('CYB',  'Crêt-y-Bau');                   
INSERT INTO distribution.zones (short_name,name) VALUES ('CHAU', 'Chaux');                        
INSERT INTO distribution.zones (short_name,name) VALUES ('GLI',  'Glion');                        
INSERT INTO distribution.zones (short_name,name) VALUES ('GORG', 'Gorgollion');                   
INSERT INTO distribution.zones (short_name,name) VALUES ('GRAN', 'Grandchamp');                   
INSERT INTO distribution.zones (short_name,name) VALUES ('JAM',  'Jaman-Lac');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('LS',   'Lausanne');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('MJ',   'Maison Jean');                  
INSERT INTO distribution.zones (short_name,name) VALUES ('MM',   'Maison-Monney');                
INSERT INTO distribution.zones (short_name,name) VALUES ('SOM',  'Sommet');                       
INSERT INTO distribution.zones (short_name,name) VALUES ('VEY',  'Veytaux');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('NANT', 'Nant');                         
INSERT INTO distribution.zones (short_name,name) VALUES ('NBU',  'Noyer-Bu');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('ORGE', 'Orgevaux');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('PACO', 'Pacoresse');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('PAN',  'Panessière');                   
INSERT INTO distribution.zones (short_name,name) VALUES ('PEH',  'Pays d''En-haut');              
INSERT INTO distribution.zones (short_name,name) VALUES ('PER',  'Perrettaz');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('PC',   'Plan Châtel');                  
INSERT INTO distribution.zones (short_name,name) VALUES ('PP',   'Pont de Pierre');               
INSERT INTO distribution.zones (short_name,name) VALUES ('PREI', 'Preisaz');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('PRIV', 'Privé');                        
INSERT INTO distribution.zones (short_name,name) VALUES ('SONC', 'Sonchaux');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('SONL', 'Sonloup');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('SSONZ','Sous-Sonzier');                 
INSERT INTO distribution.zones (short_name,name) VALUES ('SUSM', 'Sus Mont');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('COR',  'Corsier');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('STP',  'St-Pierre');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('BY',   'Blonay');                       
INSERT INTO distribution.zones (short_name,name) VALUES ('REM',  'Remaufens');                    
INSERT INTO distribution.zones (short_name,name) VALUES ('RAN',  'Rantzgot');                     
INSERT INTO distribution.zones (short_name,name) VALUES ('BS',   'Bouveret supérieur');           
INSERT INTO distribution.zones (short_name,name) VALUES ('CONF', 'Confin du Renard');             
INSERT INTO distribution.zones (short_name,name) VALUES ('SOLL', 'Sollard');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('COUF', 'Couffaz');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('LIB',  'Liboson');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('MH',   'Mountain-House');               
INSERT INTO distribution.zones (short_name,name) VALUES ('CHAM', 'Chamossallaz');                 
INSERT INTO distribution.zones (short_name,name) VALUES ('PRAZ', 'Praz-Fornay');                  
INSERT INTO distribution.zones (short_name,name) VALUES ('MANO', 'Manoïre');                      
INSERT INTO distribution.zones (short_name,name) VALUES ('JOR',  'Jor');                          
COMMIT;
