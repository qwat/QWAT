/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_type table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_type CASCADE;
CREATE TABLE distribution.vl_leak_type ( id integer not null, CONSTRAINT "vl_leak_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_type IS 'Types of leak';

/* COLUMNS */
ALTER TABLE distribution.vl_leak_type ADD COLUMN vl_active boolean defaut true;
ALTER TABLE distribution.vl_leak_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_type ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO distribution.vl_leak_type (id, value_fr ) VALUES (9301,'cassure fendue');            /* 1  CF  */
INSERT INTO distribution.vl_leak_type (id, value_fr ) VALUES (9302,'cassure longitudinale');     /* 2  CL  */
INSERT INTO distribution.vl_leak_type (id, value_fr ) VALUES (9303,'conduites arrachée');        /* 3  CA  */
INSERT INTO distribution.vl_leak_type (id, value_fr ) VALUES (9304,'trou de corrosion')   ;      /* 4  TC  */
INSERT INTO distribution.vl_leak_type (id, value_fr ) VALUES (9305,'défectuosité');              /* 5  DEF */



