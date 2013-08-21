/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/


DROP TABLE IF EXISTS distribution.leak_cause CASCADE;
CREATE TABLE distribution.leak_cause ( id SERIAL, CONSTRAINT "leak_cause_pk" PRIMARY KEY (id));

/* Columns*/
ALTER TABLE distribution.leak_cause ADD COLUMN name VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.leak_cause ADD CONSTRAINT unique_cause UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.leak_cause IS 'Causes of leak';


INSERT INTO distribution.leak_cause ( name ) VALUES ('corroson');    /* 1  C  */
INSERT INTO distribution.leak_cause ( name ) VALUES ('manchon');     /* 2  M  */
INSERT INTO distribution.leak_cause ( name ) VALUES ('négligence');  /* 3  F  */
INSERT INTO distribution.leak_cause ( name ) VALUES ('pose')   ;     /* 4  P  */
INSERT INTO distribution.leak_cause ( name ) VALUES ('sous mur');    /* 5  S  */



