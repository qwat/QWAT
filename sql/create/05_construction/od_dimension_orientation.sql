/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_dimension_orientation CASCADE;
CREATE TABLE qwat.od_dimension_orientation (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_dimension_orientation IS 'dimension arcs displays measures done on the field. For example: orientations to buildings corner';

/* columns */
ALTER TABLE qwat.od_dimension_orientation ADD COLUMN observation varchar(120) default '';
ALTER TABLE qwat.od_dimension_orientation ADD COLUMN remark      text default '';

/* geometry */
SELECT AddGeometryColumn('qwat', 'od_dimension_orientation','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_orientation_geoidx ON qwat.od_dimension_orientation USING GIST ( geometry );



