/*
	qWat - QGIS Water Module
	
	SQL file :: leak arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_leak CASCADE;
CREATE TABLE distribution.od_leak (id serial NOT NULL, CONSTRAINT vl_leak_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.od_leak IS 'pipe leaks';

/* geometry */
SELECT distribution.geom_tool_point('od_leak', false, false, false, true, true);

/* columns */
ALTER TABLE distribution.od_leak ADD COLUMN id_type        integer not null;
ALTER TABLE distribution.od_leak ADD COLUMN id_cause       integer;
ALTER TABLE distribution.od_leak ADD COLUMN id_damage      integer not null;
ALTER TABLE distribution.od_leak ADD COLUMN detection_date date;
ALTER TABLE distribution.od_leak ADD COLUMN repair_date    date;
ALTER TABLE distribution.od_leak ADD COLUMN _repaired      boolean;
ALTER TABLE distribution.od_leak ADD COLUMN address        text;
ALTER TABLE distribution.od_leak ADD COLUMN pipe_replaced  boolean;
ALTER TABLE distribution.od_leak ADD COLUMN description    text;
ALTER TABLE distribution.od_leak ADD COLUMN repair         text;

/* constraints */
ALTER TABLE distribution.od_leak ADD CONSTRAINT vl_leak_id_type   FOREIGN KEY (id_type)   REFERENCES distribution.vl_leak_type(id)   MATCH FULL;   CREATE INDEX fki_vl_leak_id_type   ON distribution.od_leak(id_type)  ;
ALTER TABLE distribution.od_leak ADD CONSTRAINT vl_leak_id_cause  FOREIGN KEY (id_cause)  REFERENCES distribution.vl_leak_cause(id)  MATCH SIMPLE; CREATE INDEX fki_vl_leak_id_cause  ON distribution.od_leak(id_cause) ;
ALTER TABLE distribution.od_leak ADD CONSTRAINT vl_leak_id_damage FOREIGN KEY (id_damage) REFERENCES distribution.vl_leak_damage(id) MATCH FULL;   CREATE INDEX fki_vl_leak_id_damage ON distribution.od_leak(id_damage);

/* Trigger */
CREATE OR REPLACE FUNCTION distribution.od_leak_repaired() RETURNS trigger AS 
$BODY$
	BEGIN
		 UPDATE distribution.od_leak SET _repaired = CASE WHEN repair_date IS NULL THEN false ELSE true END 
			WHERE id = NEW.id;
		 RETURN NEW;
	END;
$BODY$LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_leak_repaired() IS 'Fcn/Trigger: updates the repaired status of the leak.';

CREATE TRIGGER leak_repaired_trigger
	AFTER INSERT OR UPDATE OF repair_date ON distribution.od_leak
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_leak_repaired();
COMMENT ON TRIGGER leak_repaired_trigger ON distribution.od_leak IS 'Trigger: updates the repaired status of the leak.';


