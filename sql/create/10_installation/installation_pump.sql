/*
	qWat - QGIS Water Module

	SQL file :: installation <- pump
*/

/* Tank apron */
DROP TABLE IF EXISTS distribution.installation_pump_type CASCADE;
CREATE TABLE distribution.installation_pump_type (id serial NOT NULL);
ALTER TABLE distribution.installation_pump_type ADD COLUMN  name  varchar(30) DEFAULT '' ;
/* primary key */
ALTER TABLE distribution.installation_pump_type ADD CONSTRAINT installation_pump_type_pkey PRIMARY KEY (id);
/* content */
INSERT INTO distribution.installation_pump_type ("name") VALUES ('1');
INSERT INTO distribution.installation_pump_type ("name") VALUES ('2');


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_pump CASCADE;
CREATE TABLE distribution.installation_pump (id serial NOT NULL);
SELECT setval('distribution.installation_pump_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_pump IS '';

/* columns */
ALTER TABLE distribution.installation_pump ADD COLUMN id_installation   smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE distribution.installation_pump ADD COLUMN nb_pump           smallint     ;
ALTER TABLE distribution.installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE distribution.installation_pump ADD COLUMN manometric_height decimal(10,2);
ALTER TABLE distribution.installation_pump ADD COLUMN remarks           text         ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_pump', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_pump_geoidx ON distribution.installation_pump USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_installation	FOREIGN KEY (id_installation) REFERENCES distribution.installation(id)           MATCH FULL; CREATE INDEX fki_installation_pump_id_installation ON distribution.installation_pump(id_installation);
ALTER TABLE distribution.installation_pump ADD CONSTRAINT installation_pump_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.installation_pump_type(id) MATCH FULL; CREATE INDEX fki_installation_pump_type            ON distribution.installation_pump(id_type);



