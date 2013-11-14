/*
	qWat - QGIS Water Module
	
	SQL file :: protectionzone_type table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_protectionzone_type CASCADE;
CREATE TABLE distribution.vl_protectionzone_type ( id integer not null, CONSTRAINT "protectionzone_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_protectionzone_type IS 'type of protection zone.';

/* COLUMNS*/
ALTER TABLE distribution.vl_protectionzone_type ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_protectionzone_type ADD COLUMN value_fr varchar(50);
ALTER TABLE distribution.vl_protectionzone_type ADD COLUMN value_en varchar(50);
ALTER TABLE distribution.vl_protectionzone_type ADD COLUMN short_fr varchar(255);
ALTER TABLE distribution.vl_protectionzone_type ADD COLUMN short_en varchar(255);

/* CONTENT */
INSERT INTO distribution.vl_protectionzone_type (id,short_fr,value_fr) VALUES (9501,'S1','Zone de protection S1');
INSERT INTO distribution.vl_protectionzone_type (id,short_fr,value_fr) VALUES (9502,'S2','Zone de protection S2');
INSERT INTO distribution.vl_protectionzone_type (id,short_fr,value_fr) VALUES (9503,'S3','Zone de protection S3');
INSERT INTO distribution.vl_protectionzone_type (id,short_fr,value_fr) VALUES (9504,'PP','Périmètre de protection');
INSERT INTO distribution.vl_protectionzone_type (id,short_fr,value_fr) VALUES (9505,'Zo','Zone de protection des eaux de surface');


