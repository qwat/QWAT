/*
	qWat - QGIS Water Module
	
	SQL file :: installations_status table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.installations_status CASCADE;
CREATE TABLE distribution.installations_status ( id SERIAL, CONSTRAINT installations_status_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.installations_status IS 'Status for installations.';

/* Columns */
ALTER TABLE distribution.installations_status ADD COLUMN status VARCHAR(30);
ALTER TABLE distribution.installations_status ADD COLUMN active BOOLEAN DEFAULT true;

/* Constraints */
ALTER TABLE distribution.installations_status ADD CONSTRAINT status_name2 UNIQUE (status);


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.installations_status (status,active) VALUES ('en service'  , true );
INSERT INTO distribution.installations_status (status,active) VALUES ('hors service', false);
INSERT INTO distribution.installations_status (status,active) VALUES ('abandonnee'  , false);
INSERT INTO distribution.installations_status (status,active) VALUES ('détruit'     , false);
INSERT INTO distribution.installations_status (status,active) VALUES ('non capté'   , false);

COMMIT;
