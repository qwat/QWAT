/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/

BEGIN;
/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.printmap CASCADE;
CREATE TABLE distribution.printmap (id serial NOT NULL);
COMMENT ON TABLE distribution.printmap IS 'This table is used for polygons for predefined printable maps. shortname would be used as label string, and long_mame would be used in the print composer.';

/* columns */
ALTER TABLE distribution.printmap ADD COLUMN  shortname varchar(20);
ALTER TABLE distribution.printmap ADD COLUMN  longname  text;
ALTER TABLE distribution.printmap ADD COLUMN  template  varchar(50);
ALTER TABLE distribution.printmap ADD COLUMN  _east  double precision;
ALTER TABLE distribution.printmap ADD COLUMN  _north  double precision;

/* geometry */
SELECT AddGeometryColumn('distribution', 'printmap', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX printmap_geoidx ON distribution.printmap USING GIST ( geometry ); 

/* Constraints */
ALTER TABLE distribution.printmap ADD CONSTRAINT print_pkey PRIMARY KEY (id);


/*----------------!!!---!!!----------------*/
/* Trigger for size */
CREATE OR REPLACE FUNCTION distribution.printmap_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.printmap SET 
			_east   = ST_XMax(BOX2D(NEW.geometry))-ST_XMin(BOX2D(NEW.geometry)),
			_north  = ST_YMax(BOX2D(NEW.geometry))-ST_YMin(BOX2D(NEW.geometry))
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.printmap_geom() IS 'Fcn/Trigger: updates the size of the bounding box into width/length fields.';

CREATE TRIGGER printmap_geom_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.printmap
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.printmap_geom();
COMMENT ON TRIGGER printmap_geom_trigger ON distribution.printmap IS 'Trigger: updates the size of the bounding box into width/length fields.';

COMMIT;
