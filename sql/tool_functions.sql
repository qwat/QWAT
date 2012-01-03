/*
	qWat - QGIS Water Module
	
	SQL file :: create tool functions
*/


DROP AGGREGATE IF EXISTS distribution.tsum(text);
CREATE AGGREGATE distribution.tsum ( BASETYPE = text, SFUNC = textcat, STYPE = text, INITCOND = '' );
COMMENT ON AGGREGATE distribution.tsum(text) IS 'Concatenates text in a SELECT. See distribution.get_map_name for an example.';





CREATE OR REPLACE FUNCTION distribution.table_fields(varchar,VARIADIC exclude varchar[]) RETURNS text AS '
	DECLARE
		ftable ALIAS FOR $1;
		result text;
	BEGIN
		SELECT
			left(distribution.tsum(pg_attribute.attname || '', ''),-2) INTO result
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


