/*
	qWat - QGIS Water Module
	
	SQL file :: installation_remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS distribution.installation_remote CASCADE;

CREATE TABLE distribution.installation_remote (id serial NOT NULL);

ALTER TABLE distribution.installation_remote ADD COLUMN  remote  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_remote ADD CONSTRAINT installation_remote_pkey PRIMARY KEY (id);


/* content */
INSERT INTO distribution.installation_remote ("remote") VALUES ('Aucune');
INSERT INTO distribution.installation_remote ("remote") VALUES ('Cable en site propre');
INSERT INTO distribution.installation_remote ("remote") VALUES ('Ligne louée');
INSERT INTO distribution.installation_remote ("remote") VALUES ('Ligne commutée');
INSERT INTO distribution.installation_remote ("remote") VALUES ('ADSL');
INSERT INTO distribution.installation_remote ("remote") VALUES ('Radio');
INSERT INTO distribution.installation_remote ("remote") VALUES ('GPRS');
