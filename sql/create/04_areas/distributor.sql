/*
	qWat - QGIS Water Module
	
	SQL file :: distributors/companies tables
*/


DROP TABLE IF EXISTS distribution.od_distributor CASCADE;
CREATE TABLE distribution.od_distributor ( id SERIAL, CONSTRAINT distributor_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_distributor IS 'Companies and distributors list.';

/* Columns */
ALTER TABLE distribution.od_distributor ADD COLUMN name VARCHAR(30);

/* Constraints */
ALTER TABLE distribution.od_distributor ADD CONSTRAINT distributor_name UNIQUE (name);



