/*
	qWat - QGIS Water Module

	SQL file :: get node id function
*/

CREATE OR REPLACE FUNCTION distribution.fn_node_get_id( point geometry, place_node boolean ) RETURNS integer AS
$BODY$
	DECLARE
		node_id integer;
	BEGIN
		SELECT id FROM distribution.od_node WHERE ST_DWithin(point,geometry,0.0) IS TRUE LIMIT 1 INTO node_id;
		IF node_id IS NULL AND place_node IS TRUE THEN
			INSERT INTO distribution.od_node (geometry) VALUES (point);
			SELECT id FROM distribution.od_node WHERE ST_DWithin(point,geometry,0.0) IS TRUE LIMIT 1 INTO node_id;
		END IF;
		RETURN node_id;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_node_get_id(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';

