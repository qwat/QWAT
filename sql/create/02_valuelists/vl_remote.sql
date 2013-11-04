/*
	qWat - QGIS Water Module
	
	SQL file :: vl_remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS distribution.vl_remote CASCADE;

CREATE TABLE distribution.vl_remote (id serial NOT NULL);

ALTER TABLE distribution.vl_remote ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE distribution.vl_remote ADD COLUMN value_en varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_remote ADD CONSTRAINT vl_remote_pkey PRIMARY KEY (id);


/* content */
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','Aucune');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','Cable en site propre');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','Ligne louée');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','Ligne commutée');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','ADSL');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','Radio');
INSERT INTO distribution.vl_remote (value_en,value_fr) VALUES ('','GPRS');
