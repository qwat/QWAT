/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant providers table
*/


DROP TABLE IF EXISTS distribution.hydrant_provider CASCADE;
CREATE TABLE distribution.hydrant_provider ( id SERIAL, CONSTRAINT hydrant_provider_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.hydrant_provider IS 'hydrant providers list.';

/* Columns */
ALTER TABLE distribution.hydrant_provider ADD COLUMN name VARCHAR(30);

/* Constraints */
ALTER TABLE distribution.hydrant_provider ADD CONSTRAINT hydrant_provider_name UNIQUE (name);


INSERT INTO distribution.hydrant_provider (id,name) VALUES ( 8,'+GF+');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (13,'Wild');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (14,'Hawie');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (15,'Erhard');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (18,'SISTAG');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (25,'Von Roll');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (28,'Straub');
INSERT INTO distribution.hydrant_provider (id,name) VALUES (29,'Hinni');



