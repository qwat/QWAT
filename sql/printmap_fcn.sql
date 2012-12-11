/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/

BEGIN;


/* get printmaps names */
CREATE OR REPLACE FUNCTION distribution.get_printmaps(geometry) RETURNS text AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(printmap.short_name , '', '') INTO result
			FROM  distribution.printmap
			WHERE ST_Intersects(geom,printmap.geometry) IS TRUE;
		RETURN result;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_printmaps(geometry) IS 'Returns a string contaning all the short names of the polygons in table printmap which overlap the given geometry.';


/* get printmap id function */
CREATE OR REPLACE FUNCTION distribution.get_printmap_id(geometry) RETURNS integer AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		id_printmap integer[];
	BEGIN
		SELECT printmap.id INTO id_printmap
				FROM  distribution.printmap
				WHERE ST_Intersects(geom,printmap.geometry) IS TRUE;
		RETURN id_printmap;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_printmap_id(geometry) IS 'Returns the id of the first overlapping printmap.';

COMMIT;
