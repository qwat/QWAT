/*
	qWat - QGIS Water Module
	
	SQL file :: valve maintenance table
*/


DROP TABLE IF EXISTS distribution.vl_valvemaintenance CASCADE;
CREATE TABLE distribution.vl_valvemaintenance ( id SERIAL, CONSTRAINT vl_valvemaintenance_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_valvemaintenance IS 'valve maintenance table.';

/* Columns */
ALTER TABLE distribution.vl_valvemaintenance ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE distribution.vl_valvemaintenance ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE distribution.vl_valvemaintenance ADD COLUMN priority SMALLINT CHECK (priority > 0 AND priority < 4);
ALTER TABLE distribution.vl_valvemaintenance ADD COLUMN comment  text;

/* Constraints */
ALTER TABLE distribution.vl_valvemaintenance ADD CONSTRAINT vl_valvemaintenance_name UNIQUE (name);

/* Predefined functions list */
INSERT INTO distribution.vl_valvemaintenance (value_fr,priority,comment) VALUES ('Cape fendue',3,'');
INSERT INTO distribution.vl_valvemaintenance (value_fr,priority,comment) VALUES ('Joint manquant',2,'');
INSERT INTO distribution.vl_valvemaintenance (value_fr,priority,comment) VALUES ('Bloquée',1,'');


