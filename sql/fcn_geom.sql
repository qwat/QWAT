BEGIN;
/* 
POINT and NODE
a point is not on a node: do not create id_node and so on
*/ 

CREATE OR REPLACE FUNCTION distribution.geom_tool_node(varchar) RETURNS void AS
$BODY$
	DECLARE
		table_name ALIAS for $1;
	BEGIN
		/* Creates columns */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node         integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _printmaps      varchar(100) ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _districts      varchar(255) ;';
		
		/* Enables geometry */
		PERFORM addGeometryColumn('distribution', table_name, 'geometry', 21781, 'POINT', 2);
		PERFORM addGeometryColumn('distribution', table_name, 'geometry_schematic', 21781, 'POINT', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx     ON distribution.'||table_name||' USING GIST ( geometry );';
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx_sch ON distribution.'||table_name||' USING GIST ( geometry_schematic );';		
				
		/* Add constraints and indexes */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node         FOREIGN KEY (id_node)         REFERENCES distribution.node(id)         MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id) MATCH SIMPLE;';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node         ON distribution.'||table_name||'(id_node);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		
		/* Geometric triggers */
		EXECUTE '
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN
					UPDATE distribution.'||table_name||' SET
						id_node            = distribution.node_get_id(NEW.geometry,false),
						id_district        = distribution.get_district_id(NEW.geometry),
						id_pressurezone    = distribution.get_pressurezone_id(NEW.geometry),
						id_printmap        = distribution.get_printmap_id(NEW.geometry),
						geometry_schematic = NEW.geometry,
						_printmaps         = distribution.get_printmaps(NEW.geometry),
						_districts         = distribution.get_districts(NEW.geometry)
						WHERE id = NEW.id ;
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		
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
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.geom_tool_node(varchar) IS 'Create geometric columns, constraint and triggers for tables with point on node items.';


CREATE OR REPLACE FUNCTION distribution.geom_tool_point(varchar) RETURNS void AS
$BODY$
	DECLARE
		table_name ALIAS for $1;
	BEGIN
		/* Creates columns */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _printmaps      varchar(100) ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _districts      varchar(255) ;';
		
		/* Enables geometry */
		PERFORM addGeometryColumn('distribution', table_name, 'geometry', 21781, 'POINT', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx     ON distribution.'||table_name||' USING GIST ( geometry );';	
				
		/* Add constraints and indexes */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id) MATCH SIMPLE;';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		
		/* Geometric triggers */
		EXECUTE '
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN
					UPDATE distribution.'||table_name||' SET
						id_district        = distribution.get_district_id(NEW.geometry),
						id_pressurezone    = distribution.get_pressurezone_id(NEW.geometry),
						id_printmap        = distribution.get_printmap_id(NEW.geometry),
						geometry_schematic = NEW.geometry,
						_printmaps         = distribution.get_printmaps(NEW.geometry),
						_districts         = distribution.get_districts(NEW.geometry)
						WHERE id = NEW.id ;
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		
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
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.geom_tool_point(varchar) IS 'Create geometric columns, constraint and triggers for tables with point items.';



/* LINES */


CREATE OR REPLACE FUNCTION distribution.geom_tool_line(varchar) RETURNS void AS
$BODY$
	DECLARE
		table_name ALIAS for $1;
	BEGIN
		/* Creates columns */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node_a       integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node_b       integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _length2d       decimal(8,2) ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _length3d       decimal(8,2) ;';	
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _printmaps      varchar(100) ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN _districts      varchar(255) ;';
			
		/* Enables geometry */
		PERFORM addGeometryColumn('distribution', table_name, 'geometry', 21781, 'LINESTRING', 2);
		PERFORM addGeometryColumn('distribution', table_name, 'geometry_schematic', 21781, 'LINESTRING', 2);
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx     ON distribution.'||table_name||' USING GIST ( geometry );';
		EXECUTE 'CREATE INDEX '||table_name||'_geoidx_sch ON distribution.'||table_name||' USING GIST ( geometry_schematic );';		

		/* Add constraints and indexes */
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node_a       FOREIGN KEY (id_node_a)       REFERENCES distribution.node(id)         MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node_b       FOREIGN KEY (id_node_b)       REFERENCES distribution.node(id)         MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id) MATCH SIMPLE;';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node_a       ON distribution.'||table_name||'(id_node_a);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node_b       ON distribution.'||table_name||'(id_node_b);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		
		/* Geometric triggers */
		EXECUTE '
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN
					UPDATE distribution.'||table_name||' SET
						id_node_a          = distribution.node_get_id(ST_StartPoint(NEW.geometry),true),
						id_node_b          = distribution.node_get_id(ST_EndPoint(  NEW.geometry),true),
						id_district        = distribution.get_district_id(NEW.geometry),
						id_pressurezone    = distribution.get_pressurezone_id(NEW.geometry),
						id_printmap        = distribution.get_printmap_id(NEW.geometry),
						geometry_schematic = NEW.geometry,
						_printmaps         = distribution.get_printmaps(NEW.geometry),
						_districts         = distribution.get_districts(NEW.geometry),
						_length2d          = ST_Length(NEW.geometry),
						_length3d          = NULL
						WHERE id = NEW.id ;
					RETURN NEW;				
				END;
				''
				LANGUAGE ''plpgsql'';		
		';
		
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
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.geom_tool_line(varchar) IS 'Create geometric columns, constraint and triggers for tables with line items.';


COMMIT;
