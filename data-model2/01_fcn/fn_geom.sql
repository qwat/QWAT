

/*                        (table_name, is_node, create_node, create_alt_geom, get_pipe, auto_district, auto_pressurezone)*/
CREATE OR REPLACE FUNCTION qwat.fn_geom_tool_point(table_name varchar, is_node boolean, create_node boolean, create_alt_geom boolean, get_pipe boolean, auto_district boolean, auto_pressurezone boolean) RETURNS void AS
$BODY$
	DECLARE
		sql_trigger varchar;
		match_mode varchar;
	BEGIN
		/* Creates columns */
		IF is_node IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN id_node         integer   ;';
		END IF;
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		IF get_pipe IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN id_pipe         integer   ;';
		END IF;
		IF auto_district IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN _district       varchar(255) default '''' ;';
		END IF;
		IF auto_pressurezone IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN _pressurezone   varchar(255) default '''' ;';
		END IF;		
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN _printmaps      varchar(100) default '''' ;';
		
		/* Enables geometry */
		PERFORM addGeometryColumn('qwat', table_name, 'geometry', 21781, 'POINT', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx ON qwat.'||table_name||' USING GIST ( geometry );';
		IF create_alt_geom IS TRUE THEN
			PERFORM addGeometryColumn('qwat', table_name, 'geometry_alt1', 21781, 'POINT', 2);
			PERFORM addGeometryColumn('qwat', table_name, 'geometry_alt2', 21781, 'POINT', 2);
			EXECUTE 'CREATE INDEX '||table_name||'_geoidx_alt1 ON qwat.'||table_name||' USING GIST ( geometry_alt1 );';
			EXECUTE 'CREATE INDEX '||table_name||'_geoidx_alt2 ON qwat.'||table_name||' USING GIST ( geometry_alt2 );';
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN _geometry_alt1_used boolean;';
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD COLUMN _geometry_alt2_used boolean;';
		END IF;
				
		/* Add constraints and indexes */
		IF is_node IS TRUE THEN
			IF create_node IS TRUE THEN
				match_mode := 'FULL';
			ELSE
				match_mode := 'SIMPLE';
			END IF;
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node         FOREIGN KEY (id_node)         REFERENCES qwat.od_node(id)         MATCH ' || match_mode || ';' ;
		END IF;
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES qwat.od_district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES qwat.od_pressurezone(id) MATCH SIMPLE;';
		IF get_pipe IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pipe FOREIGN KEY (id_pipe) REFERENCES qwat.od_pipe(id) MATCH SIMPLE;';
		END IF;
		IF is_node IS TRUE THEN
			EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node     ON qwat.'||table_name||'(id_node);';
		END IF;
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON qwat.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON qwat.'||table_name||'(id_pressurezone);';
		IF get_pipe IS TRUE THEN
			EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pipe ON qwat.'||table_name||'(id_pipe);';
		END IF;
		
		/* Geometric trigger function */
		sql_trigger := 'CREATE OR REPLACE FUNCTION qwat.ft_'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN';
		IF is_node IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.id_node            := qwat.fn_node_get_id(NEW.geometry,'||create_node||');';
		END IF;
		IF auto_district IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._district          := qwat.fn_get_districts(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.id_district        := qwat.fn_get_district_id(NEW.geometry);';
		IF auto_pressurezone IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._pressurezone      := qwat.fn_get_pressurezone(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.id_pressurezone    := qwat.fn_get_pressurezone_id(NEW.geometry);';
		sql_trigger := sql_trigger || '
						NEW.id_printmap        := qwat.fn_get_printmap_id(NEW.geometry);';
		IF get_pipe IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.id_pipe            := qwat.fn_pipe_get_id(NEW.geometry);';
		END IF;		IF create_alt_geom IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.geometry_alt1       := NEW.geometry;
						NEW.geometry_alt2       := NEW.geometry;
						NEW._geometry_alt1_used := false;
						NEW._geometry_alt2_used := false;';
		END IF;
		sql_trigger := sql_trigger || '
						NEW._printmaps         := qwat.fn_get_printmaps(NEW.geometry);
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		EXECUTE sql_trigger;
		
		/* create triggers */
		EXECUTE 'CREATE TRIGGER tr_'||table_name||'_geom_insert
			BEFORE INSERT ON qwat.'||table_name||'
			FOR EACH ROW
			EXECUTE PROCEDURE qwat.ft_'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER tr_'||table_name||'_geom_insert ON qwat.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after insert.'';';

		EXECUTE 'CREATE TRIGGER tr_'||table_name||'_geom_update
			BEFORE UPDATE OF geometry ON qwat.'||table_name||' 
			FOR EACH ROW
			WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
			EXECUTE PROCEDURE qwat.ft_'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER tr_'||table_name||'_geom_update ON qwat.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after geom update.'';';

		/* detect if alternatve geom is used */
		IF create_alt_geom IS TRUE THEN
			EXECUTE '	
				CREATE OR REPLACE FUNCTION qwat.ft_'||table_name||'_alternative_geom() RETURNS TRIGGER AS
					''
					BEGIN
						NEW._geometry_alt1_used := NEW.geometry_alt1 IS NULL OR ST_AsBinary(NEW.geometry_alt1) <> ST_AsBinary(NEW.geometry);
						NEW._geometry_alt2_used := NEW.geometry_alt2 IS NULL OR ST_AsBinary(NEW.geometry_alt2) <> ST_AsBinary(NEW.geometry);
						RETURN NEW;
					END;
					''
					LANGUAGE ''plpgsql'';		
			';
			EXECUTE 'CREATE TRIGGER tr_'||table_name||'_alternative_geom
				BEFORE UPDATE OF geometry_alt1, geometry_alt2  ON qwat.'||table_name||' 
				FOR EACH ROW
				EXECUTE PROCEDURE qwat.ft_'||table_name||'_alternative_geom();';
			EXECUTE 'COMMENT ON TRIGGER tr_'||table_name||'_alternative_geom ON qwat.'||table_name||' IS ''Trigger: when updating, check if alternative geometries are different to fill the boolean fields.'';';
		END IF;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_geom_tool_point(varchar,boolean,boolean,boolean,boolean,boolean,boolean) IS 'Create geometric columns, constraint and triggers for tables with point on node items. Second argument determines if node has to be created or not if not found.  (table_name, is_node, create_node, create_alt_geom, get_pipe, auto_district, auto_pressurezone)';

