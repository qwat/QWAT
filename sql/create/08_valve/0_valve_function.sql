/*
	qWat - QGIS Water Module
	
	SQL file :: valve_function table
*/


/* create */
DROP TABLE IF EXISTS distribution.valve_function CASCADE;
CREATE TABLE distribution.valve_function ( id SERIAL, CONSTRAINT "valve_function_pk" PRIMARY KEY (id));                          
COMMENT ON TABLE distribution.valve_function IS 'Types of valve';

/* Columns*/
ALTER TABLE distribution.valve_function ADD COLUMN name VARCHAR(30);
ALTER TABLE distribution.valve_function ADD COLUMN shortname VARCHAR(5);
ALTER TABLE distribution.valve_function ADD COLUMN schema_view BOOLEAN NOT NULL default true;

/* Constraints*/
ALTER TABLE distribution.valve_function ADD CONSTRAINT unique_function UNIQUE (name);


INSERT INTO distribution.valve_function ( name )               VALUES ('vanne de régulation');               /* 1  REG' */
INSERT INTO distribution.valve_function ( name , shortname )   VALUES ('ventouse'           ,'Ve');          /* 2  VE   */
INSERT INTO distribution.valve_function ( name )               VALUES ('vanne by-pass');                     /* 3  VBP  */
INSERT INTO distribution.valve_function ( name , schema_view ) VALUES ('vanne d''ouvrage'         ,'false'); /* 4  OUV  */
INSERT INTO distribution.valve_function ( name , schema_view ) VALUES ('organe abonné'            ,'false'); /* 5  OA   */
INSERT INTO distribution.valve_function ( name )               VALUES ('prise de secours');                  /* 6  SEC  */
INSERT INTO distribution.valve_function ( name )               VALUES ('vanne incendie');                    /* 7  VIN  */
INSERT INTO distribution.valve_function ( name )               VALUES ('vanne d''hydrant');                  /* 8  VH   */
INSERT INTO distribution.valve_function ( name )               VALUES ('inconnu');                           /* 9 I     */
INSERT INTO distribution.valve_function ( name , shortname )   VALUES ('vidange'            ,'Vi');          /* 10 VID  */
INSERT INTO distribution.valve_function ( name )               VALUES ('organe réseau');                     /* 11 VR   */
INSERT INTO distribution.valve_function ( name , shortname )   VALUES ('vidange-ventouse'   ,'ViVe');        /* 12 VIVE */
INSERT INTO distribution.valve_function ( name )               VALUES ('vanne clapet');                      /* 13      */


