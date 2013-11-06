/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS distribution.vl_source_type CASCADE;
CREATE TABLE distribution.vl_source_type (id serial NOT NULL);
ALTER TABLE distribution.vl_source_type ADD COLUMN name varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_source_type ADD CONSTRAINT vl_source_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_source_type ("name") VALUES ('1');
INSERT INTO distribution.vl_source_type ("name") VALUES ('2');


/* source quality */
DROP TABLE IF EXISTS distribution.vl_source_quality CASCADE;
CREATE TABLE distribution.vl_source_quality (id serial NOT NULL);
ALTER TABLE distribution.vl_source_quality ADD COLUMN name varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_source_quality ADD CONSTRAINT vl_source_quality_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_source_quality ("name") VALUES ('a');
INSERT INTO distribution.vl_source_quality ("name") VALUES ('b');
INSERT INTO distribution.vl_source_quality ("name") VALUES ('c');
