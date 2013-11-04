/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS distribution.vl_sourcetype CASCADE;
CREATE TABLE distribution.vl_sourcetype (id serial NOT NULL);
ALTER TABLE distribution.vl_sourcetype ADD COLUMN name varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_sourcetype ADD CONSTRAINT vl_sourcetype_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_sourcetype ("name") VALUES ('1');
INSERT INTO distribution.vl_sourcetype ("name") VALUES ('2');


/* source quality */
DROP TABLE IF EXISTS distribution.vl_sourcequality CASCADE;
CREATE TABLE distribution.vl_sourcequality (id serial NOT NULL);
ALTER TABLE distribution.vl_sourcequality ADD COLUMN name varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_sourcequality ADD CONSTRAINT vl_sourcequality_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_sourcequality ("name") VALUES ('a');
INSERT INTO distribution.vl_sourcequality ("name") VALUES ('b');
INSERT INTO distribution.vl_sourcequality ("name") VALUES ('c');
