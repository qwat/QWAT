/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS distribution.labelview;
CREATE TABLE distribution.labelview  ( id SERIAL not NULL, CONSTRAINT "labelview_pk" PRIMARY KEY (id) );

ALTER TABLE distribution.labelview ADD COLUMN  name  varchar(50);

INSERT INTO distribution.labelview (id,name) VALUES (1,'Non');
INSERT INTO distribution.labelview (id,name) VALUES (2,'Essaye'); /* should be default */
INSERT INTO distribution.labelview (id,name) VALUES (3,'Force');


COMMENT ON TABLE distribution.labelview IS 'Table for editing label view mode.';



