/*
	qWat - QGIS Water Module
	
	SQL file :: valves_function table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.valves_function CASCADE;
CREATE TABLE distribution.valves_function ( id SERIAL, CONSTRAINT "valves_function_pk" PRIMARY KEY (id));                          

/* Columns*/
ALTER TABLE distribution.valves_function ADD COLUMN "function" VARCHAR(30);
ALTER TABLE distribution.valves_function ADD COLUMN "shortname" VARCHAR(5);
ALTER TABLE distribution.valves_function ADD COLUMN "schema_view" BOOLEAN NOT NULL DEFAULT true;

/* Constraints*/
ALTER TABLE distribution.valves_function ADD CONSTRAINT unique_function UNIQUE ("function");

/* Comment */
COMMENT ON TABLE distribution.valves_function IS 'Types of valves';

INSERT INTO distribution.valves_function ( function )               VALUES ('vanne de régulation');      /* 1  REG' */
INSERT INTO distribution.valves_function ( function , shortname )   VALUES ('ventouse','Ve');            /* 2  VE   */
INSERT INTO distribution.valves_function ( function )               VALUES ('vanne by-pass');            /* 3  VBP  */
INSERT INTO distribution.valves_function ( function , schema_view ) VALUES ('vanne d''ouvrage','false');/* 4  OUV  */
INSERT INTO distribution.valves_function ( function , schema_view ) VALUES ('organe abonné','false'); /* 5  OA   */
INSERT INTO distribution.valves_function ( function )               VALUES ('prise de secours');         /* 6  SEC  */
INSERT INTO distribution.valves_function ( function )               VALUES ('vanne incendie');           /* 7  VIN  */
INSERT INTO distribution.valves_function ( function )               VALUES ('vanne d''hydrant');         /* 8  VH   */
INSERT INTO distribution.valves_function ( function )               VALUES ('inconnu');                  /* 9 I     */
INSERT INTO distribution.valves_function ( function , shortname )   VALUES ('vidange','Vi');             /* 10 VID  */
INSERT INTO distribution.valves_function ( function )               VALUES ('organe réseau');            /* 11 VR   */
INSERT INTO distribution.valves_function ( function , shortname )   VALUES ('vidange-ventouse','ViVe');  /* 12 VIVE */

COMMIT;
