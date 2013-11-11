/*
	qWat - QGIS Water Module
	
	SQL file :: watertype table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_watertype CASCADE;
CREATE TABLE distribution.vl_watertype ( id SERIAL, CONSTRAINT watertype_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_watertype IS 'Water type table, with SIRE code.';

/* COLUMNS */
ALTER TABLE distribution.vl_watertype ADD COLUMN value_en  varchar(30);
ALTER TABLE distribution.vl_watertype ADD COLUMN value_fr  varchar(30);
ALTER TABLE distribution.vl_watertype ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO distribution.vl_watertype (value_en,value_fr,code_sire) VALUES ('raw'      , 'brute'       , 0 );
INSERT INTO distribution.vl_watertype (value_en,value_fr,code_sire) VALUES ('drinkable', 'potable'     , 1 );
INSERT INTO distribution.vl_watertype (value_en,value_fr,code_sire) VALUES ('inustrial', 'industrielle', 2 );
