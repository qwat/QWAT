/*
	qWat - QGIS Water Module
	
	SQL file :: create tool functions
*/
BEGIN;

/* List all columns from a table */
CREATE OR REPLACE FUNCTION distribution.table_fields(varchar,VARIADIC exclude varchar[]) RETURNS text AS '
	DECLARE
		ftable ALIAS FOR $1;
		result text;
	BEGIN
		SELECT
			string_agg(pg_attribute.attname , '', '') INTO result
		FROM
			pg_class, pg_attribute
		WHERE
			pg_class.relname = ftable 
			AND pg_class.oid = pg_attribute.attrelid 
			AND pg_attribute.attnum > 0
			AND pg_attribute.attname != all(exclude)
		;
		RETURN result;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.table_fields(varchar,varchar[]) IS 'Returns field names from a table except those listed in arguments.';
CREATE OR REPLACE FUNCTION distribution.table_fields(varchar) RETURNS text AS '
	DECLARE
		ftable ALIAS FOR $1;
		result text;
	BEGIN
		SELECT distribution.table_fields(ftable,'''') INTO result;
		RETURN result;
	END			
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.table_fields(varchar,varchar[]) IS 'Returns field names from a table.';



COMMIT;


