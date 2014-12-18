/*
	qWat - QGIS Water Module

	SQL file :: get node id function
*/

CREATE OR REPLACE FUNCTION qwat.fn_node_get_id( point geometry, place_node boolean ) RETURNS integer AS
$BODY$
	DECLARE
		node_id integer;
	BEGIN
		SELECT id FROM qwat.od_node WHERE ST_DWithin(point,geometry,0.0) IS TRUE LIMIT 1 INTO node_id;
		IF node_id IS NULL AND place_node IS TRUE THEN
			INSERT INTO qwat.od_node (geometry) VALUES (point);
			SELECT id FROM qwat.od_node WHERE ST_DWithin(point,geometry,0.0) IS TRUE LIMIT 1 INTO node_id;
		END IF;
		RETURN node_id;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_node_get_id(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';



CREATE OR REPLACE FUNCTION qwat.fn_node_get_ids( extent box2d DEFAULT NULL ) RETURNS integer[] AS
$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
		IF extent IS NULL THEN
			SELECT ARRAY( SELECT id FROM qwat.od_node ) INTO node_ids;
		ELSE
			SELECT ARRAY( SELECT id FROM qwat.od_node WHERE od_node.geometry && extent ) INTO node_ids;
		END IF;
		RETURN node_ids;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_node_get_ids(extent box2d) IS 'Returns a list of node IDs contained a given extent.';
