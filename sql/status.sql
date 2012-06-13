/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.status CASCADE;
CREATE TABLE distribution.status ( id SERIAL, CONSTRAINT status_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.status IS 'Status table, with SIRE id.';

/* Columns */
ALTER TABLE distribution.status ADD COLUMN status VARCHAR(30);
ALTER TABLE distribution.status ADD COLUMN active BOOLEAN DEFAULT true;
ALTER TABLE distribution.status ADD COLUMN sire   SMALLINT DEFAULT NULL;

/* Constraints */
ALTER TABLE distribution.status ADD CONSTRAINT status_name2 UNIQUE (status);


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.status (status,active) VALUES ('en service'  , true , 1);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('en attente'  , true , 0);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('hors service', false, NULL);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('abandonnee'  , false, NULL);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('détruit'     , false, NULL);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('non capté'   , false, 0);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('en réserve'  , false, 0);   /*  */
INSERT INTO distribution.status (status,active) VALUES ('fictif'      , false, 1);   /*  */

COMMIT;
