/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.constructionpoint CASCADE;
CREATE TABLE distribution.constructionpoint (id serial NOT NULL);
COMMENT ON TABLE distribution.constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE distribution.constructionpoint ADD COLUMN remarks text;

/* geometry */
SELECT AddGeometryColumn('distribution','constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON distribution.constructionpoint USING GIST ( geometry );


/* primary key */
ALTER TABLE distribution.constructionpoint ADD CONSTRAINT constructionpoint_pkey PRIMARY KEY (id);


