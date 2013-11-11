/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS distribution.vl_source_type CASCADE;
CREATE TABLE distribution.vl_source_type (id serial NOT NULL);
ALTER TABLE distribution.vl_source_type ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE distribution.vl_source_type ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE distribution.vl_source_type ADD COLUMN code_sire smallint               ;
/* primary key */
ALTER TABLE distribution.vl_source_type ADD CONSTRAINT vl_source_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_source_type (code_sire,value_fr) VALUES (0, 'captage eau lac');
INSERT INTO distribution.vl_source_type (code_sire,value_fr) VALUES (1, 'captage eau nappe');
INSERT INTO distribution.vl_source_type (code_sire,value_fr) VALUES (2, 'captage eau source');
INSERT INTO distribution.vl_source_type (code_sire,value_fr) VALUES (3, 'captage eau rivière');
