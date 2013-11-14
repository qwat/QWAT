/*
	qWat - QGIS Water Module
	
	SQL file :: vl_valve_function table
*/


/* CREATE */
DROP TABLE IF EXISTS distribution.vl_valve_function CASCADE;
CREATE TABLE distribution.vl_valve_function ( id integer not null, CONSTRAINT "vl_valve_function_pk" PRIMARY KEY (id));                          
COMMENT ON TABLE distribution.vl_valve_function IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE distribution.vl_valve_function ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_valve_function ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE distribution.vl_valve_function ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_valve_function ADD COLUMN short_fr VARCHAR(5);
ALTER TABLE distribution.vl_valve_function ADD COLUMN short_en VARCHAR(5);
ALTER TABLE distribution.vl_valve_function ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6101,'vanne de régulation'              ); /* 1  REG' */
INSERT INTO distribution.vl_valve_function (id, value_fr , short_fr )       VALUES (6102,'ventouse'           ,'Ve'         ); /* 2  VE   */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6103,'vanne by-pass'                    ); /* 3  VBP  */
INSERT INTO distribution.vl_valve_function (id, value_fr , schema_visible ) VALUES (6104,'vanne d''ouvrage'         ,'false'); /* 4  OUV  */
INSERT INTO distribution.vl_valve_function (id, value_fr , schema_visible ) VALUES (6105,'organe abonné'            ,'false'); /* 5  OA   */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6106,'prise de secours'                 ); /* 6  SEC  */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6107,'vanne incendie'                   ); /* 7  VIN  */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6108,'vanne d''hydrant'                 ); /* 8  VH   */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6109,'inconnu'                          ); /* 9 I     */
INSERT INTO distribution.vl_valve_function (id, value_fr , short_fr )       VALUES (6110,'vidange'            ,'Vi'         ); /* 10 VID  */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6111,'organe réseau'                    ); /* 11 VR   */
INSERT INTO distribution.vl_valve_function (id, value_fr , short_fr )       VALUES (6112,'vidange-ventouse'   ,'ViVe'       ); /* 12 VIVE */
INSERT INTO distribution.vl_valve_function (id, value_fr )                  VALUES (6113,'vanne clapet'                     ); /* 13      */


