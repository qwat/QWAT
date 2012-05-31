/*
	qWat - QGIS Water Module
	
	SQL file :: pipes table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.pipes CASCADE;
CREATE TABLE distribution.pipes (id serial NOT NULL);
COMMENT ON TABLE distribution.pipes IS 'Table for pipes. This should not be used for editing/viewing, as a more complete view (pipes_view) exists.';
SELECT setval('distribution.pipes_id_seq', 35000, true);

/* columns */
ALTER TABLE distribution.pipes ADD COLUMN   id_parent integer;                                      /* id_parent         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_function integer;									/* id_function       FK */ 
ALTER TABLE distribution.pipes ADD COLUMN   id_install_method integer;                              /* id_install_method FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_material integer;                                    /* id_material       FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_owner integer;										/* id_owner          FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_precision integer;                                   /* id_precision      FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_protection integer;                                  /* id_protection     FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_status integer;                                      /* id_status         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_node_a integer;			          					/* id_node_a         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_node_b integer;			          					/* id_node_b         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_pressure_zone integer;								/* id_pressure_zone  FK */
ALTER TABLE distribution.pipes ADD COLUMN   schema_force_view  boolean DEFAULT NULL::boolean;       /* schema_force_view FK */
ALTER TABLE distribution.pipes ADD COLUMN   year smallint CHECK (year > 1800 AND year < 2100);      /* year                 */
ALTER TABLE distribution.pipes ADD COLUMN   tunnel_or_bridge boolean DEFAULT false;                 /* tunnel_or_bridge     */
ALTER TABLE distribution.pipes ADD COLUMN   pressure_nominale smallint;                             /* pressure_nominale    */
ALTER TABLE distribution.pipes ADD COLUMN   folder varchar(20) DEFAULT '';                          /* folder               */
ALTER TABLE distribution.pipes ADD COLUMN   remarks text;                                           /* remarks              */
ALTER TABLE distribution.pipes ADD COLUMN   _length2d decimal(8,2);                                 /* _length2d            */
ALTER TABLE distribution.pipes ADD COLUMN   _length3d decimal(8,2);                                 /* _length3d            */
ALTER TABLE distribution.pipes ADD COLUMN   _length3d_uptodate boolean DEFAULT False;               /* _length3d_uptodate   */
ALTER TABLE distribution.pipes ADD COLUMN   _is_on_map varchar(80) DEFAULT '';                      /* _is_on_map           */
ALTER TABLE distribution.pipes ADD COLUMN   _is_on_district varchar(100) DEFAULT '';                /* _is_on_district      */

/* geometry */
SELECT addGeometryColumn('distribution', 'pipes', 'geometry', 21781, 'LINESTRING', 2);
SELECT addGeometryColumn('distribution', 'pipes', 'geometry_alternative', 21781, 'LINESTRING', 2);
CREATE INDEX pipes_geoidx     ON distribution.pipes USING GIST ( geometry );
CREATE INDEX pipes_geoidx_alt ON distribution.pipes USING GIST ( geometry_alternative );

/* old columns */
ALTER TABLE distribution.pipes ADD COLUMN   coating_internal_material_id character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_external_material_id character(20);

/* Constraints */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_parent         FOREIGN KEY (id_parent)         REFERENCES distribution.pipes (id)               MATCH SIMPLE ; CREATE INDEX fki_pipes_id_parent         ON distribution.pipes(id_parent);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_function       FOREIGN KEY (id_function)       REFERENCES distribution.pipes_function(id)       MATCH FULL   ; CREATE INDEX fki_pipes_id_function       ON distribution.pipes(id_function);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_install_method FOREIGN KEY (id_install_method) REFERENCES distribution.pipes_install_method(id) MATCH FULL   ; CREATE INDEX fki_pipes_id_install_method ON distribution.pipes(id_install_method);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_material       FOREIGN KEY (id_material)       REFERENCES distribution.pipes_material(id)       MATCH FULL   ; CREATE INDEX fki_pipes_id_material       ON distribution.pipes(id_material);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_owner          FOREIGN KEY (id_owner)          REFERENCES distribution.owner(id)                MATCH SIMPLE ; CREATE INDEX fki_pipes_id_owner          ON distribution.pipes(id_owner);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_precision      FOREIGN KEY (id_precision)      REFERENCES distribution."precision"(id)          MATCH FULL   ; CREATE INDEX fki_pipes_id_precision      ON distribution.pipes(id_precision);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_protection     FOREIGN KEY (id_protection)     REFERENCES distribution.pipes_protection(id)     MATCH SIMPLE ; CREATE INDEX fki_pipes_id_protection     ON distribution.pipes(id_protection);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_status         FOREIGN KEY (id_status)         REFERENCES distribution.pipes_status(id)         MATCH FULL   ; CREATE INDEX fki_pipes_id_status         ON distribution.pipes(id_status);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_pressure_zone  FOREIGN KEY (id_pressure_zone)  REFERENCES distribution.pressure_zones(id)       MATCH SIMPLE ; CREATE INDEX fki_pipes_id_pressure_zone  ON distribution.pipes(id_pressure_zone);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_node_a         FOREIGN KEY (id_node_a)         REFERENCES distribution.nodes(id)                MATCH SIMPLE ; CREATE INDEX fki_pipes_id_node_a         ON distribution.pipes(id_node_a);
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_node_b         FOREIGN KEY (id_node_b)         REFERENCES distribution.nodes(id)                MATCH SIMPLE ; CREATE INDEX fki_pipes_id_node_b         ON distribution.pipes(id_node_b);


