/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs [view]
*/

BEGIN;
DROP VIEW IF EXISTS distribution.dimension_view CASCADE;
CREATE VIEW distribution.dimension_view AS 
	SELECT id,distance_observed,_distance_terrain,lbl_x,lbl_y,lbl_a,
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

/* insert,update,delete rules */
CREATE OR REPLACE RULE dimension_update AS
	ON UPDATE TO distribution.dimension_view DO INSTEAD
		UPDATE distribution.dimension SET 
			distance_observed = NEW.distance_observed,
			lbl_x = NEW.lbl_x,
			lbl_y = NEW.lbl_y,
			lbl_a = NEW.lbl_a
		WHERE id = NEW.id;
CREATE OR REPLACE RULE dimension_delete AS
	ON DELETE TO distribution.dimension_view DO INSTEAD
		DELETE FROM distribution.dimension WHERE id = OLD.id;
		
/* Comments */	
COMMENT ON RULE dimension_update IS 'Rule to forward changes for dimension_view to the table dimension.';
COMMENT ON RULE dimension_delete IS 'Rule to forward deletion of dsimension_view to the table dimension.';


COMMIT;
