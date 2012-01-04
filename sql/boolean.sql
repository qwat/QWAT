/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/
BEGIN;

DROP TABLE IF EXISTS distribution.visible CASCADE;
CREATE TABLE distribution.visible ( id SERIAL, CONSTRAINT "visible_pk" PRIMARY KEY (id) );

ALTER TABLE distribution.visible ADD COLUMN  value boolean;
ALTER TABLE distribution.visible ADD COLUMN  name  varchar(50);

INSERT INTO distribution.visible (value,name) VALUES (NULL,'Auto');
INSERT INTO distribution.visible (value,name) VALUES (True,'Visible');
INSERT INTO distribution.visible (value,name) VALUES (False,'Invisible');

COMMENT ON TABLE distribution.visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

COMMIT;