/*----------------!!!---!!!----------------*/
/* Trigger for 2d length, map and district update */
CREATE OR REPLACE FUNCTION distribution.pipes_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipes SET
			id_node_a            = distribution.node_get_id(ST_StartPoint(NEW.geometry),true),
			id_node_b            = distribution.node_get_id(ST_EndPoint(  NEW.geometry),true),
			_length2d            = ST_Length(NEW.geometry),
			_length3d_uptodate   = False,
			_is_on_map           = distribution.get_map(NEW.geometry),
			_is_on_district      = distribution.get_district(NEW.geometry),
			geometry_alternative = NEW.geometry
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_geom() IS 'Fcn/Trigger: updates the length and other fields of the pipe after insert/update.';

CREATE TRIGGER pipes_geom_trigger_insert
	AFTER INSERT ON distribution.pipes
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipes_geom();
COMMENT ON TRIGGER pipes_geom_trigger_insert ON distribution.pipes IS 'Trigger: updates auto fields of the pipe after insert.';

CREATE TRIGGER pipes_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.pipes 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.pipes_geom();
COMMENT ON TRIGGER pipes_geom_trigger_update ON distribution.pipes IS 'Trigger: updates auto fields of the pipe after update.';

/*----------------!!!---!!!----------------*/
/* Trigger for tunnel_or_bridge */
CREATE OR REPLACE FUNCTION distribution.pipes_tunnelbridge() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipes SET _length3d_uptodate = FALSE WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER pipes_tunnelbridge_trigger
	AFTER UPDATE OF tunnel_or_bridge ON distribution.pipes
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipes_tunnelbridge();
COMMENT ON TRIGGER pipes_tunnelbridge_trigger ON distribution.pipes IS 'As for tunnel and bridges, 3d length is the 2d length, set _length3d_uptodate to false to reset it later.';

/*----------------!!!---!!!----------------*/
/* 3D Length */
CREATE OR REPLACE FUNCTION distribution.pipes_length3d() RETURNS void AS '
	DECLARE
		length double precision;
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,geometry,tunnel_or_bridge FROM distribution.pipes WHERE _length3d_uptodate IS NOT TRUE ORDER BY id LOOP
			IF pipeitem.tunnel_or_bridge IS TRUE THEN
				length := pipeitem._length2d;
			ELSE
				RAISE NOTICE ''%'', pipeitem.id;
				SELECT altitude.length3d(pipeitem.geometry) INTO length;
			END IF;
			UPDATE distribution.pipes SET _length3d = length, _length3d_uptodate = TRUE WHERE id = pipeitem.id;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_length3d() IS 'Fill the 3d length of the pipes.';

/*----------------!!!---!!!----------------*/
/* get pipe id */
CREATE OR REPLACE FUNCTION distribution.pipe_get_id(geometry) RETURNS integer AS '
	DECLARE
		point ALIAS for $1;
		pipe_id integer;
		distance_threshold double precision := 0.000001;
		number_of_pipes integer;
	BEGIN
		SELECT COUNT(id) FROM distribution.pipes WHERE ST_DWithin(point,geometry,distance_threshold) INTO number_of_pipes;
		IF number_of_pipes != 1 THEN
			RETURN NULL ;
		ELSE 
			SELECT id FROM distribution.pipes WHERE ST_DWithin(point,geometry,distance_threshold) INTO pipe_id ;
			RETURN pipe_id;	
		END IF;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_get_id(geometry) IS 'Returns the pipe at a given position. If several pipes, return NULL.';

COMMIT;
