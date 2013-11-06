/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* Tank apron */
DROP TABLE IF EXISTS distribution.vl_pump_type CASCADE;
CREATE TABLE distribution.vl_pump_type (id serial NOT NULL);
ALTER TABLE distribution.vl_pump_type ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_pump_type ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_pump_type ADD CONSTRAINT vl_pump_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_pump_type (value_en,value_fr) VALUES ('1','1');
INSERT INTO distribution.vl_pump_type (value_en,value_fr) VALUES ('2','2');
