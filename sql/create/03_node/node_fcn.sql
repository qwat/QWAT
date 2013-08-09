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
CREATE OR REPLACE FUNCTION distribution.node_type(integer) RETURNS void AS
$BODY$
	DECLARE
		node_id     ALIAS FOR $1         ;
		pipeitem    RECORD               ;
		grouped     RECORD               ;
		Tyear       INTEGER              ;
		Tmaterial   VARCHAR(30)          ;
		Tdiameter   VARCHAR(10)          ;
		i           INTEGER          := 0;
		type        VARCHAR(20)          ;
		ori1        DOUBLE PRECISION := 0;
		ori2        DOUBLE PRECISION := 0;
		orientation FLOAT            := 0;
	BEGIN
		SELECT 
			COUNT(pipe_view.id)               AS count         ,
			bool_or(pipe_view._schema_view)   AS schema_view   ,
			bool_or(pipe_view._status_active) AS status_active
			INTO grouped 
			FROM distribution.pipe_view 
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
		ELSEIF grouped.count = 1 THEN
			type := 'one';
		ELSEIF grouped.count = 2 THEN
			FOR pipeitem IN (
				SELECT year,_material_longname,_material_diameter,ST_PointN(geometry,2)                      AS point_1 , ST_StartPoint(geometry) AS point_2 FROM distribution.pipe_view WHERE id_node_a = node_id
				UNION ALL
				SELECT year,_material_longname,_material_diameter,ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_1 , ST_EndPoint(  geometry) AS point_2 FROM distribution.pipe_view WHERE id_node_b = node_id
			) LOOP
				IF i=0 THEN
					Tyear     := pipeitem.year;
					Tmaterial := pipeitem._material_longname;
					Tdiameter := pipeitem._material_diameter;
					i := 1;
					SELECT  ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO ori1 ;
				ELSE
					type := 'two_same';
					IF Tyear     != pipeitem.year               THEN type := 'two_year'    ; END IF;
					IF Tmaterial != pipeitem._material_longname THEN type := 'two_material'; END IF;
					IF Tdiameter != pipeitem._material_diameter THEN type := 'two_diameter'; END IF;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO ori2 ;
					SELECT degrees( ATAN2( (SIN(ori1)+SIN(ori2))/2 , (COS(ori1)+COS(ori2))/2 ) ) INTO orientation;
				END IF;
			END LOOP;
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

  

