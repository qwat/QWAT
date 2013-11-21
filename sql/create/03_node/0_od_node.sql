/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

CREATE TYPE node_type AS ENUM('valve','hydrant','wateringoutput','installation','one','one_hidden','two_same','two_year','two_diameter','two_material','three');


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_node CASCADE;
CREATE TABLE distribution.od_node (id serial NOT NULL);
SELECT setval('distribution.od_node_id_seq', 40000, true);
COMMENT ON TABLE distribution.od_node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE distribution.od_node ADD COLUMN altitude_dtm    decimal(10,3)              ;
ALTER TABLE distribution.od_node ADD COLUMN _type           node_type     default null ;
ALTER TABLE distribution.od_node ADD COLUMN _orientation    float         default 0    ;
ALTER TABLE distribution.od_node ADD COLUMN _schema_visible boolean       default false;
ALTER TABLE distribution.od_node ADD COLUMN _status_active  boolean       default false;
ALTER TABLE distribution.od_node ADD COLUMN _under_object   boolean       default false;

/* geometry */
SELECT AddGeometryColumn('distribution', 'od_node', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX node_geoidx ON distribution.od_node USING GIST ( geometry );

/* constraints */
ALTER TABLE distribution.od_node ADD CONSTRAINT node_pk PRIMARY KEY (id);


/*----------------!!!---!!!----------------*/
/* Trigger for geometry (=> altitude) */
CREATE OR REPLACE FUNCTION distribution.od_node_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.od_node SET
			altitude_dtm = NULL
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_node_geom() IS 'Fcn/Trigger: set uptodate to false for altitude when geometry changes.';

CREATE TRIGGER node_geom_trigger 
	AFTER UPDATE OF geometry ON distribution.od_node
		FOR EACH ROW
		EXECUTE PROCEDURE distribution.od_node_geom();
COMMENT ON TRIGGER node_geom_trigger ON distribution.od_node IS 'Trigger: uset uptodate to false for altitude when geometry changes.';



