/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_constructionpoint CASCADE;
CREATE TABLE qwat.od_constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat.od_constructionpoint ADD COLUMN remark  text default '';

/* geometry */
SELECT AddGeometryColumn('qwat','od_constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON qwat.od_constructionpoint USING GIST ( geometry );



