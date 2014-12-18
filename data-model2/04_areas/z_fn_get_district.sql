/*
	qWat - QGIS Water Module
	
	SQL file :: district functions
*/



/*----------------!!!---!!!----------------*/
/* get districts name function */
CREATE OR REPLACE FUNCTION qwat.fn_get_districts(geometry) RETURNS text AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(od_district.name , ', ') INTO result
			FROM  qwat.od_district
			WHERE ST_Intersects(geom,od_district.geometry) IS TRUE;
		RETURN result;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_districts(geometry) IS 'Returns a coma separeted list of the districts overlapping the given geometry.';

/* get district id function */
CREATE OR REPLACE FUNCTION qwat.fn_get_district_id(geometry) RETURNS integer AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		id_district integer;
	BEGIN
		SELECT od_district.id INTO id_district
			FROM  qwat.od_district
			WHERE ST_Intersects(geom,od_district.geometry) IS TRUE
			LIMIT 1;
		RETURN id_district;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_district_id(geometry) IS 'Returns the id of the first overlapping district.';


