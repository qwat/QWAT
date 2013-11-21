/*
	qWat - QGIS Water Module
	
	SQL file :: pipe functions
*/

/*----------------!!!---!!!----------------*/
/* get pipe id */
CREATE OR REPLACE FUNCTION distribution.fn_pipe_get_id(geometry) RETURNS integer AS
$BODY$
	DECLARE
		point ALIAS for $1;
		pipe_id integer;
	BEGIN
		SELECT id FROM distribution.od_pipe WHERE ST_Intersects(point,geometry) LIMIT 1 INTO pipe_id ;
		RETURN pipe_id;	
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_pipe_get_id(geometry) IS 'Returns the pipe at a given position.';


