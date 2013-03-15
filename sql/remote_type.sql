/*
	qWat - QGIS Water Module
	
	SQL file :: remote_type table
*/

/* Cistern types */
DROP TABLE IF EXISTS distribution.remote_type CASCADE;

CREATE TABLE distribution.remote_type (id serial NOT NULL);

ALTER TABLE distribution.remote_type ADD COLUMN  remote  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.remote_type ADD CONSTRAINT remote_type_pkey PRIMARY KEY (id);


/* content */
INSERT INTO distribution.remote_type ("remote") VALUES ('Aucune');
INSERT INTO distribution.remote_type ("remote") VALUES ('Cable en site propre');
INSERT INTO distribution.remote_type ("remote") VALUES ('Ligne louée');
INSERT INTO distribution.remote_type ("remote") VALUES ('Ligne commutée');
INSERT INTO distribution.remote_type ("remote") VALUES ('ADSL');
INSERT INTO distribution.remote_type ("remote") VALUES ('Radio');
INSERT INTO distribution.remote_type ("remote") VALUES ('GPRS');
