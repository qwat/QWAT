/*
	qWat - QGIS Water Module
	
	SQL file :: installation_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_installation_type CASCADE;
CREATE TABLE qwat.vl_installation_type ( id integer not null, CONSTRAINT "vl_installation_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_installation_type IS 'type for installation.';

/* COLUMNS*/
ALTER TABLE qwat.vl_installation_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_installation_type ADD COLUMN short_en varchar(5) default '';
ALTER TABLE qwat.vl_installation_type ADD COLUMN short_fr varchar(5) default '';
ALTER TABLE qwat.vl_installation_type ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat.vl_installation_type ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat.vl_installation_type ADD COLUMN schema_visible boolean default true;

/* VALUES */
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2001,'R'  ,'Réservoir'               );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2002,'S'  ,'Source'                  );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2003,'P'  ,'Pompage'                 );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2004,'CV' ,'Chambres de vannes'      );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2005,'CC' ,'Chambre compteur'        );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2006,'CT' ,'Chambre de traitement'   );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2007,'CR' ,'Chambre réducteur'       );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2008,'CCP','Chambre coupe pression'  );
INSERT INTO qwat.vl_installation_type (id,short_fr,value_fr) VALUES (2009,'CRA','Chambre de rassemblement');




