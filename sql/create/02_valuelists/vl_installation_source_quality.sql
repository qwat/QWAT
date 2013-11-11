/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source quality */
DROP TABLE IF EXISTS distribution.vl_source_quality CASCADE;
CREATE TABLE distribution.vl_source_quality (id serial NOT NULL);
ALTER TABLE distribution.vl_source_quality ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_source_quality ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE distribution.vl_source_quality ADD COLUMN code_sire smallint              ;
/* primary key */
ALTER TABLE distribution.vl_source_quality ADD CONSTRAINT vl_source_quality_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_source_quality (code_sire, value_fr) VALUES (0, 'inconnue');
INSERT INTO distribution.vl_source_quality (code_sire, value_fr) VALUES (1, 'bonne');
INSERT INTO distribution.vl_source_quality (code_sire, value_fr) VALUES (2, 'conditionnellement bonne');
INSERT INTO distribution.vl_source_quality (code_sire, value_fr) VALUES (3, 'désinfection obligatoire');
