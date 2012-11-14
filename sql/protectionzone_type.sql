/*
	qWat - QGIS Water Module
	
	SQL file :: protectionzone_type table
*/
BEGIN;

/* create */
DROP TABLE IF EXISTS distribution.protectionzone_type CASCADE;
CREATE TABLE distribution.protectionzone_type ( id SERIAL, CONSTRAINT "protectionzone_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.protectionzone_type IS 'type for hydrant.';

/* Columns*/
ALTER TABLE distribution.protectionzone_type ADD COLUMN "name" VARCHAR(10);
ALTER TABLE distribution.protectionzone_type ADD COLUMN "shortname" VARCHAR(255);

/* Constraints*/
ALTER TABLE distribution.protectionzone_type ADD CONSTRAINT protectionzone_type_name UNIQUE ("name");

/* Predefined types list */
/* This has to be filled by user to fullfil language preferences */
INSERT INTO distribution.protectionzone_type ("shortname","name") VALUES ('S1','Zone de protection S1');
INSERT INTO distribution.protectionzone_type ("shortname","name") VALUES ('S2','Zone de protection S2');
INSERT INTO distribution.protectionzone_type ("shortname","name") VALUES ('S3','Zone de protection S3');
INSERT INTO distribution.protectionzone_type ("shortname","name") VALUES ('PP','Périmètre de protection');
INSERT INTO distribution.protectionzone_type ("shortname","name") VALUES ('Zo','Zone de protection des eaux de surface');

COMMIT;
