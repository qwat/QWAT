/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/

/*----------------!!!---!!!----------------*/
/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.printable_maps CASCADE;
CREATE TABLE distribution.printable_maps (fid serial NOT NULL);

ALTER TABLE distribution.printable_maps ADD COLUMN  short_name varchar(20);
ALTER TABLE distribution.printable_maps ADD COLUMN  long_name  text;
ALTER TABLE distribution.printable_maps ADD COLUMN  template  varchar(50);

SELECT AddGeometryColumn('distribution', 'printable_maps', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.printable_maps ADD CONSTRAINT print_pkey PRIMARY KEY (fid);

/* Comment */
COMMENT ON TABLE distribution.printable_maps IS 'This table is used for polygons for predefined printable maps. short_name would be used as label string, and long_mame would be used in the print composer.';


/*----------------!!!---!!!----------------*/
/* FUNCTION */
DROP AGGREGATE IF EXISTS distribution.tsum(text);
CREATE AGGREGATE distribution.tsum ( BASETYPE = text, SFUNC = textcat, STYPE = text, INITCOND = '' );
COMMENT ON AGGREGATE distribution.tsum(text) IS 'Used to concatenate text in a SELECT. See distribution.getMapName for an example.';


CREATE OR REPLACE FUNCTION distribution.getMapName(integer) RETURNS text AS '
	DECLARE
		pipe_id ALIAS FOR $1;
		result text;
	BEGIN
		SELECT left(distribution.tsum(printable_maps.short_name || '', ''),-2) INTO result
			FROM distribution.printable_maps, distribution.pipes WHERE pipes.fid = pipe_id
			 AND ST_Intersects(pipes.wkb_geometry,printable_maps.wkb_geometry) IS TRUE;
		RETURN result;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.getMapName(integer) IS 'Returns a string contaning all the short names of the polygons in table printable_maps which overlap the given pipe.';


CREATE OR REPLACE FUNCTION distribution.fillMapNames() RETURNS boolean AS '
	BEGIN
		UPDATE distribution.pipes SET is_on_map = distribution.getMapName(pipes.fid);	
		RETURN true;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fillMapNames() IS 'Populates the is_on_map field in pipes table with all the short names of poylgons in table printable_maps which overlap the given pipe.';




