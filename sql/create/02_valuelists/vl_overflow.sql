/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

DROP TABLE IF EXISTS distribution.vl_overflow CASCADE;
CREATE TABLE distribution.vl_overflow (id integer not null, CONSTRAINT "vl_overflow_pk" PRIMARY KEY (id));

/* COLUMNS */
ALTER TABLE distribution.vl_overflow ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_overflow ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_overflow ADD COLUMN value_fr varchar(30) default '' ;

/* CONTENT */
INSERT INTO distribution.vl_overflow (id,value_en,value_fr) VALUES (2201,'dumped','en décharge');
INSERT INTO distribution.vl_overflow (id,value_en,value_fr) VALUES (2202,'collected','récupéré');
