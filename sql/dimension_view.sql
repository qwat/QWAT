/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs [view]
*/

BEGIN;
DROP VIEW IF EXISTS distribution.dimension_draw CASCADE;
CREATE VIEW distribution.dimension_view AS 
	SELECT id,_distance_observed,_distance_terrain,
		ST_CurveToLine(
			ST_GeomFromEWKT(
				'SRID=21781;CIRCULARSTRING('
					||ST_X(ST_GeometryN(geometry,1))||' '||ST_Y(ST_GeometryN(geometry,1))||','
					||ST_X(ST_GeometryN(geometry,2))||' '||ST_Y(ST_GeometryN(geometry,2))||','
					||ST_X(ST_GeometryN(geometry,3))||' '||ST_Y(ST_GeometryN(geometry,3))
					||')'
			)
		,12)::geometry(LINESTRING,21781) AS geometry
	FROM   distribution.dimension;
COMMENT ON VIEW distribution.dimension_view IS 'Creates a Linestring so it can be viewed in QGIS as a curve. Later, this view should be remove and the new geometry transformed to CIRCULARSTRING.';

COMMIT;
