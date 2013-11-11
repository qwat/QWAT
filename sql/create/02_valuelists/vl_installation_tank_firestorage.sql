/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Fire storages */
DROP TABLE IF EXISTS distribution.vl_tank_firestorage CASCADE;
CREATE TABLE distribution.vl_tank_firestorage (id serial NOT NULL);
ALTER TABLE distribution.vl_tank_firestorage ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_tank_firestorage ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_tank_firestorage ADD CONSTRAINT vl_tank_firestorage_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('aucune');
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('cuve 1 entière');
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('cuve 1 partielle');
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('cuve 2 entière');
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('cuve 2 partielle');
INSERT INTO distribution.vl_tank_firestorage (value_fr) VALUES ('2 cuves partielles');
