/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant providers table
*/


DROP TABLE IF EXISTS qwat.vl_hydrant_provider CASCADE;
CREATE TABLE qwat.vl_hydrant_provider ( id integer not null, CONSTRAINT hydrant_provider_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_hydrant_provider IS 'hydrant providers list.';

/* Columns */
ALTER TABLE qwat.vl_hydrant_provider ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_hydrant_provider ADD COLUMN name varchar(30) default '';

/* Constraints */
ALTER TABLE qwat.vl_hydrant_provider ADD CONSTRAINT hydrant_provider_name UNIQUE (name);


INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9601,'+GF+');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9602,'Wild');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9603,'Hawie');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9604,'Erhard');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9605,'SISTAG');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9606,'Von Roll');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9607,'Straub');
INSERT INTO qwat.vl_hydrant_provider (id,name) VALUES (9608,'Hinni');



