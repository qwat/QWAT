/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_type table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_type CASCADE;
CREATE TABLE distribution.vl_leak_type ( id SERIAL, CONSTRAINT "vl_leak_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_type IS 'Types of leak';

/* COLUMNS */
ALTER TABLE distribution.vl_leak_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_type ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO distribution.vl_leak_type ( value_fr ) VALUES ('cassure fendue');            /* 1  CF  */
INSERT INTO distribution.vl_leak_type ( value_fr ) VALUES ('cassure longitudinale');     /* 2  CL  */
INSERT INTO distribution.vl_leak_type ( value_fr ) VALUES ('conduites arrachée');        /* 3  CA  */
INSERT INTO distribution.vl_leak_type ( value_fr ) VALUES ('trou de corrosion')   ;      /* 4  TC  */
INSERT INTO distribution.vl_leak_type ( value_fr ) VALUES ('défectuosité');              /* 5  DEF */



