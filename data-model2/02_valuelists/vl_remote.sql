/*
	qWat - QGIS Water Module
	
	SQL file :: vl_remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS qwat.vl_remote CASCADE;
CREATE TABLE qwat.vl_remote (id integer not null, CONSTRAINT "vl_remote_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat.vl_remote ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_remote ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat.vl_remote ADD COLUMN value_en varchar(30) default '' ;

/* content */
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1201,'','Aucune');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1202,'','Cable en site propre');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1203,'','Ligne louée');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1204,'','Ligne commutée');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1205,'','ADSL');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1206,'','Radio');
INSERT INTO qwat.vl_remote (id,value_en,value_fr) VALUES (1207,'','GPRS');
