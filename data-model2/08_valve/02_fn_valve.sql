/*
	qWat - QGIS Water Module
	
	SQL file :: node functions
*/



/* count pipes for a valve */
CREATE OR REPLACE FUNCTION qwat.fn_pipe_count_valve(integer) RETURNS integer AS
$BODY$
	DECLARE
		pipe_id ALIAS for $1;
		valve_count integer;
	BEGIN
		SELECT COUNT(id) FROM qwat.od_valve WHERE id_pipe = pipe_id INTO valve_count;
		RETURN valve_count ;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_pipe_count_valve(integer) IS 'Count the number of valves related to a given pipe.';


/* is a pipe closed */
CREATE OR REPLACE FUNCTION qwat.fn_pipe_isClosed(integer) RETURNS boolean AS
$BODY$
	DECLARE
		pipe_id ALIAS for $1;
		isClosed boolean;
	BEGIN
		SELECT bool_or(closed) FROM qwat.od_valve WHERE id_pipe = pipe_id INTO isClosed;
		RETURN isClosed ;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_pipe_count_valve(integer) IS 'Determine if a pipe is closed by a valve or not.';

  

