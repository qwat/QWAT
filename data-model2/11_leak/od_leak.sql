/*
	qWat - QGIS Water Module
	
	SQL file :: leak arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_leak CASCADE;
CREATE TABLE qwat.od_leak (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_leak IS 'pipe leaks';

/* geometry */
SELECT qwat.fn_geom_tool_point('od_leak', false, false, false, true, true, true);

/* columns */
ALTER TABLE qwat.od_leak ADD COLUMN id_type        integer not null;
ALTER TABLE qwat.od_leak ADD COLUMN id_cause       integer;
ALTER TABLE qwat.od_leak ADD COLUMN id_damage      integer not null;
ALTER TABLE qwat.od_leak ADD COLUMN detection_date date;
ALTER TABLE qwat.od_leak ADD COLUMN repair_date    date;
ALTER TABLE qwat.od_leak ADD COLUMN _repaired      boolean;
ALTER TABLE qwat.od_leak ADD COLUMN address        text default '';
ALTER TABLE qwat.od_leak ADD COLUMN pipe_replaced  boolean;
ALTER TABLE qwat.od_leak ADD COLUMN description    text default '';
ALTER TABLE qwat.od_leak ADD COLUMN repair         text default '';

/* constraints */
ALTER TABLE qwat.od_leak ADD CONSTRAINT vl_leak_id_type   FOREIGN KEY (id_type)   REFERENCES qwat.vl_leak_type(id)   MATCH FULL;   CREATE INDEX fki_vl_leak_id_type   ON qwat.od_leak(id_type)  ;
ALTER TABLE qwat.od_leak ADD CONSTRAINT vl_leak_id_cause  FOREIGN KEY (id_cause)  REFERENCES qwat.vl_leak_cause(id)  MATCH SIMPLE; CREATE INDEX fki_vl_leak_id_cause  ON qwat.od_leak(id_cause) ;
ALTER TABLE qwat.od_leak ADD CONSTRAINT vl_leak_id_damage FOREIGN KEY (id_damage) REFERENCES qwat.vl_leak_damage(id) MATCH FULL;   CREATE INDEX fki_vl_leak_id_damage ON qwat.od_leak(id_damage);

/* Trigger */
CREATE OR REPLACE FUNCTION qwat.ft_leak_repaired() RETURNS trigger AS 
$BODY$
	BEGIN
		IF NEW.repair_date IS NULL THEN
			NEW._repaired := false;
		ELSE
			NEW._repaired := true;
		END IF;
		 RETURN NEW;
	END;
$BODY$LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.ft_leak_repaired() IS 'Fcn/Trigger: updates the repaired status of the leak.';

CREATE TRIGGER tr_leak_repaired
	BEFORE INSERT OR UPDATE OF repair_date ON qwat.od_leak
	FOR EACH ROW
	EXECUTE PROCEDURE qwat.ft_leak_repaired();
COMMENT ON TRIGGER tr_leak_repaired ON qwat.od_leak IS 'Trigger: updates the repaired status of the leak.';


