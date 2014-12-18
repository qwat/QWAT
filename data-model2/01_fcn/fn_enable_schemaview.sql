/*
	qWat - QGIS Water Module
	
	SQL file :: function to add schema view capability to tables
*/


CREATE OR REPLACE FUNCTION qwat.fn_enable_schemaview(main_table varchar, auxiliary varchar, keyfield varchar) RETURNS VOID AS 
$BODY$
	BEGIN
		/* Add columns */
		EXECUTE 'ALTER TABLE qwat.'||main_table||' ADD COLUMN schema_force_view boolean default NULL;';
		EXECUTE 'ALTER TABLE qwat.'||main_table||' ADD COLUMN _schema_visible boolean default NULL;';
		/* Constraint */
		EXECUTE 'ALTER TABLE qwat.'||main_table||' ADD CONSTRAINT '||main_table||'_schema_force_view FOREIGN KEY (schema_force_view) REFERENCES qwat.vl_visible(vl_code) MATCH FULL;';
		EXECUTE ' CREATE INDEX fki_'||main_table||'_schema_force_view ON qwat.'||main_table||'(schema_force_view);';
		
		/* trigger */
		EXECUTE 'CREATE OR REPLACE FUNCTION qwat.'||main_table||'_schemaview() RETURNS trigger AS
		''
			DECLARE
				visibility boolean;
			BEGIN
				IF NEW.schema_force_view IS NULL THEN
					SELECT schema_visible FROM qwat.'||auxiliary||' WHERE id = NEW.'||keyfield||' INTO visibility;
				ELSE 
					visibility := NEW.schema_force_view;
				END IF;
				NEW._schema_visible := visibility;
				RETURN NEW;
			END;
		'' LANGUAGE ''plpgsql'';
		
		CREATE TRIGGER tr_'||main_table||'_schemaview
			BEFORE INSERT OR UPDATE OF schema_force_view,'||keyfield||' ON qwat.'||main_table||'
			FOR EACH ROW EXECUTE PROCEDURE qwat.'||main_table||'_schemaview();
		COMMENT ON TRIGGER tr_'||main_table||'_schemaview ON qwat.'||main_table||' IS ''Schema view depends on pipe function and on manual changes.'';
		';
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.fn_enable_schemaview(varchar,varchar,varchar) IS 'Add a column schema_force_view and _schema_visible in given table. _schema_visible is a boolean determined by the corresponding auxiliary table and might be overriden by _schema_force_view.';	

