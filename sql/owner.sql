/*
	qWat - QGIS Water Module
	
	SQL file :: owners/companies tables
*/
BEGIN;

DROP TABLE IF EXISTS distribution.owner CASCADE;
CREATE TABLE distribution.owner ( id SERIAL, CONSTRAINT owner_pk PRIMARY KEY (id) );

/* Columns */
ALTER TABLE distribution.owner ADD COLUMN name VARCHAR(30);


/* Constraints */
ALTER TABLE distribution.owner ADD CONSTRAINT owner_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.owner IS 'Companies and owners list.';


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.owner (name) VALUES ('SIGE');
INSERT INTO distribution.owner (name) VALUES ('ES Lausanne');
INSERT INTO distribution.owner (name) VALUES ('Privé');
INSERT INTO distribution.owner (name) VALUES ('Blonay');


COMMIT;
