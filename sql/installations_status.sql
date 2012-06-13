/*
	qWat - QGIS Water Module
	
	SQL file :: installation_status table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.installation_status CASCADE;
CREATE TABLE distribution.installation_status ( id SERIAL, CONSTRAINT installation_status_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.installation_status IS 'Status for installation.';

/* Columns */
ALTER TABLE distribution.installation_status ADD COLUMN status VARCHAR(30);
ALTER TABLE distribution.installation_status ADD COLUMN active BOOLEAN DEFAULT true;

/* Constraints */
ALTER TABLE distribution.installation_status ADD CONSTRAINT status_name2 UNIQUE (status);


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.installation_status (status,active) VALUES ('en service'  , true );
INSERT INTO distribution.installation_status (status,active) VALUES ('hors service', false);
INSERT INTO distribution.installation_status (status,active) VALUES ('abandonnee'  , false);
INSERT INTO distribution.installation_status (status,active) VALUES ('détruit'     , false);
INSERT INTO distribution.installation_status (status,active) VALUES ('non capté'   , false);
INSERT INTO distribution.installation_status (status,active) VALUES ('en réserve'  , false);

COMMIT;
