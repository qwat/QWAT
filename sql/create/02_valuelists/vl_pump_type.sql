/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP TYPE */
DROP TABLE IF EXISTS distribution.vl_pump_type CASCADE;
CREATE TABLE distribution.vl_pump_type (id integer not null, CONSTRAINT vl_pump_type_pk PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE distribution.vl_pump_type ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_pump_type ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_type ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_type ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO distribution.vl_pump_type (id,code_sire,value_en,value_fr) VALUES (2501,0,'','surpresseur');
INSERT INTO distribution.vl_pump_type (id,code_sire,value_en,value_fr) VALUES (2502,1,'','normal');
INSERT INTO distribution.vl_pump_type (id,code_sire,value_en,value_fr) VALUES (2503,2,'','accélération');
