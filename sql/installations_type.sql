/*
	qWat - QGIS Water Module
	
	SQL file :: installations_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.installations_type CASCADE;
CREATE TABLE distribution.installations_type ( id SERIAL, CONSTRAINT "installations_type_pk" PRIMARY KEY (id) );

/* Columns*/
ALTER TABLE distribution.installations_type ADD COLUMN "short_name" VARCHAR(5);
ALTER TABLE distribution.installations_type ADD COLUMN "type"       VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.installations_type ADD CONSTRAINT type_name UNIQUE ("type");

/* Comment */
COMMENT ON TABLE distribution.installations_type IS 'type for installations.';

/* Predefined types list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.installations_type (short_name,type) VALUES ('I'  ,'Inconnu');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('R'  ,'Réservoir');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('S'  ,'Source');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('P'  ,'Pompage');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CV' ,'Chambres de vannes');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CC' ,'Chambre compteur');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CT' ,'Chambre de traitement');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CR' ,'Chambre réducteur');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CCP','Chambre coupe pression');
INSERT INTO distribution.installations_type (short_name,type) VALUES ('CRA','Chambre de rassemblement');


COMMIT;

