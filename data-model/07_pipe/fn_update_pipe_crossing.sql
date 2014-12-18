CREATE OR REPLACE FUNCTION qwat.fn_update_pipe_crossing(update_existing boolean, delete_unused boolean)
  RETURNS void AS
$BODY$
	DECLARE
		crossing record;
		pipe1 record;
		pipe2 record;
		crossing_id integer;
		updated_crossing integer[] := ARRAY[]::integer[];
		inserted_crossing_count integer := 0;
		updated_crossing_count integer := 0;
		deleted_crossing_count integer := 0;
	BEGIN
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* compute all crossing points */ 
		FOR crossing IN
			SELECT pipe1_id, pipe2_id,
				pipe1_geometry, pipe2_geometry,
				(dp).geom AS cross_geometry 
			FROM 
			(
				/* dump mulitpoints to points */
				SELECT pipe1_id, pipe2_id,
					pipe1_geometry, pipe2_geometry,
					ST_DumpPoints(cross_geometry) AS dp FROM 
				(
					/* compute the crossing points only for active pipes and different ids */
					SELECT p1.id AS pipe1_id,
						p2.id AS pipe2_id,
						p1.geometry AS pipe1_geometry,
						p2.geometry AS pipe2_geometry,
						ST_Intersection(p1.geometry,p2.geometry) AS cross_geometry 
					FROM qwat.od_pipe p1, qwat.od_pipe p2 
					WHERE p1.id < p2.id 
					AND p1.id_status = 1301 
					AND p2.id_status = 1301
					AND ST_Crosses(p1.geometry,p2.geometry)
				) AS foo
			 ) AS foo2
		LOOP
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* SKIP INTERSECTION AT ENDS OF PIPE (occurs if the two pipes cross at another point) */
			IF crossing.cross_geometry IN (ST_StartPoint(crossing.pipe1_geometry), ST_EndPoint(crossing.pipe1_geometry),
						ST_StartPoint(crossing.pipe2_geometry), ST_EndPoint(crossing.pipe2_geometry)) THEN
				CONTINUE;
			END IF;
			/* !!!! PIPE 1 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth 
				FROM qwat.od_pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE od_pipe.id = crossing.pipe1_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth 
				WHERE pt_locat < ST_LineLocatePoint( crossing.pipe1_geometry, crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO pipe1
			FROM azimuth
			JOIN pt_locat USING (pt_locat);		

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 2 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth 
				FROM qwat.od_pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE od_pipe.id = crossing.pipe2_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( crossing.pipe2_geometry, crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO pipe2
			FROM azimuth
			JOIN pt_locat USING (pt_locat);
			
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* ERROR REPORTING */
			IF pipe1.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', crossing.pipe1_id;
				RAISE NOTICE 'LINE: %', ST_AsText(crossing.pipe1_geometry);
			END IF;
			IF pipe2.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', crossing.pipe2_id;
				RAISE NOTICE 'LINE: %', ST_AsText(crossing.pipe2_geometry);
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* UPDATE OR INSERT NEW CROSSING */
			SELECT id FROM qwat.od_crossing WHERE ST_DWithin(crossing.cross_geometry,geometry,0.0) IS TRUE LIMIT 1 INTO crossing_id;
			IF crossing_id IS NULL THEN
				INSERT INTO qwat.od_crossing 
						(_pipe1_id,_pipe2_id,_pipe1_angle,_pipe2_angle,geometry) 
					VALUES
						(crossing.pipe1_id,crossing.pipe2_id,pipe1.azimuth,pipe2.azimuth,crossing.cross_geometry)
					RETURNING id INTO crossing_id;
				inserted_crossing_count := inserted_crossing_count + 1;
			ELSIF update_existing IS TRUE THEN
				UPDATE qwat.od_crossing 
				SET 
					_pipe1_id = crossing.pipe1_id,
					_pipe1_angle = pipe1.azimuth,
					_pipe2_id = crossing.pipe2_id,
					_pipe2_angle = pipe2.azimuth,
					geometry = crossing.cross_geometry
				WHERE od_crossing.id = crossing_id;
				updated_crossing_count := updated_crossing_count + 1;
			END IF;
			updated_crossing := array_append(updated_crossing, crossing_id);
		END LOOP;
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* DELETE OLD CROSSINGS */
		IF delete_unused IS TRUE THEN
			DELETE FROM qwat.od_crossing WHERE NOT ( id = ANY(updated_crossing) );
			GET DIAGNOSTICS deleted_crossing_count = ROW_COUNT;
		END IF;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
		RAISE NOTICE 'Added % new crossing.', inserted_crossing_count;
		RAISE NOTICE 'Updated % existing crossing.', updated_crossing_count;
		RAISE NOTICE 'Deleted % unused crossing.', deleted_crossing_count;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
	END;
$BODY$
  LANGUAGE plpgsql;
