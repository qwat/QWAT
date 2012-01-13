/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.dimension CASCADE;
CREATE TABLE distribution.dimension (id serial NOT NULL);

ALTER TABLE distribution.dimension ADD COLUMN  label  varchar(12);
ALTER TABLE distribution.dimension ADD COLUMN  lbl_x double precision;
ALTER TABLE distribution.dimension ADD COLUMN  lbl_y double precision;
ALTER TABLE distribution.dimension ADD COLUMN  lbl_a double precision;
ALTER TABLE distribution.dimension ADD COLUMN  wkb_geometry geometry;


DELETE FROM geometry_columns WHERE f_table_name = 'dimension';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	VALUES  ('' , 'distribution', 'dimension', 'wkb_geometry', 2, 21781, 'MULTIPOINT');

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.dimension ADD CONSTRAINT dimension_pkey PRIMARY KEY (id);
ALTER TABLE distribution.dimension ADD CONSTRAINT dimension_label UNIQUE (label);

/* Comment */
COMMENT ON TABLE distribution.dimension IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/*----------------!!!---!!!----------------*/
/* VIEW */
DROP VIEW IF EXISTS distribution.dimension_view CASCADE;
CREATE VIEW distribution.dimension_view AS 
	SELECT id,label,lbl_x,lbl_y,lbl_a,
		ST_CurveToLine(
			ST_GeomFromEWKT(
				'SRID=21781;CIRCULARSTRING('||left(distribution.tsum(ST_X(ST_GeometryN(wkb_geometry,n))||' '||ST_Y(ST_GeometryN(wkb_geometry,n))||','),-1)||')'
			)
		,12) AS wkb_geometry
	FROM   distribution.dimension
	CROSS JOIN generate_series(1,100) n 
	WHERE n <= ST_NumGeometries(wkb_geometry) 
	GROUP BY id;

	
DELETE FROM geometry_columns WHERE f_table_name = 'dimension_view';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	VALUES  ('' , 'distribution', 'dimension_view', 'wkb_geometry', 2, 21781, 'LINESTRING');
/* Comment */	
COMMENT ON VIEW distribution.dimension_view IS 'Creates a Linestring so it can be viewed in QGIS as a curve. Later, this view should be remove and the new geometry transformed to CIRCULARSTRING.';
/* insert,update,delete rules */
CREATE OR REPLACE RULE dimension_update AS
	ON UPDATE TO distribution.dimension_view DO INSTEAD
		UPDATE distribution.dimension SET 
			label = NEW.label,
			lbl_x = NEW.lbl_x,
			lbl_y = NEW.lbl_y,
			lbl_a = NEW.lbl_a
		WHERE id = NEW.id;
CREATE OR REPLACE RULE dimension_insert AS
	ON INSERT TO distribution.dimension_view DO INSTEAD
		INSERT INTO distribution.dimension 
			(    label,    lbl_x,    lbl_y,    lbl_a)     
		VALUES
			(NEW.label,NEW.lbl_x,NEW.lbl_y,NEW.lbl_a);
CREATE OR REPLACE RULE dimension_delete AS
	ON DELETE TO distribution.dimension_view DO INSTEAD
		DELETE FROM distribution.dimension WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE dimension_update IS 'Rule to forward changes for dimension_view to the table dimension.';
COMMENT ON RULE dimension_insert IS 'Rule to forward insert of dimension_view to the table dimension.';
COMMENT ON RULE dimension_delete IS 'Rule to forward deletion of dsimension_view to the table dimension.';


COMMIT;
