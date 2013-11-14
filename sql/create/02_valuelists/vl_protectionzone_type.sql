/*
	qWat - QGIS Water Module
	
	SQL file :: protectionzone_type table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.protectionzone_type CASCADE;
CREATE TABLE distribution.protectionzone_type ( id integer not null, CONSTRAINT "protectionzone_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.protectionzone_type IS 'type of protection zone.';

/* COLUMNS*/
ALTER TABLE distribution.protectionzone_type ADD COLUMN value_fr VARCHAR(50);
ALTER TABLE distribution.protectionzone_type ADD COLUMN value_en VARCHAR(50);
ALTER TABLE distribution.protectionzone_type ADD COLUMN short_fr VARCHAR(255);
ALTER TABLE distribution.protectionzone_type ADD COLUMN short_en VARCHAR(255);

/* CONTENT */
INSERT INTO distribution.protectionzone_type (id,short_fr,value_fr) VALUES (9501,'S1','Zone de protection S1');
INSERT INTO distribution.protectionzone_type (id,short_fr,value_fr) VALUES (9502,'S2','Zone de protection S2');
INSERT INTO distribution.protectionzone_type (id,short_fr,value_fr) VALUES (9503,'S3','Zone de protection S3');
INSERT INTO distribution.protectionzone_type (id,short_fr,value_fr) VALUES (9504,'PP','Périmètre de protection');
INSERT INTO distribution.protectionzone_type (id,short_fr,value_fr) VALUES (9505,'Zo','Zone de protection des eaux de surface');


