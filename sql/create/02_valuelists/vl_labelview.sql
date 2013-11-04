/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_labelview;
CREATE TABLE distribution.vl_labelview  ( id SERIAL not NULL, CONSTRAINT "vl_labelview_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_labelview IS 'Table for editing label view mode.';

/* COLUMNS */
ALTER TABLE distribution.vl_labelview ADD COLUMN vl_code  smallint;
ALTER TABLE distribution.vl_labelview ADD COLUMN value_en varchar(30) default '';
ALTER TABLE distribution.vl_labelview ADD COLUMN value_fr varchar(30) default '';

/* VALUES */
INSERT INTO distribution.vl_labelview (vl_code,value_en,value_fr) VALUES (1, 'No'   ,'Non'   );
INSERT INTO distribution.vl_labelview (vl_code,value_en,value_fr) VALUES (2, 'Try'  ,'Essaye'); /* should be default */
INSERT INTO distribution.vl_labelview (vl_code,value_en,value_fr) VALUES (3, 'Force','Force' );






