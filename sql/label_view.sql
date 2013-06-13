/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/
BEGIN;

DROP TABLE IF EXISTS distribution.labelview;
CREATE TABLE distribution.labelview  ( id SERIAL not NULL, CONSTRAINT "labelview_pk" PRIMARY KEY (id) );

ALTER TABLE distribution.labelview ADD COLUMN  name  varchar(50);

INSERT INTO distribution.labelview (id,name) VALUES (1,'No');
INSERT INTO distribution.labelview (id,name) VALUES (2,'Try'); /* should be default */
INSERT INTO distribution.labelview (id,name) VALUES (3,'Force');


COMMENT ON TABLE distribution.labelview IS 'Table for editing label view mode.';

COMMIT;

