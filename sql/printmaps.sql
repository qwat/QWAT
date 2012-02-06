/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/

/*----------------!!!---!!!----------------*/
BEGIN;
/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.printmaps CASCADE;
CREATE TABLE distribution.printmaps (id serial NOT NULL);

ALTER TABLE distribution.printmaps ADD COLUMN  short_name varchar(20);
ALTER TABLE distribution.printmaps ADD COLUMN  long_name  text;
ALTER TABLE distribution.printmaps ADD COLUMN  template  varchar(50);
ALTER TABLE distribution.printmaps ADD COLUMN  _east  double precision;
ALTER TABLE distribution.printmaps ADD COLUMN  _north  double precision;

SELECT AddGeometryColumn('distribution', 'printmaps', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.printmaps ADD CONSTRAINT print_pkey PRIMARY KEY (id);

/* Comment */
COMMENT ON TABLE distribution.printmaps IS 'This table is used for polygons for predefined printable maps. short_name would be used as label string, and long_mame would be used in the print composer.';

/*----------------!!!---!!!----------------*/
/* Trigger for size */
CREATE OR REPLACE FUNCTION distribution.printmaps_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.printmaps SET 
			_east   = ST_XMax(BOX2D(NEW.wkb_geometry))-ST_XMin(BOX2D(NEW.wkb_geometry)),
			_north  = ST_YMax(BOX2D(NEW.wkb_geometry))-ST_YMin(BOX2D(NEW.wkb_geometry))
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.printmaps_geom() IS 'Fcn/Trigger: updates the size of the bounding box into width/length fields.';

CREATE TRIGGER printmaps_geom_trigger 
	AFTER INSERT OR UPDATE OF wkb_geometry ON distribution.printmaps
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.printmaps_geom();
COMMENT ON TRIGGER printmaps_geom_trigger ON distribution.printmaps IS 'Trigger: updates the size of the bounding box into width/length fields.';


/*----------------!!!---!!!----------------*/
/* FUNCTION  to get the map*/
CREATE OR REPLACE FUNCTION distribution.get_map(geometry) RETURNS text AS '
	DECLARE
		geometry ALIAS FOR $1;
		result text;
	BEGIN
		SELECT left(distribution.tsum(printmaps.short_name || '', ''),-2) INTO result
			FROM  distribution.printmaps
			WHERE ST_Intersects(geometry,printmaps.wkb_geometry) IS TRUE;
		RETURN result;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_map(geometry) IS 'Returns a string contaning all the short names of the polygons in table printmaps which overlap the given geometry.';

COMMIT;
