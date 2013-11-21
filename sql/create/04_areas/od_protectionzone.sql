/*
	qWat - QGIS Water Module
	
	SQL file :: protection zone
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_protectionzone CASCADE;
CREATE TABLE distribution.od_protectionzone (id serial, CONSTRAINT "protectionzone_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_protectionzone IS 'protectionzones.';

/* columns */
ALTER TABLE distribution.od_protectionzone ADD COLUMN id_type   integer;
ALTER TABLE distribution.od_protectionzone ADD COLUMN name      varchar(40);
ALTER TABLE distribution.od_protectionzone ADD COLUMN validated boolean     default True;
ALTER TABLE distribution.od_protectionzone ADD COLUMN date      date;
ALTER TABLE distribution.od_protectionzone ADD COLUMN agent     varchar(40);

/* geometry */
SELECT AddGeometryColumn('distribution', 'od_protectionzone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX protectionzone_geoidx ON distribution.od_protectionzone USING GIST ( geometry );

/* contraints */
ALTER TABLE distribution.od_protectionzone ADD CONSTRAINT protectionzone_name UNIQUE (name);
ALTER TABLE distribution.od_protectionzone ADD CONSTRAINT protectionzone_id_type FOREIGN KEY (id_type) REFERENCES distribution.vl_protectionzone_type (id) MATCH FULL ; CREATE INDEX fki_protectionzone_id_type ON distribution.od_protectionzone(id_type);


