/*
	qWat - QGIS Water Module
	
	SQL file :: installations_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.installations_type CASCADE;
CREATE TABLE distribution.installations_type ( id SERIAL, CONSTRAINT "installations_type_pk" PRIMARY KEY (id) );

/* Columns*/
ALTER TABLE distribution.installations_type ADD COLUMN "short_name" VARCHAR(5);
ALTER TABLE distribution.installations_type ADD COLUMN "name"       VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.installations_type ADD CONSTRAINT type_name UNIQUE ("name");

/* Comment */
COMMENT ON TABLE distribution.installations_type IS 'type for installations.';

/* Predefined types list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.installations_type (short_name,name) VALUES ('I'  ,'Inconnu');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('R'  ,'Réservoir');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('S'  ,'Source');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('P'  ,'Pompage');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CV' ,'Chambres de vannes');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CC' ,'Chambre compteur');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CT' ,'Chambre de traitement');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CR' ,'Chambre réducteur');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CCP','Chambre coupe pression');
INSERT INTO distribution.installations_type (short_name,name) VALUES ('CRA','Chambre de rassemblement');


COMMIT;

