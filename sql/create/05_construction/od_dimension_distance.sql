/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_dimension_distance CASCADE;
CREATE TABLE distribution.od_dimension_distance (id serial NOT NULL, CONSTRAINT dimension_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_dimension_distance IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/* columns */
ALTER TABLE distribution.od_dimension_distance ADD COLUMN observation  varchar(120);
ALTER TABLE distribution.od_dimension_distance ADD COLUMN _calculation double precision;
ALTER TABLE distribution.od_dimension_distance ADD COLUMN remark       text;

/* geometry */
SELECT AddGeometryColumn('distribution', 'od_dimension_distance','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_geoidx ON distribution.od_dimension_distance USING GIST ( geometry );


/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION distribution.od_dimension_distance_distance() RETURNS trigger AS 
$BODY$
	BEGIN
		NEW._calculation := ST_Distance( ST_StartPoint(NEW.geometry), ST_EndPoint(NEW.geometry) );
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_dimension_distance_distance() IS 'Fcn/Trigger: updates the distance between the two extremities of the arc.';

CREATE TRIGGER dimension_distance_trigger 
	BEFORE INSERT OR UPDATE OF geometry ON distribution.od_dimension_distance
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_dimension_distance_distance();
COMMENT ON TRIGGER dimension_distance_trigger ON distribution.od_dimension_distance IS 'Trigger: updates the length and other fields of the pipe after insert/update.';




