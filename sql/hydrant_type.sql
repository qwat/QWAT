/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant_type table
*/
BEGIN;

/* create */
DROP TABLE IF EXISTS distribution.hydrant_type CASCADE;
CREATE TABLE distribution.hydrant_type ( id SERIAL, CONSTRAINT "hydrant_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.hydrant_type IS 'type for hydrant.';

/* Columns*/
ALTER TABLE distribution.hydrant_type ADD COLUMN "name" VARCHAR(30);
ALTER TABLE distribution.hydrant_type ADD COLUMN "shortname" VARCHAR(12);

/* Constraints*/
ALTER TABLE distribution.hydrant_type ADD CONSTRAINT hydrant_name UNIQUE ("name");
ALTER TABLE distribution.hydrant_type ADD CONSTRAINT hydrant_shortname UNIQUE ("shortname");


/* Predefined types list */
/* This has to be filled by user to fullfil language preferences */
INSERT INTO distribution.hydrant_type ("name","shortname") VALUES ('Borne hydrante','BH');
INSERT INTO distribution.hydrant_type ("name","shortname") VALUES ('BH souterrainne','HS');
INSERT INTO distribution.hydrant_type ("name","shortname") VALUES ('Bouche d''arrosage','BA');

COMMIT;

