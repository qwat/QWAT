/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_node CASCADE;
CREATE TABLE qwat.od_node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat.od_node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE qwat.od_node ADD COLUMN altitude_dtm    decimal(10,3)              ;
ALTER TABLE qwat.od_node ADD COLUMN _type           varchar(40) default null ;
ALTER TABLE qwat.od_node ADD COLUMN _orientation    float       default 0    ;
ALTER TABLE qwat.od_node ADD COLUMN _schema_visible boolean     default false;
ALTER TABLE qwat.od_node ADD COLUMN _status_active  boolean     default false;
ALTER TABLE qwat.od_node ADD COLUMN _under_object   boolean     default false;

/* geometry */
SELECT AddGeometryColumn('qwat', 'od_node', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX node_geoidx ON qwat.od_node USING GIST ( geometry );


/*----------------!!!---!!!----------------*/
/* Trigger for geometry (=> altitude) */
CREATE OR REPLACE FUNCTION qwat.ft_node_geom() RETURNS trigger AS 
$BODY$ 
	BEGIN
		NEW.altitude_dtm := NULL;
		RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.ft_node_geom() IS 'Fcn/Trigger: set uptodate to false for altitude when geometry changes.';

CREATE TRIGGER tr_node_geom
	BEFORE UPDATE OF geometry ON qwat.od_node
		FOR EACH ROW
		EXECUTE PROCEDURE qwat.ft_node_geom();
COMMENT ON TRIGGER tr_node_geom ON qwat.od_node IS 'Trigger: uset uptodate to false for altitude when geometry changes.';



