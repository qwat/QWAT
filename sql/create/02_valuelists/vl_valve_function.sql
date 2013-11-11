/*
	qWat - QGIS Water Module
	
	SQL file :: vl_valve_function table
*/


/* CREATE */
DROP TABLE IF EXISTS distribution.vl_valve_function CASCADE;
CREATE TABLE distribution.vl_valve_function ( id SERIAL, CONSTRAINT "vl_valve_function_pk" PRIMARY KEY (id));                          
COMMENT ON TABLE distribution.vl_valve_function IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE distribution.vl_valve_function ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE distribution.vl_valve_function ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_valve_function ADD COLUMN short_fr VARCHAR(5);
ALTER TABLE distribution.vl_valve_function ADD COLUMN short_en VARCHAR(5);
ALTER TABLE distribution.vl_valve_function ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('vanne de régulation'              ); /* 1  REG' */
INSERT INTO distribution.vl_valve_function ( value_fr , short_fr )    VALUES ('ventouse'           ,'Ve'         ); /* 2  VE   */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('vanne by-pass'                    ); /* 3  VBP  */
INSERT INTO distribution.vl_valve_function ( value_fr , schema_visible ) VALUES ('vanne d''ouvrage'         ,'false'); /* 4  OUV  */
INSERT INTO distribution.vl_valve_function ( value_fr , schema_visible ) VALUES ('organe abonné'            ,'false'); /* 5  OA   */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('prise de secours'                 ); /* 6  SEC  */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('vanne incendie'                   ); /* 7  VIN  */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('vanne d''hydrant'                 ); /* 8  VH   */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('inconnu'                          ); /* 9 I     */
INSERT INTO distribution.vl_valve_function ( value_fr , short_fr )    VALUES ('vidange'            ,'Vi'         ); /* 10 VID  */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('organe réseau'                    ); /* 11 VR   */
INSERT INTO distribution.vl_valve_function ( value_fr , short_fr )    VALUES ('vidange-ventouse'   ,'ViVe'       ); /* 12 VIVE */
INSERT INTO distribution.vl_valve_function ( value_fr )               VALUES ('vanne clapet'                     ); /* 13      */


