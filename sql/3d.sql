/*
	qWat - QGIS Water Module
	
	SQL file :: to calculate 3D length
*/

/*
raster2pgsql DTM distribution.dtm > load_dtm.sql
psql load_dtm.sql
*/

CREATE OR REPLACE FUNCTION distribution.length3d(geometry) RETURNS double precision AS '
	DECLARE
		geom ALIAS FOR $1;
		point geometry;
		altitude double precision;
		length double precision;
		i RECORD;
	BEGIN
		SELECT ST_Force_3DZ(geom) INTO geom;
		FOR i IN SELECT generate_series(1,ST_NumPoints(geom)) AS i LOOP
			SELECT ST_Force_2D(ST_PointN( geom , i.i )) INTO point ;
			SELECT ST_Value(rast, ST_SetSRID( point , 21781 )) FROM distribution.dtm INTO altitude;
			IF altitude IS NULL THEN 
				RETURN NULL;
			END IF;
			SELECT ST_SetPoint( geom , i.i-1 , ST_MakePoint(ST_X(point),ST_Y(point),altitude) ) INTO geom;
		END LOOP;
		SELECT ST_3DLength(geom) INTO length;
		RETURN length;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.length3d(geometry) IS 'Returns the real (3D) length of a linestring using the dtm (raster) stored in distribution.dtm. To create the DTM use raster2pgsql DTM distribution.dtm > load_dtm.sql and load the resulting file.';


/* 
 
*/

CREATE OR REPLACE FUNCTION distribution.pipes_length3d() RETURNS void AS '
	DECLARE
		length double precision;
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,wkb_geometry FROM distribution.pipes WHERE _length3d_uptodate IS NOT TRUE ORDER BY id LOOP
			RAISE NOTICE ''%'', pipeitem.id;
			UPDATE distribution.pipes SET _length3d = distribution.length3d(pipeitem.wkb_geometry) , _length3d_uptodate = TRUE WHERE id = pipeitem.id;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_length3d() IS 'Fill the 3d length of the pipes.';


