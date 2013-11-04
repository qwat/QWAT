/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

DROP TABLE IF EXISTS distribution.vl_overflow CASCADE;
CREATE TABLE distribution.vl_overflow (id serial NOT NULL);
ALTER TABLE distribution.vl_overflow ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_overflow ADD COLUMN value_fr varchar(30) default '' ;
/* primary key */
ALTER TABLE distribution.vl_overflow ADD CONSTRAINT vl_overflow_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.vl_overflow (value_en,value_fr) VALUES ('dumped','en décharge');
INSERT INTO distribution.vl_overflow (value_en,value_fr) VALUES ('collected','récupéré');
