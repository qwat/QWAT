/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control auxiliary tables
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_pressurecontrol CASCADE;
CREATE TABLE distribution.vl_pressurecontrol (id serial NOT NULL);
ALTER TABLE distribution.vl_pressurecontrol ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE distribution.vl_pressurecontrol ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE distribution.vl_pressurecontrol ADD CONSTRAINT vl_pressurecontrol_pkey PRIMARY KEY (id);

/* VALUES */
INSERT INTO distribution.vl_pressurecontrol (value_en,value_fr) VALUES ('reducer'     ,'réducteur');
INSERT INTO distribution.vl_pressurecontrol (value_en,value_fr) VALUES ('pressure cut','coupe-pression');
INSERT INTO distribution.vl_pressurecontrol (value_en,value_fr) VALUES ('gathering'   ,'rassemblement');
 
