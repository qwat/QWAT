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
ALTER TABLE distribution.dimension ADD COLUMN  _distance_observed varchar(12);
ALTER TABLE distribution.dimension ADD COLUMN  _distance_terrain  double precision;

/* geometry */
SELECT AddGeometryColumn('distribution','dimension','geometry',21781,'MULTIPOINT',2);
CREATE INDEX dimension_geoidx ON distribution.dimension USING GIST ( geometry ); 

/* primary key */
ALTER TABLE distribution.dimension ADD CONSTRAINT dimension_pkey PRIMARY KEY (id);

/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION distribution.dimension_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.dimension SET 
			_distance_terrain = ST_Distance( ST_GeometryN(NEW.geometry,1) , ST_GeometryN(NEW.geometry,ST_NumGeometries(NEW.geometry)) )
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.dimension_geom() IS 'Fcn/Trigger: updates the map distance between the two extremities of the arc.';

CREATE TRIGGER dimension_geom_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.dimension
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.dimension_geom();
COMMENT ON TRIGGER dimension_geom_trigger ON distribution.dimension IS 'Trigger: updates the length and other fields of the pipe after insert/update.';

COMMIT;
