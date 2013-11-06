/*
	qWat - QGIS Water Module

	SQL file :: vl_leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_leak_cause CASCADE;
CREATE TABLE distribution.vl_leak_cause ( id SERIAL, CONSTRAINT "vl_leak_cause_pk" PRIMARY KEY (id));
COMMENT ON TABLE distribution.vl_leak_cause IS 'Causes of leak';

/* COLUMNS */
ALTER TABLE distribution.vl_leak_cause ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_leak_cause ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO distribution.vl_leak_cause ( value_fr ) VALUES ('corrosion');    /* 1  C  */
INSERT INTO distribution.vl_leak_cause ( value_fr ) VALUES ('manchon');     /* 2  M  */
INSERT INTO distribution.vl_leak_cause ( value_fr ) VALUES ('négligence');  /* 3  F  */
INSERT INTO distribution.vl_leak_cause ( value_fr ) VALUES ('pose')   ;     /* 4  P  */
INSERT INTO distribution.vl_leak_cause ( value_fr ) VALUES ('sous mur');    /* 5  S  */



