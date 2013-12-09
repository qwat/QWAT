

/*                        (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
CREATE OR REPLACE FUNCTION distribution.fn_geom_tool_point(table_name varchar, is_node boolean, create_node boolean, create_schematic boolean, get_pipe boolean, auto_district boolean, auto_pressurezone boolean) RETURNS void AS
$BODY$
	DECLARE
		sql_trigger varchar;
	BEGIN
		/* Creates columns */
		IF is_node IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node         integer   ;';
		END IF;
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		IF get_pipe IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pipe         integer   ;';
		END IF;
		IF auto_district IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _district       varchar(255) default '''' ;';
		END IF;
		IF auto_pressurezone IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _pressurezone   varchar(255) default '''' ;';
		END IF;		
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _printmaps      varchar(100) default '''' ;';
		
		/* Enables geometry */
		PERFORM addGeometryColumn('distribution', table_name, 'geometry', 21781, 'POINT', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx ON distribution.'||table_name||' USING GIST ( geometry );';
		IF create_schematic IS TRUE THEN
			PERFORM addGeometryColumn('distribution', table_name, 'geometry_schematic', 21781, 'POINT', 2);
			EXECUTE 'CREATE INDEX '||table_name||'_geoidx_sch ON distribution.'||table_name||' USING GIST ( geometry_schematic );';
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _geometry_schematic_used boolean;';
		END IF;
				
		/* Add constraints and indexes */
		IF is_node IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node         FOREIGN KEY (id_node)         REFERENCES distribution.od_node(id)         MATCH SIMPLE;';
		END IF;
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.od_district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.od_pressurezone(id) MATCH SIMPLE;';
		IF get_pipe IS TRUE THEN
			EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pipe FOREIGN KEY (id_pipe) REFERENCES distribution.od_pipe(id) MATCH SIMPLE;';
		END IF;
		IF is_node IS TRUE THEN
			EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node     ON distribution.'||table_name||'(id_node);';
		END IF;
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		IF get_pipe IS TRUE THEN
			EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pipe ON distribution.'||table_name||'(id_pipe);';
		END IF;
		
		/* Geometric trigger function */
		sql_trigger := 'CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN';
		IF is_node IS TRUE AND create_node IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.id_node            := distribution.fn_node_get_id(NEW.geometry,'||create_node||');';
		END IF;
		IF auto_district IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._district          := distribution.fn_get_district(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.id_district        := distribution.fn_get_district_id(NEW.geometry);';
		IF auto_pressurezone IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._pressurezone      := distribution.fn_get_pressurezone(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.id_pressurezone    := distribution.fn_get_pressurezone_id(NEW.geometry);';
		sql_trigger := sql_trigger || '
						NEW.id_printmap        := distribution.fn_get_printmap_id(NEW.geometry);';
		IF get_pipe IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.id_pipe            := distribution.fn_pipe_get_id(NEW.geometry);';
		END IF;		IF create_schematic IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.geometry_schematic       := NEW.geometry;
						NEW._geometry_schematic_used := false;';
		END IF;
		sql_trigger := sql_trigger || '
						NEW._printmaps        := distribution.fn_get_printmaps(NEW.geometry);
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		EXECUTE sql_trigger;
		
		/* create triggers */
		EXECUTE 'CREATE TRIGGER '||table_name||'_geom_trigger_insert
			AFTER INSERT ON distribution.'||table_name||'
			FOR EACH ROW
			EXECUTE PROCEDURE distribution.'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_trigger_insert ON distribution.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after insert.'';';

		EXECUTE 'CREATE TRIGGER '||table_name||'_geom_trigger_update
			AFTER UPDATE OF geometry ON distribution.'||table_name||' 
			FOR EACH ROW
			WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
			EXECUTE PROCEDURE distribution.'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_trigger_update ON distribution.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after geom update.'';';

		/* detect if schematic is used */
		IF create_schematic IS TRUE THEN
			EXECUTE '	
				CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom_schematic() RETURNS TRIGGER AS
					''
					BEGIN
						UPDATE distribution.'||table_name||' SET 
							_geometry_schematic_used = ST_AsBinary(NEW.geometry_schematic) <> ST_AsBinary(NEW.geometry) 
							WHERE id = NEW.id;
						RETURN NEW;
					END;
					''
					LANGUAGE ''plpgsql'';		
			';
			EXECUTE 'CREATE TRIGGER '||table_name||'_geom_schematic_trigger
				AFTER UPDATE OF geometry_schematic ON distribution.'||table_name||' 
				FOR EACH ROW
				EXECUTE PROCEDURE distribution.'||table_name||'_geom_schematic();';
			EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_schematic_trigger ON distribution.'||table_name||' IS ''Trigger: when updating, check if geometry_schematic is different to fill the boolean field.'';';
		END IF;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_geom_tool_point(varchar,boolean,boolean,boolean,boolean,boolean,boolean) IS 'Create geometric columns, constraint and triggers for tables with point on node items. Second argument determines if node has to be created or not if not found.  (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)';


/* LINES */


CREATE OR REPLACE FUNCTION distribution.fn_geom_tool_line(table_name varchar) RETURNS void AS
$BODY$
	BEGIN
		/* Creates columns */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node_a       integer    not null;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node_b       integer    not null;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _length2d       decimal(8,2) ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _length3d       decimal(8,2) ;';	
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _diff_elevation decimal(8,2) ;';	
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _district       varchar(255) default '''' ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _pressurezone   varchar(100) default '''' ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _printmaps      varchar(100) default '''' ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _geometry_schematic_used boolean;';
		
		/* Enables geometry */
		PERFORM addGeometryColumn('distribution', table_name, 'geometry', 21781, 'LINESTRING', 2);
		PERFORM addGeometryColumn('distribution', table_name, 'geometry_schematic', 21781, 'LINESTRING', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx     ON distribution.'||table_name||' USING GIST ( geometry );';
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx_sch ON distribution.'||table_name||' USING GIST ( geometry_schematic );';		

		/* Add constraints and indexes */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node_a       FOREIGN KEY (id_node_a)       REFERENCES distribution.od_node(id)         MATCH FULL;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node_b       FOREIGN KEY (id_node_b)       REFERENCES distribution.od_node(id)         MATCH FULL;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.od_district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.od_pressurezone(id) MATCH SIMPLE;';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node_a       ON distribution.'||table_name||'(id_node_a);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node_b       ON distribution.'||table_name||'(id_node_b);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		
		/* Geometric trigger function */
		EXECUTE '
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN
					NEW.id_node_a                := distribution.fn_node_get_id(ST_StartPoint(NEW.geometry),true);
					NEW.id_node_b                := distribution.fn_node_get_id(ST_EndPoint(  NEW.geometry),true);
					NEW.id_district              := distribution.fn_get_district_id(NEW.geometry)                ;
					NEW.id_pressurezone          := distribution.fn_get_pressurezone_id(NEW.geometry)            ;
					NEW.id_printmap              := distribution.fn_get_printmap_id(NEW.geometry)                ;
					NEW.geometry_schematic       := NEW.geometry                                                 ;
					NEW._geometry_schematic_used := false                                                        ;
					NEW._district                := distribution.fn_get_districts(NEW.geometry)                  ;
					NEW._pressurezone            := distribution.fn_get_pressurezone(NEW.geometry)               ;
					NEW._printmaps               := distribution.fn_get_printmaps(NEW.geometry)                  ;
					NEW._length2d                := ST_Length(NEW.geometry)                                      ;
					NEW._length3d                := NULL                                                         ;
					NEW._diff_elevation          := NULL                                                         ;
					
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		
		/* create triggers */
		EXECUTE 'CREATE TRIGGER '||table_name||'_geom_trigger_insert
			BEFORE INSERT ON distribution.'||table_name||'
			FOR EACH ROW
			EXECUTE PROCEDURE distribution.'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_trigger_insert ON distribution.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after insert.'';';

		EXECUTE 'CREATE TRIGGER '||table_name||'_geom_trigger_update
			BEFORE UPDATE OF geometry ON distribution.'||table_name||' 
			FOR EACH ROW
			WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
			EXECUTE PROCEDURE distribution.'||table_name||'_geom();';
		EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_trigger_update ON distribution.'||table_name||' IS ''Trigger: updates auto fields of the '||table_name||' after geom update.'';';
		
		
		/* detect if schematic is used */
		EXECUTE '	
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom_schematic() RETURNS TRIGGER AS
				''
				BEGIN
					NEW._geometry_schematic_used := ST_AsBinary(NEW.geometry_schematic) <> ST_AsBinary(NEW.geometry);
					RETURN NEW;
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		EXECUTE 'CREATE TRIGGER '||table_name||'_geom_schematic_trigger
			BEFORE UPDATE OF geometry_schematic ON distribution.'||table_name||' 
			FOR EACH ROW
			EXECUTE PROCEDURE distribution.'||table_name||'_geom_schematic();';
		EXECUTE 'COMMENT ON TRIGGER '||table_name||'_geom_schematic_trigger ON distribution.'||table_name||' IS ''Trigger: when updating, check if geometry_schematic is different to fill the boolean field.'';';
		
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.fn_geom_tool_line(varchar) IS 'Create geometric columns, constraint and triggers for tables with line items.';



