/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_installationpart_type CASCADE;
CREATE TABLE qwat.vl_installationpart_type ( id integer not null, CONSTRAINT installationpart_type_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_installationpart_type IS 'table for installation parts. They are supposed to be on top of nodes and might be used to display a specific symbol.';

/* COLUMNS */
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN value_ro  varchar(30) default '';
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN active    boolean default true;
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN helper_en text default '';
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN helper_fr text default '';
ALTER TABLE qwat.vl_installationpart_type ADD COLUMN helper_ro text default '';

/* VALUES */

INSERT INTO qwat.vl_installationpart_type (id, value_en, value_fr, value_ro, active, helper_en, helper_fr, helper_ro) VALUES (9200, '', 'compteur abonné', '', true, '', '', '');    /*  */
INSERT INTO qwat.vl_installationpart_type (id, value_en, value_fr, value_ro, active, helper_en, helper_fr, helper_ro) VALUES (9201, '', 'bouchon'        , '', true, '', '', '');    /*  */
