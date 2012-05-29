/*
	qWat - QGIS Water Module
	
	SQL file :: installations_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.installations_type CASCADE;
CREATE TABLE distribution.installations_type ( id SERIAL, CONSTRAINT "installations_type_pk" PRIMARY KEY (id) );

/* Columns*/
ALTER TABLE distribution.installations_type ADD COLUMN "short_name"  VARCHAR(5);
ALTER TABLE distribution.installations_type ADD COLUMN "name"        VARCHAR(30);
ALTER TABLE distribution.installations_type ADD COLUMN "schema_view" boolean default true;

/* Constraints*/
ALTER TABLE distribution.installations_type ADD CONSTRAINT type_name UNIQUE ("name");

/* Comment */
COMMENT ON TABLE distribution.installations_type IS 'type for installations.';

/* Predefined types list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('I'  ,'Inconnu'                 ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('R'  ,'Réservoir'               ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('S'  ,'Source'                  ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('P'  ,'Pompage'                 ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CV' ,'Chambres de vannes'      ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CC' ,'Chambre compteur'        ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CT' ,'Chambre de traitement'   ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CR' ,'Chambre réducteur'       ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CCP','Chambre coupe pression'  ,true);
INSERT INTO distribution.installations_type (short_name,name,schema_view) VALUES ('CRA','Chambre de rassemblement',true);


COMMIT;

