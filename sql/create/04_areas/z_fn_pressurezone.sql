/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* get pressurezone name function */
CREATE OR REPLACE FUNCTION qwat.fn_get_pressurezone(geometry) RETURNS text AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT name INTO result
			FROM  qwat.od_pressurezone
			WHERE ST_Intersects(geom,od_pressurezone.geometry) IS TRUE;
		RETURN result;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_pressurezone(geometry) IS 'Return the name of the first overlapping pressurezone.';

/* get pressurezone id function */
CREATE OR REPLACE FUNCTION qwat.fn_get_pressurezone_id(geometry) RETURNS integer AS
$BODY$ 
	DECLARE
		geom ALIAS FOR $1;
		id_pressurezone integer;
	BEGIN
		SELECT od_pressurezone.id INTO id_pressurezone
			FROM  qwat.od_pressurezone
			WHERE ST_Intersects(geom,od_pressurezone.geometry) IS TRUE
			ORDER BY ST_Length(ST_Intersection(geom,od_pressurezone.geometry)) DESC
			LIMIT 1;
		RETURN id_pressurezone;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_get_pressurezone_id(geometry) IS 'Returns the id of the first overlapping pressurezone.';
