/*
	qWat - QGIS Water Module
	
	SQL file :: to calculate 3D length
*/

/*
raster2pgsql mnt.asc altitude.dtm > load_dtm.sql
psql -f load_dtm.sql
*/

CREATE OR REPLACE FUNCTION altitude.getRasterId(geometry) RETURNS integer AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		rasterid integer;
	BEGIN
		SELECT rid FROM altitude.dtm WHERE ST_Intersects(ST_SetSRID(rast,21781),1,geom) LIMIT 1 INTO rasterid;
		RETURN rasterid;
	END:
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION altitude.getRasterId(geometry) IS 'Returns the first raster ID that match geometry location.';


CREATE OR REPLACE FUNCTION altitude.altitude(geometry) RETURNS double precision AS
$BODY$
	DECLARE
		point ALIAS FOR $1;
		altitude double precision;
		rasterid integer;
	BEGIN
		SELECT altitude.getRasterId(point) INTO rasterid;
		SELECT ST_Value(rast,point) FROM altitude.dtm WHERE rid = rasterid INTO altitude;
		RETURN altitude;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION altitude.altitude(geometry) IS 'Return altitude for a point.';


CREATE OR REPLACE FUNCTION altitude.length3d(geometry) RETURNS double precision AS
$BODY$
	DECLARE
		geom      ALIAS FOR $1;
		point     geometry;
		altitude  double precision;
		length    double precision;
		i         RECORD;
		interpolateDistance integer := 4;
		rasterid  integer;
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
			IF (SELECT ST_Intersects(rast,1,point) FROM altitude.dtm WHERE rid = rasterid) IS NOT TRUE THEN
				SELECT altitude.getRasterId(point) INTO rasterid;
			END IF;
			/* Get altitude */
			SELECT ST_Value(rast,point) FROM altitude.dtm WHERE rid= rasterid INTO altitude;
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
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION altitude.length3d(geometry) IS 'Returns the real (3D) length of a linestring using the dtm (raster) stored in altitude.dtm. To create the DTM use raster2pgsql DTM altitude.dtm > load_dtm.sql and load the resulting file.';


