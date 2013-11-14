/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Cistern types */
DROP TABLE IF EXISTS distribution.vl_cistern CASCADE;
CREATE TABLE distribution.vl_cistern (id integer not null, CONSTRAINT "vl_cistern_pk" PRIMARY KEY (id) );

ALTER TABLE distribution.vl_cistern ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_cistern ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_cistern ADD COLUMN value_fr varchar(30) default '' ;

/* content */
INSERT INTO distribution.vl_cistern (id,value_en,value_fr) VALUES (2101,'circular', 'cirvulaire');
INSERT INTO distribution.vl_cistern (id,value_en,value_fr) VALUES (2102,'rectangular', 'rectangulaire');
