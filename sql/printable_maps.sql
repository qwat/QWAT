/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/

/*----------------!!!---!!!----------------*/
/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.printable_maps CASCADE;
CREATE TABLE distribution.printable_maps (fid serial NOT NULL);

ALTER TABLE distribution.printable_maps ADD COLUMN  short_name varchar(20);
ALTER TABLE distribution.printable_maps ADD COLUMN  long_name  text;
ALTER TABLE distribution.printable_maps ADD COLUMN  template  varchar(50);

SELECT AddGeometryColumn('distribution', 'printable_maps', 'wkb_geometry', 21781, 'POLYGON', 2);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.printable_maps ADD CONSTRAINT print_pkey PRIMARY KEY (fid);


/*----------------!!!---!!!----------------*/
/* FUNCTION */
DROP AGGREGATE IF EXISTS distribution.tsum(text);
CREATE AGGREGATE distribution.tsum ( BASETYPE = text, SFUNC = textcat, STYPE = text, INITCOND = '' );

CREATE OR REPLACE FUNCTION distribution.getMapName(integer) RETURNS text AS '
	DECLARE
		pipe_id ALIAS FOR $1;
		result text;
	BEGIN
		SELECT left(distribution.tsum(printable_maps.short_name || '', ''),-2) INTO result FROM distribution.printable_maps, distribution.pipes WHERE pipes.fid = pipe_id AND ST_Intersects(pipes.wkb_geometry,printable_maps.wkb_geometry) IS TRUE;
		RETURN result;
	END
' LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION distribution.fillMapNames() RETURNS boolean AS '
	BEGIN
		UPDATE distribution.pipes SET is_on_map = distribution.getMapName(pipes.fid);	
		RETURN true;
	END
' LANGUAGE 'plpgsql';



