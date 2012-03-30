/*
	qWat - QGIS Water Module
	
	SQL file :: to calculate 3D length
*/

/*
raster2pgsql mnt.asc distribution.dtm > load_dtm.sql
psql load_dtm.sql
*/

CREATE OR REPLACE FUNCTION distribution.length3d(geometry) RETURNS double precision AS '
	DECLARE
		geom ALIAS FOR $1;
		point geometry;
		altitude double precision;
		length double precision;
		i RECORD;
		interpolateDistance integer := 4;
		rasterid integer;
		intersect boolean;
	BEGIN
		/* Interpolate along the line */
		SELECT ST_Segmentize(geom,interpolateDistance) INTO geom;
		/* Create third coordinate (Z) */
		SELECT ST_Force_3DZ(geom) INTO geom;
		/* Loop along all points */
		FOR i IN SELECT generate_series(1,ST_NumPoints(geom)) AS i LOOP
			/* Create 2d point */
			SELECT ST_Force_2D(ST_PointN( geom , i.i )) INTO point ;
			/* Check that we have the good raster id */
			IF (SELECT ST_Intersects(rast,1,point) FROM distribution.dtm WHERE rid = rasterid) IS NOT TRUE THEN
				SELECT distribution.getRasterId(point) INTO rasterid;
			END IF;
			/* Get altitude */
			SELECT ST_Value(rast,point) FROM distribution.dtm WHERE rid= rasterid INTO altitude;
			/* If we don''t have altitude of a point, return NULL */
			IF altitude IS NULL THEN 
				RETURN NULL;
			END IF;
			/* Set altitude in 3rd coordinate in line geometry */
			SELECT ST_SetPoint( geom , i.i-1 , ST_MakePoint(ST_X(point),ST_Y(point),altitude) ) INTO geom;
		END LOOP;
		/* Calculates 3d length */
		SELECT ST_3DLength(geom) INTO length;
		RETURN length;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.length3d(geometry) IS 'Returns the real (3D) length of a linestring using the dtm (raster) stored in distribution.dtm. To create the DTM use raster2pgsql DTM distribution.dtm > load_dtm.sql and load the resulting file.';


CREATE OR REPLACE FUNCTION distribution.getRasterId(geometry) RETURNS integer AS '
	DECLARE
		geom ALIAS FOR $1;
		rasterid integer;
	BEGIN
		SELECT rid FROM distribution.dtm WHERE ST_Intersects(ST_SetSRID(rast,21781),1,geom) LIMIT 1 INTO rasterid;
		RETURN rasterid;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.getRasterId(geometry) IS 'Returns the first raster ID that match geometry location.';


CREATE OR REPLACE FUNCTION distribution.pipes_length3d() RETURNS void AS '
	DECLARE
		length double precision;
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,wkb_geometry FROM distribution.pipes WHERE _length3d_uptodate IS NOT TRUE ORDER BY id LOOP
			IF pipes.tunnel_or_bridge IS TRUE THEN
				length := pipeitem._length2d;
			ELSE
				RAISE NOTICE ''%'', pipeitem.id;
				SELECT distribution.length3d(pipeitem.wkb_geometry) INTO length;
			END IF;
			UPDATE distribution.pipes SET _length3d = length, _length3d_uptodate = TRUE WHERE id = pipeitem.id;
		END LOOP;
	END
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_length3d() IS 'Fill the 3d length of the pipes.';


