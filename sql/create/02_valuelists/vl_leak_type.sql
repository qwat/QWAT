/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_leak_type CASCADE;
CREATE TABLE qwat.vl_leak_type ( id integer not null, CONSTRAINT "vl_leak_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat.vl_leak_type IS 'Types of leak';

/* COLUMNS */
ALTER TABLE qwat.vl_leak_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_leak_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_leak_type ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat.vl_leak_type (id, value_fr ) VALUES (9141,'cassure franche');            /* 1  CF  */
INSERT INTO qwat.vl_leak_type (id, value_fr ) VALUES (9142,'cassure longitudinale');     /* 2  CL  */
INSERT INTO qwat.vl_leak_type (id, value_fr ) VALUES (9143,'conduite arrachée');        /* 3  CA  */
INSERT INTO qwat.vl_leak_type (id, value_fr ) VALUES (9144,'trou de corrosion')   ;      /* 4  TC  */
INSERT INTO qwat.vl_leak_type (id, value_fr ) VALUES (9145,'défectuosité');              /* 5  DEF */



