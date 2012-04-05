/*
	qWat - QGIS Water Module
	
	SQL file :: installations
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installations CASCADE;
CREATE TABLE distribution.installations (id serial NOT NULL);
ALTER TABLE distribution.installations ADD COLUMN  name       varchar(30) DEFAULT '';
ALTER TABLE distribution.installations ADD COLUMN  id_type    integer               ;
SELECT AddGeometryColumn('distribution', 'installations', 'geometry', 21781, 'POINT', 2);
SELECT setval('distribution.installations_id_seq', 100, true);
/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.installations ADD CONSTRAINT installations_pkey PRIMARY KEY (id);
/* GIST index*/
CREATE INDEX installations_geoidx ON distribution.installations USING GIST ( geometry );
/* Comment */
COMMENT ON TABLE distribution.installations IS 'installations.';

/*----------------!!!---!!!----------------*/
/* Add constraints */
/* primary key */
ALTER TABLE distribution.installations ADD CONSTRAINT installations_id_type FOREIGN KEY (id_type) REFERENCES distribution.installations_type(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_installations_id_type ON distribution.installations(id_type);





COMMIT;

