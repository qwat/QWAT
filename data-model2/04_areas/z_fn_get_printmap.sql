/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/




/* get printmaps names */
CREATE OR REPLACE FUNCTION qwat.fn_get_printmaps(geometry) RETURNS text AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(od_printmap.name , ', ') INTO result
			FROM  qwat.od_printmap
			WHERE ST_Intersects(geom,od_printmap.geometry) IS TRUE;
		RETURN result;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_printmaps(geometry) IS 'Returns a string contaning all the short names of the polygons in table printmap which overlap the given geometry.';


/* get printmap id function */
CREATE OR REPLACE FUNCTION qwat.fn_get_printmap_id(geometry) RETURNS integer[] AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
	BEGIN
		RETURN ARRAY( SELECT od_printmap.id FROM  qwat.od_printmap WHERE ST_Intersects(geom,od_printmap.geometry) IS TRUE);
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_printmap_id(geometry) IS 'Returns the id of the first overlapping printmap.';


