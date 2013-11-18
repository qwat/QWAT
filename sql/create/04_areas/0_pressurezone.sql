/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_pressurezone CASCADE;
CREATE TABLE distribution.od_pressurezone (id serial NOT NULL, CONSTRAINT pressurezone_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_pressurezone IS 'Pressure zones.';

/* COLUMNS */
ALTER TABLE distribution.od_pressurezone ADD COLUMN shortname  varchar(10);
ALTER TABLE distribution.od_pressurezone ADD COLUMN name       varchar(30);
ALTER TABLE distribution.od_pressurezone ADD COLUMN id_parent  integer;     /* FK self reference */
ALTER TABLE distribution.od_pressurezone ADD COLUMN colorcode  smallint;

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_pressurezone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX pressurezone_geoidx ON distribution.od_pressurezone USING GIST ( geometry ); 

/* CONSTRAINT */
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_id_parent FOREIGN KEY (id_parent) REFERENCES distribution.od_pressurezone (id) MATCH SIMPLE ; CREATE INDEX fki_pressurezone_id_parent  ON distribution.od_pressurezone(id_parent);
      

        

