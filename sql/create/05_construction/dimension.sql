/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_dimension CASCADE;
CREATE TABLE distribution.od_dimension (id serial NOT NULL, CONSTRAINT dimension_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_dimension IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/* columns */
ALTER TABLE distribution.od_dimension ADD COLUMN "type" varchar(12); /* distance or orientation*/ 
ALTER TABLE distribution.od_dimension ADD COLUMN observation double precision;
ALTER TABLE distribution.od_dimension ADD COLUMN distance_extremities double precision;
ALTER TABLE distribution.od_dimension ADD COLUMN remark  text;

/* geometry */
SELECT AddGeometryColumn('distribution', 'od_dimension','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_geoidx ON distribution.od_dimension USING GIST ( geometry );


/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION distribution.od_dimension_distance() RETURNS trigger AS 
$BODY$
	BEGIN
		UPDATE distribution.od_dimension SET 
			distance_extremities = ST_Distance( ST_StartPoint(NEW.geometry), ST_EndPoint(NEW.geometry) )
		WHERE id = NEW.id;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_dimension_distance() IS 'Fcn/Trigger: updates the distance between the two extremities of the arc.';

CREATE TRIGGER dimension_distance_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.od_dimension
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_dimension_distance();
COMMENT ON TRIGGER dimension_distance_trigger ON distribution.od_dimension IS 'Trigger: updates the length and other fields of the pipe after insert/update.';




