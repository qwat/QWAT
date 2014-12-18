/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control auxiliary tables
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_pressurecontrol CASCADE;
CREATE TABLE qwat.vl_pressurecontrol (id integer not null, CONSTRAINT "vl_pressurecontrol_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat.vl_pressurecontrol ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_pressurecontrol ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat.vl_pressurecontrol ADD COLUMN value_fr varchar(30) default '' ;

/* VALUES */
INSERT INTO qwat.vl_pressurecontrol (id,value_en,value_fr) VALUES (2801,'reducer'     ,'réducteur');
INSERT INTO qwat.vl_pressurecontrol (id,value_en,value_fr) VALUES (2802,'pressure cut','coupe-pression');
INSERT INTO qwat.vl_pressurecontrol (id,value_en,value_fr) VALUES (2803,'gathering'   ,'rassemblement');
 
