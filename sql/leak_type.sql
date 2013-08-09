/*
	qWat - QGIS Water Module

	SQL file :: leak_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.leak_type CASCADE;
CREATE TABLE distribution.leak_type ( id SERIAL, CONSTRAINT "leak_type_pk" PRIMARY KEY (id));

/* Columns*/
ALTER TABLE distribution.leak_type ADD COLUMN "type" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.leak_type ADD CONSTRAINT leak_unique_type UNIQUE ("type");

/* Comment */
COMMENT ON TABLE distribution.leak_type IS 'Types of leak';


INSERT INTO distribution.leak_type ( type ) VALUES ('cassure fendue');            /* 1  CF  */
INSERT INTO distribution.leak_type ( type ) VALUES ('cassure longitudinale');     /* 2  CL  */
INSERT INTO distribution.leak_type ( type ) VALUES ('conduites arrachée');        /* 3  CA  */
INSERT INTO distribution.leak_type ( type ) VALUES ('trou de corrosion')   ;      /* 4  TC  */
INSERT INTO distribution.leak_type ( type ) VALUES ('défectuosité');              /* 5  DEF */


COMMIT;
