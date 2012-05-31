/*
	qWat - QGIS Water Module
	
	SQL file :: owners/companies tables
*/
BEGIN;

DROP TABLE IF EXISTS distribution.owner CASCADE;
CREATE TABLE distribution.owner ( id SERIAL, CONSTRAINT owner_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.owner IS 'Companies and owners list.';

/* Columns */
ALTER TABLE distribution.owner ADD COLUMN name VARCHAR(30);

/* Constraints */
ALTER TABLE distribution.owner ADD CONSTRAINT owner_name UNIQUE (name);


COMMIT;
