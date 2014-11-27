/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS qwat.vl_visible;
CREATE TABLE qwat.vl_visible ( id integer not null, CONSTRAINT "vl_visible_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

/* COLUMNS */
ALTER TABLE qwat.vl_visible ADD COLUMN vl_code      boolean;
ALTER TABLE qwat.vl_visible ADD COLUMN vl_code_int  smallint;
ALTER TABLE qwat.vl_visible ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat.vl_visible ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat.vl_visible ADD COLUMN value_ro varchar(30) default '';

/* CONSTRAINT */
ALTER TABLE qwat.vl_visible ADD CONSTRAINT vl_visible_code UNIQUE (vl_code);
ALTER TABLE qwat.vl_visible ADD CONSTRAINT vl_visible_code_int UNIQUE (vl_code_int);

/* CONTENT */
INSERT INTO qwat.vl_visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1401,NULL,1,'Auto','Auto','Auto');
INSERT INTO qwat.vl_visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1402,True,2,'Visible','Visible','Vizibilă');
INSERT INTO qwat.vl_visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1403,False,0,'Invisible','Invisible','Invizibilă');
