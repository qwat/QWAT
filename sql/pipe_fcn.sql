/*
	qWat - QGIS Water Module
	
	SQL file :: pipe functions
*/
BEGIN;

/*----------------!!!---!!!----------------*/
/* 3D Length */
CREATE OR REPLACE FUNCTION distribution.pipe_length3d() RETURNS void AS '
	DECLARE
		length double precision;
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,geometry,tunnel_or_bridge FROM distribution.pipe WHERE _length3d_uptodate IS NOT TRUE ORDER BY id LOOP
			IF pipeitem.tunnel_or_bridge IS TRUE THEN
				length := pipeitem._length2d;
			ELSE
				RAISE NOTICE ''%'', pipeitem.id;
				SELECT altitude.length3d(pipeitem.geometry) INTO length;
			END IF;
			UPDATE distribution.pipe SET _length3d = length, _length3d_uptodate = TRUE WHERE id = pipeitem.id;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_length3d() IS 'Fill the 3d length of the pipe.';

/*----------------!!!---!!!----------------*/
/* get pipe id */
CREATE OR REPLACE FUNCTION distribution.pipe_get_id(geometry) RETURNS integer AS '
	DECLARE
		point ALIAS for $1;
		pipe_id integer;
		distance_threshold double precision := 0.000001;
		number_of_pipe integer;
	BEGIN
		SELECT COUNT(id) FROM distribution.pipe WHERE ST_DWithin(point,geometry,distance_threshold) INTO number_of_pipe;
		IF number_of_pipe != 1 THEN
			RETURN NULL ;
		ELSE 
			SELECT id FROM distribution.pipe WHERE ST_DWithin(point,geometry,distance_threshold) INTO pipe_id ;
			RETURN pipe_id;	
		END IF;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_get_id(geometry) IS 'Returns the pipe at a given position. If several pipe, return NULL.';

COMMIT;
