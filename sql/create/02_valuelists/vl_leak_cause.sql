/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_cause CASCADE;
CREATE TABLE distribution.vl_leak_cause ( id integer not null, CONSTRAINT "vl_leak_cause_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_cause IS 'Causes of leak';

/* COLUMNS */
ALTER TABLE distribution.vl_leak_cause ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_leak_cause ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_cause ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO distribution.vl_leak_cause (id,value_fr ) VALUES (9101,'corrosion');    /* 1  C  */
INSERT INTO distribution.vl_leak_cause (id,value_fr ) VALUES (9102,'manchon');     /* 2  M  */
INSERT INTO distribution.vl_leak_cause (id,value_fr ) VALUES (9103,'négligence');  /* 3  F  */
INSERT INTO distribution.vl_leak_cause (id,value_fr ) VALUES (9104,'pose')   ;     /* 4  P  */
INSERT INTO distribution.vl_leak_cause (id,value_fr ) VALUES (9105,'sous mur');    /* 5  S  */



