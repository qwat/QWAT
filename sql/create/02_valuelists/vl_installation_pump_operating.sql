/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* Tank apron */
DROP TABLE IF EXISTS distribution.vl_pump_operating CASCADE;
CREATE TABLE distribution.vl_pump_operating (id serial NOT NULL);
ALTER TABLE distribution.vl_pump_operating ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_operating ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_operating ADD COLUMN code_sire smallint               ;
/* primary key */
ALTER TABLE distribution.vl_pump_operating ADD CONSTRAINT vl_pump_operating_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_pump_operating (code_sire,value_en,value_fr) VALUES (0,'','inconnu');
INSERT INTO distribution.vl_pump_operating (code_sire,value_en,value_fr) VALUES (1,'','alterné');
INSERT INTO distribution.vl_pump_operating (code_sire,value_en,value_fr) VALUES (2,'','parallèle');
