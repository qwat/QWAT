/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.dimension CASCADE;
CREATE TABLE distribution.dimension (id serial NOT NULL);
COMMENT ON TABLE distribution.dimension IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/* columns */
ALTER TABLE distribution.dimension ADD COLUMN "type" varchar(12); /* distance or orientation*/ 
ALTER TABLE distribution.dimension ADD COLUMN _distance_observed double precision;
ALTER TABLE distribution.dimension ADD COLUMN _distance_terrain  double precision;
ALTER TABLE distribution.dimension ADD COLUMN _orientation  varchar(50);

/* geometry */
SELECT AddGeometryColumn('distribution','dimension','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_geoidx2 ON distribution.dimension USING GIST ( geometry );


/* primary key */
ALTER TABLE distribution.dimension ADD CONSTRAINT dimension_pkey PRIMARY KEY (id);

/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION distribution.dimension_distance() RETURNS trigger AS 
$BODY$
	BEGIN
		UPDATE distribution.dimension SET 
			_distance_terrain = ST_Distance( ST_GeometryN(NEW.geometry, 1), ST_GeometryN(NEW.geometry, ST_NumGeometry(NEW.geometry)) )
		WHERE id = NEW.id;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.dimension_distance() IS 'Fcn/Trigger: updates the distance between the two extremities of the arc.';

CREATE TRIGGER dimension_distance_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.dimension
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.dimension_distance();
COMMENT ON TRIGGER dimension_distance_trigger ON distribution.dimension IS 'Trigger: updates the length and other fields of the pipe after insert/update.';



COMMIT;
