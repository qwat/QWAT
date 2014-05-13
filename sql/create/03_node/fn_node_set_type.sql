/*
	qWat - QGIS Water Module

	SQL file :: node functions
*/


/* define node type */
/* node type: end, intersection, year, material, diameter */
CREATE OR REPLACE FUNCTION distribution.fn_node_set_type(node_id integer) RETURNS void AS
$BODY$
	DECLARE
		pipeitem        record                   ;
		pipe_id         integer                  ;
		grouped         record                   ;
		Tyear           integer                  ;
		Tmaterial       varchar(50)              ;
		Tdiameter       smallint                 ;
		looppos         integer          := 0    ;
		type            varchar(25)              ;
		ori1            double precision := 0    ;
		ori2            double precision := 0    ;
		orientation     float            := 0    ;
		is_under_object boolean          := false;
		is_under_count  integer          := 0    ;
		node_geom       geometry(Point, 21781)   ;
		intersects      boolean                  ;
		node_table      record                   ;
		stmt            text                     ;
		keep_type       boolean          := false;
		complement_col  varchar(50)      := ''   ;
	BEGIN
		/* determine if the node is under an object (hydrant, valve, etc.) */
		FOR node_table IN SELECT * FROM distribution.od_node_table
		LOOP
			stmt := 'SELECT COUNT(id) FROM distribution.' || node_table.table_name || ' WHERE id_node='|| node_id || ';';
			EXECUTE stmt INTO is_under_count;
			IF is_under_count > 0 THEN
				type := node_table.node_type;
				IF node_table.complement_column IS NOT NULL THEN
					stmt := 'SELECT ' || node_table.complement_column || ' FROM distribution.' || node_table.table_name || ' WHERE id_node=' || node_id || ' LIMIT 1';
					EXECUTE stmt into complement_col;
					type := type || '_' || complement_col;
				END IF;
				is_under_object := true;
				IF node_table.overwrite IS true THEN
					keep_type := true;
					EXIT;
				END IF;
			END IF;
		END LOOP;
		/* count the active pipes associated to this node */
		SELECT
			COUNT(od_pipe.id)         AS count         ,
			bool_or(_schema_visible)  AS schema_visible,
			bool_or(vl_status.active) AS status_active
			INTO grouped
			FROM distribution.od_pipe
			INNER JOIN distribution.vl_status ON od_pipe.id_status = vl_status.id
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
				SELECT 	od_pipe.id, od_pipe.year, vl_pipe_material.value_fr AS material, vl_pipe_material.diameter_nominal AS diameter,
						ST_StartPoint(geometry) AS point_1,
						ST_PointN(geometry,2)   AS point_2
						FROM distribution.od_pipe
						INNER JOIN distribution.vl_pipe_material ON od_pipe.id_material = vl_pipe_material.id
						INNER JOIN distribution.vl_status        ON od_pipe.id_status = vl_status.id
						WHERE id_node_a = node_id AND vl_status.active IS TRUE
				UNION ALL
				SELECT	od_pipe.id, od_pipe.year, vl_pipe_material.value_fr AS material, vl_pipe_material.diameter_nominal AS diameter,
						ST_EndPoint(geometry)                      AS point_1,
						ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_2
						FROM distribution.od_pipe
						INNER JOIN distribution.vl_pipe_material ON od_pipe.id_material = vl_pipe_material.id
						INNER JOIN distribution.vl_status        ON od_pipe.id_status = vl_status.id
						WHERE id_node_b = node_id AND vl_status.active IS TRUE
			) LOOP
				IF looppos=0 THEN
					/* first pipe */
					IF keep_type IS FALSE THEN
						type := 'one';
					END IF;
					Tyear     := pipeitem.year;
					Tmaterial := pipeitem.material;
					Tdiameter := pipeitem.diameter;
					pipe_id   := pipeitem.id;
					looppos   := 1;
					ori1 := 3*pi()/2-ST_Azimuth(pipeitem.point_1,pipeitem.point_2) ; /* this line must be shifted by 180 */
				ELSE
					/* second pipe if exists */
					IF keep_type IS FALSE THEN
						type := 'two_same';
						IF Tyear     != pipeitem.year     THEN type := 'two_year'    ; END IF;
						IF Tmaterial != pipeitem.material THEN type := 'two_material'; END IF;
						IF Tdiameter != pipeitem.diameter THEN type := 'two_diameter'; END IF;
					END IF;
					ori2 := pi()/2 - ST_Azimuth(pipeitem.point_1,pipeitem.point_2) ;
					orientation := -pi()/2 + ATAN2( (COS(ori1)+COS(ori2))/2 , (SIN(ori1)+SIN(ori2))/2 ) ;
					/* reverse arrow according to diameter reduction */
					IF type = 'two_diameter' AND pipeitem.diameter > Tdiameter THEN
						orientation := orientation + pi();
					END IF;
				END IF;
			END LOOP;
			IF keep_type IS FALSE AND grouped.count = 1 THEN
				/* if the node is only on 1 pipe, check if it intersects another pipe. If yes, hide it */
				node_geom := geometry FROM distribution.od_node WHERE id = node_id;
				/* st_intersects does not work as expected. */
				intersects := bool_or(ST_DWithin(node_geom, od_pipe.geometry, 0.0001)) FROM distribution.od_pipe WHERE id != pipe_id;
				IF intersects IS TRUE THEN
					type := 'one_hidden';
				END IF;
			END IF;
		/* more than 2 pipes connected, nothing to calculate */
		ELSEIF keep_type IS FALSE AND grouped.count > 2 THEN
			type := 'three';
		END IF;
		/* update the node table */
		UPDATE distribution.od_node SET
			_type           = type,
			_orientation    = degrees*(orientation),
			_schema_visible = grouped.schema_visible,
			_status_active  = grouped.status_active,
			_under_object   = is_under_object
			WHERE id = node_id;
		/*RAISE NOTICE '% %' , node_id , orientation;*/
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_node_set_type(integer) IS 'Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';

/* reset all node type */
CREATE OR REPLACE FUNCTION distribution.fn_node_set_type_all() RETURNS void AS
$BODY$
	DECLARE
		node record;
	BEGIN
		FOR node IN SELECT id FROM distribution.od_node ORDER BY id LOOP
			PERFORM distribution.fn_node_set_type(node.id);
		END LOOP;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_node_set_type_all() IS 'Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';



