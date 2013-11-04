/*
	qWat - QGIS Water Module
	
	SQL file :: distributors/companies tables
*/


DROP TABLE IF EXISTS distribution.distributor CASCADE;
CREATE TABLE distribution.distributor ( id SERIAL, CONSTRAINT distributor_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.distributor IS 'Companies and distributors list.';

/* Columns */
ALTER TABLE distribution.distributor ADD COLUMN name VARCHAR(30);

/* Constraints */
ALTER TABLE distribution.distributor ADD CONSTRAINT distributor_name UNIQUE (name);



