/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.node CASCADE;
CREATE TABLE distribution.node (id serial NOT NULL);
SELECT setval('distribution.node_id_seq', 40000, true);
COMMENT ON TABLE distribution.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE distribution.node ADD COLUMN  altitude_dtm       DECIMAL(10,3)              ;
ALTER TABLE distribution.node ADD COLUMN  _type              VARCHAR(20)   DEFAULT NULL ;
ALTER TABLE distribution.node ADD COLUMN  _orientation       FLOAT         DEFAULT 0    ;
ALTER TABLE distribution.node ADD COLUMN  _schema_view       BOOLEAN       DEFAULT False;
ALTER TABLE distribution.node ADD COLUMN  _status_active     BOOLEAN       DEFAULT False;

/* geometry */
SELECT AddGeometryColumn('distribution', 'node', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX node_geoidx ON distribution.node USING GIST ( geometry );

/* constraints */
ALTER TABLE distribution.node ADD CONSTRAINT node_pkey PRIMARY KEY (id);


/*----------------!!!---!!!----------------*/
/* Trigger for geometry (=> altitude) */
CREATE OR REPLACE FUNCTION distribution.node_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.node SET
			altitude_dtm = NULL
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.node_geom() IS 'Fcn/Trigger: set uptodate to false for altitude when geometry changes.';

CREATE TRIGGER node_geom_trigger 
	AFTER UPDATE OF geometry ON distribution.node
		FOR EACH ROW
		EXECUTE PROCEDURE distribution.node_geom();
COMMENT ON TRIGGER node_geom_trigger ON distribution.node IS 'Trigger: uset uptodate to false for altitude when geometry changes.';

COMMIT;

