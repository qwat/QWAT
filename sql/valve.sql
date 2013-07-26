/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.valve CASCADE;
CREATE TABLE distribution.valve (id serial , CONSTRAINT valve_pkey PRIMARY KEY (id));
COMMENT ON TABLE distribution.valve IS 'Table for valve.';

/* columns */
ALTER TABLE distribution.valve ADD COLUMN identification              integer ;
ALTER TABLE distribution.valve ADD COLUMN id_type           integer ;
ALTER TABLE distribution.valve ADD COLUMN id_function       integer ;
ALTER TABLE distribution.valve ADD COLUMN id_maintenance    integer[] ;
ALTER TABLE distribution.valve ADD COLUMN diameter_nominal  varchar(10) ;
ALTER TABLE distribution.valve ADD COLUMN year              smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.valve ADD COLUMN closed            boolean     default false ;
ALTER TABLE distribution.valve ADD COLUMN altitude_real     decimal(10,3)  ;
ALTER TABLE distribution.valve ADD COLUMN remarks text default '';
ALTER TABLE distribution.valve ADD COLUMN schema_force_view boolean     default NULL::boolean;
ALTER TABLE distribution.pipe ADD COLUMN labelview integer DEFAULT 2;              
ALTER TABLE distribution.pipe ADD COLUMN labelview_schema integer DEFAULT 2;         
ALTER TABLE distribution.valve ADD COLUMN _schema_view      boolean DEFAULT NULL;

/* geometry */
SELECT distribution.geom_tool_point('valve',true,false,true,true,true);

/* constraints */
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_type          FOREIGN KEY (id_type)          REFERENCES distribution.valve_type(id)     MATCH FULL; CREATE INDEX fki_valve_id_type          ON distribution.valve(id_type)         ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_function      FOREIGN KEY (id_function)      REFERENCES distribution.valve_function(id) MATCH FULL; CREATE INDEX fki_valve_id_function      ON distribution.valve(id_function)     ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_labelview        FOREIGN KEY (labelview)        REFERENCES distribution.labelview(id)      MATCH FULL; CREATE INDEX fki_valve_labelview        ON distribution.valve(labelview)       ;
ALTER TABLE distribution.valve ADD CONSTRAINT valve_labelview_schema FOREIGN KEY (labelview_schema) REFERENCES distribution.labelview(id)      MATCH FULL; CREATE INDEX fki_valve_labelview_schema ON distribution.valve(labelview_schema);

/* cannot create constraint on arrays yet
ALTER TABLE distribution.valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES distribution.valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON distribution.valve(id_maintenance) ;
*/

/*----------------!!!---!!!----------------*/
/* Trigger for _schema_view */
CREATE OR REPLACE FUNCTION distribution.valve_schemaview() RETURNS trigger AS
$BODY$
	DECLARE
		force_view boolean;
	BEGIN
		IF NEW.schema_force_view IS NULL THEN
			SELECT schema_view FROM distribution.valve_function WHERE id = NEW.id_function INTO force_view;
		ELSE
			force_view := NEW.schema_force_view;
		END IF;
		UPDATE distribution.valve SET _schema_view = force_view WHERE id = NEW.id;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';
CREATE TRIGGER valve_schemaview_trigger

	AFTER INSERT OR UPDATE OF schema_force_view,id_function ON distribution.valve
	FOR EACH ROW EXECUTE PROCEDURE distribution.valve_schemaview();
COMMENT ON TRIGGER valve_schemaview_trigger ON distribution.valve IS 'Schema view depends on valve function and on manual changes.';

COMMIT;

