CREATE OR REPLACE FUNCTION distribution.geom_tool_point(varchar) RETURNS void AS
$BODY$
	DECLARE
		table_name ALIAS for $1;
	BEGIN
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_node         integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_district     integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_pressurezone integer   ;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD COLUMN id_printmap     integer[] ;';
		
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_node         FOREIGN KEY (id_node)         REFERENCES distribution.node(id)         MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district(id)     MATCH SIMPLE;';
		EXECUTE 'ALTER TABLE distribution.'||table_name||' ADD CONSTRAINT '||table_name||'_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone(id) MATCH SIMPLE;';
		
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_node         ON distribution.'||table_name||'(id_node);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_district     ON distribution.'||table_name||'(id_district);';
		EXECUTE 'CREATE INDEX fki_'||table_name||'_id_pressurezone ON distribution.'||table_name||'(id_pressurezone);';
		
		EXECUTE '
			CREATE OR REPLACE FUNCTION distribution.'||table_name||'_geom() RETURNS TRIGGER AS
				''
				BEGIN
					UPDATE distribution.'||table_name||' SET
						id_node         = distribution.node_get_id(NEW.geometry,false),
						id_district     = distribution.get_district_id(NEW.geometry),
						id_pressurezone = distribution.get_pressurezone_id(NEW.geometry),
						id_printmap     = distribution.get_printmap(NEW.geometry)
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
		
	END
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.geom_tool_point(varchar) IS 'Create geometric columns, constraint and triggers for tables with point items.';





DROP TABLE distribution.test;
CREATE TABLE distribution.test();
SELECT AddGeometryColumn('distribution', 'test', 'geometry', 21781, 'POINT', 2);
SELECT distribution.geom_tool_point('test');


