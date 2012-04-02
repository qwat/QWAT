/*
	qWat - QGIS Water Module
	
	SQL file :: nodes
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.nodes CASCADE;
CREATE TABLE distribution.nodes (id serial NOT NULL);
ALTER TABLE distribution.nodes ADD COLUMN  type    varchar(20) DEFAULT 'end';
ALTER TABLE distribution.nodes ADD COLUMN  orientation float DEFAULT 0;
SELECT AddGeometryColumn('distribution', 'nodes', 'wkb_geometry', 21781, 'POINT', 2);
SELECT setval('distribution.nodes_id_seq', 100, true);
/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.nodes ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);
/* GIST index*/
CREATE INDEX nodes_geoidx ON distribution.nodes USING GIST ( wkb_geometry );
/* Comment */
COMMENT ON TABLE distribution.nodes IS 'Nodes. Type:If three pipes or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipes: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipes arrives to place the symbol in theright direction.';

/* node type: end, intersection, year, material, diameter */


CREATE OR REPLACE FUNCTION distribution.get_node(geometry) RETURNS integer AS '
	DECLARE
		point ALIAS for $1;
		node_id integer;
		distance_threshold double precision := 0.000001;
	BEGIN
		SELECT id FROM distribution.nodes WHERE ST_Distance(point,wkb_geometry)<distance_threshold LIMIT 1 INTO node_id;
		IF node_id IS NULL THEN
			INSERT INTO distribution.nodes (type,wkb_geometry) VALUES ('''',point);
		END IF;
		SELECT id FROM distribution.nodes WHERE ST_Distance(point,wkb_geometry)<distance_threshold LIMIT 1 INTO node_id;
		RETURN node_id;	
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.get_node(geometry) IS 'Returns the node for a given geometry (point). If node does not exist, it is created.';

CREATE OR REPLACE FUNCTION distribution.set_nodes() RETURNS void AS '
	DECLARE
		node record;
		pipeitem record;
		npipe integer;
		Tyear integer;
		Tmaterial varchar(30);
		Tdiameter varchar(10);
		i integer := 0;
		type VARCHAR(20);
	BEGIN
		FOR node IN SELECT id FROM distribution.nodes ORDER BY id LOOP
		type := NULL;
			SELECT COUNT(id) INTO npipe FROM distribution.pipes_view WHERE id_node_a = node.id OR id_node_b = node.id;
			IF npipe = 1 THEN
				type := ''one'';
			ELSEIF npipe = 2 THEN
				FOR pipeitem IN SELECT year,_material_longname,_material_diameter FROM distribution.pipes_view WHERE id_node_a = node.id OR id_node_b = node.id LOOP
					IF i=0 THEN
						Tyear     := pipeitem.year;
						Tmaterial := pipeitem._material_longname;
						Tdiameter := pipeitem._material_diameter;
						i := 1;
					ELSE
						type := ''two_same'';
						IF Tyear     != pipeitem.year               THEN type := ''two_year''    ; END IF;
						IF Tmaterial != pipeitem._material_longname THEN type := ''two_material''; END IF;
						IF Tdiameter != pipeitem._material_diameter THEN type := ''two_diameter''; END IF;
					END IF;
				END LOOP;
			ELSE
				type := ''three'';
			END IF;
			RAISE NOTICE ''%'' , node.id;
			RAISE NOTICE ''%'' , npipe;
			RAISE NOTICE ''%'' , type;
		END LOOP;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.set_nodes() IS 'Set the type for all nodes. If three pipes arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipes: year (is different), material (and year), diameter(and material/year)';
         
COMMIT;

