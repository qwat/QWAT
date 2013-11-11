/*
	qWat - QGIS Water Module
	
	SQL file :: installation_type table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_installation_type CASCADE;
CREATE TABLE distribution.vl_installation_type ( id SERIAL, CONSTRAINT "vl_installation_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_installation_type IS 'type for installation.';

/* COLUMNS*/
ALTER TABLE distribution.vl_installation_type ADD COLUMN short_en varchar(5);
ALTER TABLE distribution.vl_installation_type ADD COLUMN short_fr varchar(5);
ALTER TABLE distribution.vl_installation_type ADD COLUMN value_en varchar(30);
ALTER TABLE distribution.vl_installation_type ADD COLUMN value_fr varchar(30);
ALTER TABLE distribution.vl_installation_type ADD COLUMN schema_visible boolean default true;

/* VALUES */
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('R'  ,'Réservoir'               );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('S'  ,'Source'                  );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('P'  ,'Pompage'                 );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CV' ,'Chambres de vannes'      );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CC' ,'Chambre compteur'        );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CT' ,'Chambre de traitement'   );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CR' ,'Chambre réducteur'       );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CCP','Chambre coupe pression'  );
INSERT INTO distribution.vl_installation_type (short_fr,value_fr) VALUES ('CRA','Chambre de rassemblement');




