/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.node CASCADE;
CREATE TABLE distribution.node (id serial NOT NULL);
SELECT setval('distribution.node_id_seq', 40000, true);
COMMENT ON TABLE distribution.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE distribution.node ADD COLUMN  altitude_dtm       DECIMAL(10,3)              ;
ALTER TABLE distribution.node ADD COLUMN  altitude_real      DECIMAL(10,3)              ;
ALTER TABLE distribution.node ADD COLUMN  _type              VARCHAR(20)   DEFAULT NULL ;
ALTER TABLE distribution.node ADD COLUMN  _orientation       FLOAT         DEFAULT 0    ;
ALTER TABLE distribution.node ADD COLUMN  _schema_view       BOOLEAN       DEFAULT False;
ALTER TABLE distribution.node ADD COLUMN  _status_active     BOOLEAN       DEFAULT False;

/* geometry */
SELECT AddGeometryColumn('distribution', 'node', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX node_geoidx ON distribution.node USING GIST ( geometry );

/* constraints */
ALTER TABLE distribution.node ADD CONSTRAINT node_pkey PRIMARY KEY (id);


/*----------------!!!---!!!----------------*/
/* Trigger for geometry (=> altitude) */
CREATE OR REPLACE FUNCTION distribution.node_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.node SET
			altitude_dtm = NULL
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_geom() IS 'Fcn/Trigger: set uptodate to false for altitude when geometry changes.';

CREATE TRIGGER node_geom_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.node
		FOR EACH ROW
		EXECUTE PROCEDURE distribution.node_geom();
COMMENT ON TRIGGER node_geom_trigger ON distribution.node IS 'Trigger: uset uptodate to false for altitude when geometry changes.';

/* set node altitude */
CREATE OR REPLACE FUNCTION distribution.node_altitude() RETURNS void AS '
	BEGIN
		UPDATE distribution.node SET altitude_dtm = altitude.altitude(geometry) WHERE altitude_dtm IS NULL ;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_altitude() IS 'Fill the altitude of the node.';


/* get node id */
CREATE OR REPLACE FUNCTION distribution.node_get_id(geometry,boolean) RETURNS integer AS '
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
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_get_id(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';

/* define node type */
/* node type: end, intersection, year, material, diameter */
CREATE OR REPLACE FUNCTION distribution.node_type(integer) RETURNS void AS '
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
			RAISE NOTICE ''Delete node %'' , node_id ;
			DELETE FROM distribution.node WHERE id = node_id ;
		ELSEIF grouped.count = 1 THEN
			type := ''one'';
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
					type := ''two_same'';
					IF Tyear     != pipeitem.year               THEN type := ''two_year''    ; END IF;
					IF Tmaterial != pipeitem._material_longname THEN type := ''two_material''; END IF;
					IF Tdiameter != pipeitem._material_diameter THEN type := ''two_diameter''; END IF;
					SELECT ST_Azimuth(pipeitem.point_1,pipeitem.point_2) INTO ori2 ;
					SELECT degrees( ATAN2( (SIN(ori1)+SIN(ori2))/2 , (COS(ori1)+COS(ori2))/2 ) ) INTO orientation;
				END IF;
			END LOOP;
		ELSEIF grouped.count > 2 THEN
			type := ''three'';
		END IF;
		UPDATE distribution.node SET 
			_type          = type,
			_orientation   = orientation,
			_schema_view   = grouped.schema_view,
			_status_active = grouped.status_active
			WHERE id = node_id;
		/*RAISE NOTICE ''% %'' , node_id , orientation;*/
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_type(integer) IS 'Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';

/* reset all node type */
CREATE OR REPLACE FUNCTION distribution.node_set_type() RETURNS void AS '
	DECLARE
		node record;
	BEGIN
		FOR node IN SELECT id FROM distribution.node ORDER BY id LOOP
			PERFORM distribution.node_type(node.id);
		END LOOP;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_set_type() IS 'Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';

  
COMMIT;

