/*
	qWat - QGIS Water Module
	
	SQL file :: vl_remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS distribution.vl_remote CASCADE;
CREATE TABLE distribution.vl_remote (id integer not nullCONSTRAINT "vl_remote_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE distribution.vl_remote ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_remote ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE distribution.vl_remote ADD COLUMN value_en varchar(30) default '' ;

/* content */
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1201,'','Aucune');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1202,'','Cable en site propre');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1203,'','Ligne louée');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1204,'','Ligne commutée');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1205,'','ADSL');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1206,'','Radio');
INSERT INTO distribution.vl_remote (id,value_en,value_fr) VALUES (1207,'','GPRS');
