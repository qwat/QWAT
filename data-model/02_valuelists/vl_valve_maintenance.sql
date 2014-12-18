/*
	qWat - QGIS Water Module
	
	SQL file :: valve maintenance table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_valve_maintenance CASCADE;
CREATE TABLE qwat.vl_valve_maintenance ( id integer not null, CONSTRAINT vl_valve_maintenance_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_valve_maintenance IS 'valve maintenance table.';

/* COLUMNS */
ALTER TABLE qwat.vl_valve_maintenance ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_maintenance ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_maintenance ADD COLUMN priority SMALLINT CHECK (priority > 0 AND priority < 4);
ALTER TABLE qwat.vl_valve_maintenance ADD COLUMN comment  text default '';

/* VALUES */
INSERT INTO qwat.vl_valve_maintenance (id,value_fr,priority,comment) VALUES (6201,'Cape fendue',3,'');
INSERT INTO qwat.vl_valve_maintenance (id,value_fr,priority,comment) VALUES (6202,'Joint manquant',2,'');
INSERT INTO qwat.vl_valve_maintenance (id,value_fr,priority,comment) VALUES (6203,'Bloquée',1,'');


