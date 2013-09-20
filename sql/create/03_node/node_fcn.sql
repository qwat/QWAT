/*
	qWat - QGIS Water Module

	SQL file :: node functions
*/




/* set node altitude */
CREATE OR REPLACE FUNCTION distribution.node_altitude() RETURNS void AS
$BODY$
	BEGIN
		UPDATE distribution.node SET altitude_dtm = altitude.altitude(geometry) WHERE altitude_dtm IS NULL ;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_altitude() IS 'Fill the altitude of the node.';


/* get node id */
CREATE OR REPLACE FUNCTION distribution.node_get_id(geometry,boolean) RETURNS integer AS
$BODY$
	DECLARE
		point ALIAS for $1;
		place_node ALIAS for $2;
		node_id integer;
	BEGIN
		SELECT id FROM distribution.node WHERE ST_DWithin(point,geometry,0) IS TRUE LIMIT 1 INTO node_id;
		IF node_id IS NULL AND place_node IS TRUE THEN
			INSERT INTO distribution.node (geometry) VALUES (point);
			SELECT id FROM distribution.node WHERE ST_DWithin(point,geometry,0) IS TRUE LIMIT 1 INTO node_id;
		END IF;
		RETURN node_id;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_get_id(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';

/* define node type */
/* node type: end, intersection, year, material, diameter */
CREATE OR REPLACE FUNCTION distribution.node_type(node_id integer) RETURNS void AS
$BODY$
	DECLARE
		pipeitem    record               ;
		pipe_id     integer              ;
		grouped     record               ;
		Tyear       integer              ;
		Tmaterial   varchar(30)          ;
		Tdiameter   varchar(10)          ;
		looppos     integer          := 0;
		type        varchar(20)          ;
		ori1        double precision := 0;
		ori2        double precision := 0;
		orientation float            := 0;
		node_geom   geometry(Point, 21781);
		intersects  boolean;
	BEGIN
		SELECT
			COUNT(pipe.id)          AS count       ,
			bool_or(_schema_view)   AS schema_view ,
			bool_or(status.active)  AS status_active
			INTO grouped
			FROM distribution.pipe
			INNER JOIN distribution.status ON pipe.id_status = status.id
			WHERE (id_node_a = node_id OR id_node_b = node_id);
		IF grouped.count = 0 THEN
			IF node_id IN (SELECT id_node FROM distribution.valve) THEN
				type := 'valve';
			ELSEIF node_id IN (SELECT id_node FROM distribution.installation) THEN
				type := 'installation';
			ELSEIF node_id IN (SELECT id_node FROM distribution.hydrant) THEN
				type := 'hydrant';
			ELSE
				RAISE NOTICE 'Delete node %' , node_id ;
				DELETE FROM distribution.node WHERE id = node_id ;
			END IF;
		ELSEIF grouped.count <= 2 THEN
			/* loop over the 1 or 2 connected pipes */
			FOR pipeitem IN (
				SELECT 	pipe.id, pipe.year, pipe_material._fancyname, pipe_material.diameter,
						ST_PointN(geometry,2)   AS point_1,
						ST_StartPoint(geometry) AS point_2
						FROM distribution.pipe
						INNER JOIN distribution.pipe_material ON pipe.id_material = pipe_material.id
						WHERE id_node_a = node_id
				UNION ALL
				SELECT	pipe.id, pipe.year, pipe_material._fancyname, pipe_material.diameter,
						ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_1,
						ST_EndPoint(geometry)                      AS point_2
						FROM distribution.pipe
						INNER JOIN distribution.pipe_material ON pipe.id_material = pipe_material.id
						WHERE id_node_b = node_id
			) LOOP
				IF looppos=0 THEN
					/* first pipe */
					type := 'one';
					Tyear     := pipeitem.year;
					Tmaterial := pipeitem._fancyname;
					Tdiameter := pipeitem.diameter;
					pipe_id   := pipeitem.id;
					looppos   := 1;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO orientation ;
				ELSE
					/* second pipe if exists */
					type := 'two_same';
					IF Tyear     != pipeitem.year       THEN type := 'two_year'    ; END IF;
					IF Tmaterial != pipeitem._fancyname THEN type := 'two_material'; END IF;
					IF Tdiameter != pipeitem.diameter   THEN type := 'two_diameter'; END IF;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO ori2 ;
					SELECT ATAN2( (SIN(orientation)+SIN(ori2))/2 , (COS(orientation)+COS(ori2))/2 ) INTO orientation;
				END IF;
			END LOOP;
			SELECT degrees(orientation) INTO orientation;
			IF grouped.count = 1 THEN
				/* if the node is only on 1 pipe, check if it intersects another pipe. If yes, hide it */
				SELECT geometry FROM distribution.node WHERE id = node_id INTO node_geom;
				/* st_intersects does not work as expected. */
				SELECT bool_or(ST_DWithin(node_geom, pipe.geometry, 0.0001)) FROM distribution.pipe WHERE id != pipe_id INTO intersects;
				IF intersects IS TRUE THEN
					type := 'one_hidden';
				END IF;
			END IF;
		ELSEIF grouped.count > 2 THEN
			type := 'three';
		END IF;
		UPDATE distribution.node SET
			_type          = type,
			_orientation   = orientation,
			_schema_view   = grouped.schema_view,
			_status_active = grouped.status_active
			WHERE id = node_id;
		/*RAISE NOTICE '% %' , node_id , orientation;*/
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_type(integer) IS 'Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';

/* reset all node type */
CREATE OR REPLACE FUNCTION distribution.node_set_type() RETURNS void AS
$BODY$
	DECLARE
		node record;
	BEGIN
		FOR node IN SELECT id FROM distribution.node ORDER BY id LOOP
			PERFORM distribution.node_type(node.id);
		END LOOP;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_set_type() IS 'Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';



