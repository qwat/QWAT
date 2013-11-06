/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Fire storages */
DROP TABLE IF EXISTS distribution.vl_tankfirestorage CASCADE;
CREATE TABLE distribution.vl_tankfirestorage (id serial NOT NULL);
ALTER TABLE distribution.vl_tankfirestorage ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_tankfirestorage ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_tankfirestorage ADD CONSTRAINT vl_tankfirestorage_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('aucune');
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('cuve 1 entière');
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('cuve 1 partielle');
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('cuve 2 entière');
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('cuve 2 partielle');
INSERT INTO distribution.vl_tankfirestorage (value_fr) VALUES ('2 cuves partielles');

/* Cistern types */
DROP TABLE IF EXISTS distribution.vl_cistern CASCADE;
CREATE TABLE distribution.vl_cistern (id serial NOT NULL);
ALTER TABLE distribution.vl_cistern ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_cistern ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_cistern ADD CONSTRAINT installation_tank_cistern_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_cistern (value_en,value_fr) VALUES ('circular', 'cirvulaire');
INSERT INTO distribution.vl_cistern (value_en,value_fr) VALUES ('rectangular', 'rectangulaire');
