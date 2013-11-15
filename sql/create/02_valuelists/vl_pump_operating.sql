/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP OPERATING */
DROP TABLE IF EXISTS distribution.vl_pump_operating CASCADE;
CREATE TABLE distribution.vl_pump_operating (id integer not null, CONSTRAINT vl_pump_operating_pk PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE distribution.vl_pump_operating ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_pump_operating ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_operating ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_operating ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO distribution.vl_pump_operating (id,code_sire,value_en,value_fr) VALUES (2401,0,'','inconnu');
INSERT INTO distribution.vl_pump_operating (id,code_sire,value_en,value_fr) VALUES (2402,1,'','alterné');
INSERT INTO distribution.vl_pump_operating (id,code_sire,value_en,value_fr) VALUES (2403,2,'','parallèle');
