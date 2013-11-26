/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_precisionalti
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.vl_precisionalti CASCADE;
CREATE TABLE distribution.vl_precisionalti (id integer not null, CONSTRAINT "precisionalti_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_precisionalti IS 'pressure vl_precisionalti.';

/* COLUMNS */
ALTER TABLE distribution.vl_precisionalti ADD COLUMN vl_active      boolean default true;
ALTER TABLE distribution.vl_precisionalti ADD COLUMN value_en       varchar(30) default '';
ALTER TABLE distribution.vl_precisionalti ADD COLUMN value_fr       varchar(30) default '';
ALTER TABLE distribution.vl_precisionalti ADD COLUMN description_en varchar(30) default '';
ALTER TABLE distribution.vl_precisionalti ADD COLUMN description_fr varchar(30) default '';
ALTER TABLE distribution.vl_precisionalti ADD COLUMN code_sire      smallint ;

/* VALUES */
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1121,1, 'Unprecised'        ,'Imprécis');  
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1122,0, 'Better than 100 cm','Inférieure à 100 cm');    
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1123,0, 'Better than 50 cm' ,'Inférieure à 50 cm');     
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1124,0, 'Better than 10 cm' ,'Inférieure à 10 cm');     
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1125,0, 'Better than 5 cm'  ,'Inférieure à 5 cm');     
INSERT INTO distribution.vl_precisionalti (id,code_sire,value_en,value_fr) VALUES (1126,1, 'Unknown'           ,'Inconnue');   


