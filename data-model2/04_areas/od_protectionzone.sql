/*
	qWat - QGIS Water Module
	
	SQL file :: protection zone
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_protectionzone CASCADE;
CREATE TABLE qwat.od_protectionzone (id serial, CONSTRAINT "protectionzone_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.od_protectionzone IS 'protectionzones.';

/* columns */
ALTER TABLE qwat.od_protectionzone ADD COLUMN id_type   integer;
ALTER TABLE qwat.od_protectionzone ADD COLUMN name      varchar(40) default '';
ALTER TABLE qwat.od_protectionzone ADD COLUMN validated boolean     default True;
ALTER TABLE qwat.od_protectionzone ADD COLUMN date      date;
ALTER TABLE qwat.od_protectionzone ADD COLUMN agent     varchar(40) default '';

/* geometry */
SELECT AddGeometryColumn('qwat', 'od_protectionzone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX protectionzone_geoidx ON qwat.od_protectionzone USING GIST ( geometry );

/* contraints */
ALTER TABLE qwat.od_protectionzone ADD CONSTRAINT protectionzone_name UNIQUE (name);
ALTER TABLE qwat.od_protectionzone ADD CONSTRAINT protectionzone_id_type FOREIGN KEY (id_type) REFERENCES qwat.vl_protectionzone_type (id) MATCH FULL ; CREATE INDEX fki_protectionzone_id_type ON qwat.od_protectionzone(id_type);


