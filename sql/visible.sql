/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/
BEGIN;

DROP TABLE IF EXISTS distribution.visible CASCADE;
CREATE TABLE distribution.visible  ( x SERIAL, CONSTRAINT "visible_pk" PRIMARY KEY (x) );

ALTER TABLE distribution.visible ADD COLUMN  id    boolean;
ALTER TABLE distribution.visible ADD COLUMN  name  varchar(50);

ALTER TABLE distribution.visible ADD CONSTRAINT visible_id UNIQUE (id);


INSERT INTO distribution.visible (id,name) VALUES (True,'Visible');
INSERT INTO distribution.visible (id,name) VALUES (False,'Invisible');
INSERT INTO distribution.visible (id,name) VALUES (NULL,'Auto');


COMMENT ON TABLE distribution.visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

COMMIT;

