 
 
 BEGIN;

DROP TABLE distribution.folder ;

CREATE TABLE 
	distribution.folder 
	AS 
		SELECT 
			ROW_NUMBER() OVER(ORDER BY folder ASC) AS id,
			folder,
			ST_Union(geometry) as geometry
		FROM 
			distribution.pipe 
		WHERE 
			folder != ''
		GROuP BY folder;
		
		
ALTER TABLE distribution.folder ADD PRIMARY KEY (id);

CREATE SEQUENCE distribution.folder_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 500;

ALTER TABLE distribution.folder ALTER COLUMN id SET DEFAULT nextval('distribution.folder_id_seq'::regclass);

ALTER TABLE distribution.folder ALTER COLUMN geometry TYPE geometry(MultiLineString,21781)  USING ST_Multi(geometry);


COMMIT;
