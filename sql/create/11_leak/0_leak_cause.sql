/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/


DROP TABLE IF EXISTS distribution.leak_cause CASCADE;
CREATE TABLE distribution.leak_cause ( id SERIAL, CONSTRAINT "leak_cause_pk" PRIMARY KEY (id));

/* Columns*/
ALTER TABLE distribution.leak_cause ADD COLUMN "cause" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.leak_cause ADD CONSTRAINT unique_cause UNIQUE ("cause");

/* Comment */
COMMENT ON TABLE distribution.leak_cause IS 'Types of leak';


INSERT INTO distribution.leak_cause ( cause ) VALUES ('corroson');    /* 1  C  */
INSERT INTO distribution.leak_cause ( cause ) VALUES ('manchon');     /* 2  M  */
INSERT INTO distribution.leak_cause ( cause ) VALUES ('négligence');  /* 3  F  */
INSERT INTO distribution.leak_cause ( cause ) VALUES ('pose')   ;     /* 4  P  */
INSERT INTO distribution.leak_cause ( cause ) VALUES ('sous mur');    /* 5  S  */



