/*
	qWat - QGIS Water Module
	
	SQL file :: distributors/companies tables
*/


DROP TABLE IF EXISTS qwat.od_distributor CASCADE;
CREATE TABLE qwat.od_distributor ( id SERIAL, CONSTRAINT distributor_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.od_distributor IS 'Companies and distributors list.';

/* Columns */
ALTER TABLE qwat.od_distributor ADD COLUMN name VARCHAR(30) default '';

/* Constraints */
ALTER TABLE qwat.od_distributor ADD CONSTRAINT distributor_name UNIQUE (name);



