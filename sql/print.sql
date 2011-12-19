DROP TABLE IF EXISTS distribution.print CASCADE;

CREATE TABLE distribution.print (fid serial NOT NULL);


ALTER TABLE distribution.print ADD COLUMN  short_name varchar(20);
ALTER TABLE distribution.print ADD COLUMN  long_name  text;
ALTER TABLE distribution.print ADD COLUMN  template  varchar(50);

SELECT AddGeometryColumn('distribution', 'print', 'wkb_geometry', 21781, 'POLYGON', 2);



/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.print ADD CONSTRAINT print_pkey PRIMARY KEY (fid);
