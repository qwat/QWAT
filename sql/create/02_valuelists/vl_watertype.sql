/*
	qWat - QGIS Water Module
	
	SQL file :: watertype table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_watertype CASCADE;
CREATE TABLE qwat.vl_watertype ( id integer not null, CONSTRAINT watertype_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_watertype IS 'Water type table, with SIRE code.';

/* COLUMNS */
ALTER TABLE qwat.vl_watertype ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_watertype ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE qwat.vl_watertype ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE qwat.vl_watertype ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO qwat.vl_watertype (id,value_en,value_fr,code_sire) VALUES (1501, 'raw'      , 'brute'       , 0 );
INSERT INTO qwat.vl_watertype (id,value_en,value_fr,code_sire) VALUES (1502, 'drinkable', 'potable'     , 1 );
INSERT INTO qwat.vl_watertype (id,value_en,value_fr,code_sire) VALUES (1503, 'industrial', 'industrielle', 2 );
