/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS distribution.vl_source_type CASCADE;
CREATE TABLE distribution.vl_source_type (id integer not null, CONSTRAINT "vl_source_type_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE distribution.vl_source_type ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_source_type ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE distribution.vl_source_type ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE distribution.vl_source_type ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO distribution.vl_source_type (id,code_sire,value_fr) VALUES (2701,0, 'captage eau lac');
INSERT INTO distribution.vl_source_type (id,code_sire,value_fr) VALUES (2702,1, 'captage eau nappe');
INSERT INTO distribution.vl_source_type (id,code_sire,value_fr) VALUES (2703,2, 'captage eau source');
INSERT INTO distribution.vl_source_type (id,code_sire,value_fr) VALUES (2704,3, 'captage eau rivière');
