/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS distribution.vl_visible;
CREATE TABLE distribution.vl_visible ( x SERIAL, CONSTRAINT "vl_visible_pk" PRIMARY KEY (x) );

ALTER TABLE distribution.vl_visible ADD COLUMN vl_code  boolean;
ALTER TABLE distribution.vl_visible ADD COLUMN value_en varchar(30);
ALTER TABLE distribution.vl_visible ADD COLUMN value_fr varchar(30);

ALTER TABLE distribution.vl_visible ADD CONSTRAINT vl_visible_id UNIQUE (id);

INSERT INTO distribution.vl_visible (vl_code,value_en,value,fr) VALUES (True,'Visible');
INSERT INTO distribution.vl_visible (vl_code,value_en,value,fr) VALUES (False,'Invisible');
INSERT INTO distribution.vl_visible (vl_code,value_en,value,fr) VALUES (NULL,'Auto');

COMMENT ON TABLE distribution.vl_visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';



