/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS distribution.vl_visible;
CREATE TABLE distribution.vl_visible ( id integer not null, CONSTRAINT "vl_visible_pk" PRIMARY KEY (x) );
COMMENT ON TABLE distribution.vl_visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

/* COLUMNS */
ALTER TABLE distribution.vl_visible ADD COLUMN vl_code  boolean;
ALTER TABLE distribution.vl_visible ADD COLUMN value_en varchar(30);
ALTER TABLE distribution.vl_visible ADD COLUMN value_fr varchar(30);

/* CONSTRAINT */
ALTER TABLE distribution.vl_visible ADD CONSTRAINT vl_visible_code UNIQUE (vl_code);

/* CONTENT */
INSERT INTO distribution.vl_visible (id,vl_code,value_en,value_fr) VALUES (1401,NULL,'Auto','Auto');
INSERT INTO distribution.vl_visible (id,vl_code,value_en,value_fr) VALUES (1402,True,'Visible','Visible');
INSERT INTO distribution.vl_visible (id,vl_code,value_en,value_fr) VALUES (1403,False,'Invisible','Invisible');




