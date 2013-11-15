/*
	qWat - QGIS Water Module

	SQL file :: node functions
*/

/* get node id */
CREATE OR REPLACE FUNCTION distribution.od_node_get_id(point geometry, place_node boolean) RETURNS integer AS
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
COMMENT ON FUNCTION distribution.od_node_get_id(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';


/* define node type */
/* node type: end, intersection, year, material, diameter */
CREATE OR REPLACE FUNCTION distribution.od_node_type(node_id integer) RETURNS void AS
$BODY$
	DECLARE
		pipeitem        record                   ;
		pipe_id         integer                  ;
		grouped         record                   ;
		Tyear           integer                  ;
		Tmaterial       varchar(30)              ;
		Tdiameter       varchar(10)              ;
		looppos         integer          := 0    ;
		type            varchar(20)              ;
		ori1            double precision := 0    ;
		ori2            double precision := 0    ;
		orientation     float            := 0    ;
		is_under_object boolean          := false;
		node_geom       geometry(Point, 21781)   ;
		intersects      boolean                  ;
	BEGIN
		/* determine if the node is under an object (hydrant, valve, etc.) */
		IF node_id IN (SELECT id_node FROM distribution.od_valve) THEN
			type := 'valve';
			is_under_object := true;
		ELSEIF node_id IN (
				SELECT id_node FROM distribution.od_installation_pressurecontrol UNION
				SELECT id_node FROM distribution.od_installation_pump UNION
				SELECT id_node FROM distribution.od_installation_source UNION
				SELECT id_node FROM distribution.od_installation_tank UNION
				SELECT id_node FROM distribution.od_installation_treatment UNION
				SELECT id_node FROM distribution.od_installation_valvechamber
				) THEN
			type := 'installation';
			is_under_object := true;
		ELSEIF node_id IN (SELECT id_node FROM distribution.od_wateringoutput) THEN
			type := 'wateringoutput';
			is_under_object := true;
		ELSEIF node_id IN (SELECT id_node FROM distribution.od_hydrant) THEN
			type := 'hydrant';
			is_under_object := true;
		END IF;
		/* count the active pipes associated to this node */
		SELECT
			COUNT(pipe.id)         AS count        ,
			bool_or(_schema_visible)  AS schema_visible  ,
			bool_or(vl_status.active) AS status_active
			INTO grouped
			FROM distribution.od_pipe
			INNER JOIN distribution.vl_status ON pipe.id_status = vl_status.id
			WHERE (id_node_a = node_id OR id_node_b = node_id)
			AND vl_status.active IS TRUE;
		/* if not connected, deleted if not under_object */
		IF grouped.count = 0 AND is_under_object IS false THEN
			/* check it is not associated to inactive pipes */
			IF node_id NOT IN (SELECT id_node_a FROM distribution.od_pipe UNION SELECT id_node_b FROM distribution.od_pipe) THEN
				RAISE NOTICE 'Delete node %' , node_id ;
				DELETE FROM distribution.od_node WHERE id = node_id ;
			END IF;
		/* if 1 or 2 pipes associated */
		ELSEIF grouped.count <= 2 THEN
			/* loop over them, and take the 2 first/last points of the pipe to determine orientation */
			FOR pipeitem IN (
				SELECT 	pipe.id, pipe.year, vl_pipe_material._displayname_fr, vl_pipe_material.diameter,
						ST_PointN(geometry,2)   AS point_1,
						ST_StartPoint(geometry) AS point_2
						FROM distribution.od_pipe
						INNER JOIN distribution.vl_pipe_material ON pipe.id_material = vl_pipe_material.id
						INNER JOIN distribution.vl_status ON pipe.id_status = vl_status.id
						WHERE id_node_a = node_id AND vl_status.active IS TRUE
				UNION ALL
				SELECT	pipe.id, pipe.year, vl_pipe_material._displayname_fr, vl_pipe_material.diameter,
						ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_1,
						ST_EndPoint(geometry)                      AS point_2
						FROM distribution.od_pipe
						INNER JOIN distribution.vl_pipe_material ON pipe.id_material = vl_pipe_material.id
						INNER JOIN distribution.vl_status ON pipe.id_status = vl_status.id
						WHERE id_node_b = node_id AND vl_status.active IS TRUE
			) LOOP
				IF looppos=0 THEN
					/* first pipe */
					type := 'one';
					Tyear     := pipeitem.year;
					Tmaterial := pipeitem._displayname_fr;
					Tdiameter := pipeitem.diameter;
					pipe_id   := pipeitem.id;
					looppos   := 1;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO orientation ;
				ELSE
					/* second pipe if exists */
					type := 'two_same';
					IF Tyear     != pipeitem.year       THEN type := 'two_year'    ; END IF;
					IF Tmaterial != pipeitem._displayname_fr THEN type := 'two_material'; END IF;
					IF Tdiameter != pipeitem.diameter   THEN type := 'two_diameter'; END IF;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO ori2 ;
					SELECT ATAN2( (SIN(orientation)+SIN(ori2))/2 , (COS(orientation)+COS(ori2))/2 ) INTO orientation;
				END IF;
			END LOOP;
			SELECT degrees(orientation) INTO orientation;
			IF grouped.count = 1 THEN
				/* if the node is only on 1 pipe, check if it intersects another pipe. If yes, hide it */
				SELECT geometry FROM distribution.od_node WHERE id = node_id INTO node_geom;
				/* st_intersects does not work as expected. */
				SELECT bool_or(ST_DWithin(node_geom, pipe.geometry, 0.0001)) FROM distribution.od_pipe WHERE id != pipe_id INTO intersects;
				IF intersects IS TRUE THEN
					type := 'one_hidden';
				END IF;
			END IF;
		/* more than 2 pipes connected, nothing to calculate */
		ELSEIF grouped.count > 2 THEN
			type := 'three';
		END IF;
		/* update the node table */
		UPDATE distribution.od_node SET
			_type          = type,
			_orientation   = orientation,
			_schema_visible   = grouped.schema_visible,
			_status_active = grouped.status_active,
			_under_object  = is_under_object
			WHERE id = node_id;
		/*RAISE NOTICE '% %' , node_id , orientation;*/
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_node_type(integer) IS 'Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';

/* reset all node type */
CREATE OR REPLACE FUNCTION distribution.od_node_set_type() RETURNS void AS
$BODY$
	DECLARE
		node record;
	BEGIN
		FOR node IN SELECT id FROM distribution.od_node ORDER BY id LOOP
			PERFORM distribution.od_node_type(node.id);
		END LOOP;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_node_set_type() IS 'Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';



