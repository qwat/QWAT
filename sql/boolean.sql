/*
	qWat - QGIS Water Module
	
	SQL file :: boolean table for value relation in qgis
*/

/*----------------!!!---!!!----------------*/
BEGIN;

DROP TABLE IF EXISTS distribution."boolean" CASCADE;
CREATE TABLE distribution."boolean" ( id SERIAL, CONSTRAINT "boolean_pk" PRIMARY KEY (id) );

ALTER TABLE distribution."boolean" ADD COLUMN  value boolean;
ALTER TABLE distribution."boolean" ADD COLUMN  name  varchar(50);

INSERT INTO distribution."boolean" (value,name) VALUES (NULL,'Auto');
INSERT INTO distribution."boolean" (value,name) VALUES (True,'Oui');
INSERT INTO distribution."boolean" (value,name) VALUES (False,'Non');

COMMENT ON TABLE distribution."boolean" IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

COMMIT;

