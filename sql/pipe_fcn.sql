/*
	qWat - QGIS Water Module
	
	SQL file :: pipe functions
*/
BEGIN;

/*----------------!!!---!!!----------------*/
/* 3D Length */
CREATE OR REPLACE FUNCTION distribution.pipe_length3d() RETURNS void AS
$BODY$
	DECLARE
		length double precision;
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,geometry,tunnel_or_bridge FROM distribution.pipe WHERE _length3d IS NULL ORDER BY id LOOP
			IF pipeitem.tunnel_or_bridge IS TRUE THEN
				length := pipeitem._length2d;
			ELSE
				RAISE NOTICE '%', pipeitem.id;
				SELECT altitude.length3d(pipeitem.geometry) INTO length;
			END IF;
			UPDATE distribution.pipe SET _length3d = length WHERE id = pipeitem.id;
		END LOOP;
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_length3d() IS 'Fill the 3d length of the pipe.';

/*----------------!!!---!!!----------------*/
/* get pipe id */
CREATE OR REPLACE FUNCTION distribution.pipe_get_id(geometry) RETURNS integer AS
$BODY$
	DECLARE
		point ALIAS for $1;
		pipe_id integer;
	BEGIN
		SELECT id FROM distribution.pipe WHERE ST_Intersects(point,geometry) LIMIT 1 INTO pipe_id ;
		RETURN pipe_id;	
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_get_id(geometry) IS 'Returns the pipe at a given position. If several pipe, return NULL.';

COMMIT;
