/*
	qWat - QGIS Water Module
	
	SQL file :: valve maintenance table
*/


DROP TABLE IF EXISTS distribution.valve_maintenance CASCADE;
CREATE TABLE distribution.valve_maintenance ( id SERIAL, CONSTRAINT valve_maintenance_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.valve_maintenance IS 'valve_maintenance table.';

/* Columns */
ALTER TABLE distribution.valve_maintenance ADD COLUMN name       VARCHAR(35);
ALTER TABLE distribution.valve_maintenance ADD COLUMN priority   SMALLINT CHECK (priority > 0 AND priority < 4);
ALTER TABLE distribution.valve_maintenance ADD COLUMN comment   text;

/* Constraints */
ALTER TABLE distribution.valve_maintenance ADD CONSTRAINT valve_maintenance_name UNIQUE (name);


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.valve_maintenance (name,priority,comment) VALUES ('Cape fendu',3,'');
INSERT INTO distribution.valve_maintenance (name,priority,comment) VALUES ('Joint manquant',2,'');
INSERT INTO distribution.valve_maintenance (name,priority,comment) VALUES ('Bloquée',1,'');


