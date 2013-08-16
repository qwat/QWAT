/*
	qWat - QGIS Water Module

	SQL file :: installation <- source
*/

/* source type */
DROP TABLE IF EXISTS distribution.installation_source_type CASCADE;
CREATE TABLE distribution.installation_source_type (id serial NOT NULL);
ALTER TABLE distribution.installation_source_type ADD COLUMN name varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_source_type ADD CONSTRAINT installation_source_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_source_type ("name") VALUES ('1');
INSERT INTO distribution.installation_source_type ("name") VALUES ('2');

/* source quality */
DROP TABLE IF EXISTS distribution.installation_source_quality CASCADE;
CREATE TABLE distribution.installation_source_quality (id serial NOT NULL);
ALTER TABLE distribution.installation_source_quality ADD COLUMN name varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_source_quality ADD CONSTRAINT installation_source_quality_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_source_quality ("name") VALUES ('a');
INSERT INTO distribution.installation_source_quality ("name") VALUES ('b');
INSERT INTO distribution.installation_source_quality ("name") VALUES ('c');


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_source CASCADE;
CREATE TABLE distribution.installation_source (id serial NOT NULL);
SELECT setval('distribution.installation_source_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_source IS '';

/* columns */
ALTER TABLE distribution.installation_source ADD COLUMN id_installation   smallint     ;
ALTER TABLE distribution.installation_source ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.installation_source ADD COLUMN id_quality        smallint     ;
ALTER TABLE distribution.installation_source ADD COLUMN altitude          decimal(10,3);
ALTER TABLE distribution.installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE distribution.installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE distribution.installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE distribution.installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE distribution.installation_source ADD COLUMN gathering_chamber boolean      ;
ALTER TABLE distribution.installation_source ADD COLUMN remarks           text         ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_source', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_source_geoidx ON distribution.installation_source USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_source ADD CONSTRAINT installation_source_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_source ADD CONSTRAINT installation_source_id_installation	FOREIGN KEY (id_installation) REFERENCES distribution.installation(id)                MATCH FULL; CREATE INDEX fki_installation_source_id_installation ON distribution.installation_source(id_installation);
ALTER TABLE distribution.installation_source ADD CONSTRAINT installation_source_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.installation_source_type(id)    MATCH FULL; CREATE INDEX fki_installation_source_type            ON distribution.installation_source(id_type);
ALTER TABLE distribution.installation_source ADD CONSTRAINT installation_source_id_quality      FOREIGN KEY (id_quality)      REFERENCES distribution.installation_source_quality(id) MATCH SIMPLE; CREATE INDEX fki_installation_source_quality         ON distribution.installation_source(id_quality);



