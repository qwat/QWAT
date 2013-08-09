/*
	qWat - QGIS Water Module
	
	SQL file :: leak arcs
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.leak CASCADE;
CREATE TABLE distribution.leak (id serial NOT NULL);
COMMENT ON TABLE distribution.leak IS 'pipe leaks';

/* geometry */
SELECT distribution.geom_tool_point('leak', false, false, false, true, true);

/* columns */
ALTER TABLE distribution.leak ADD COLUMN id_type integer;
ALTER TABLE distribution.leak ADD COLUMN id_cause integer;
ALTER TABLE distribution.leak ADD COLUMN id_damage integer;
ALTER TABLE distribution.leak ADD COLUMN detection_date date;
ALTER TABLE distribution.leak ADD COLUMN repair_date date;
ALTER TABLE distribution.leak ADD COLUMN _repaired boolean;
ALTER TABLE distribution.leak ADD COLUMN address text;
ALTER TABLE distribution.leak ADD COLUMN pipe_replaced boolean;
ALTER TABLE distribution.leak ADD COLUMN description text;
ALTER TABLE distribution.leak ADD COLUMN repair text;

/* primary key */
ALTER TABLE distribution.leak ADD CONSTRAINT leak_pkey PRIMARY KEY (id);

/* Trigger */
CREATE OR REPLACE FUNCTION distribution.leak_repaired() RETURNS trigger AS 
$BODY$
	BEGIN
		 UPDATE distribution.leak SET _repaired = CASE WHEN repair_date IS NULL THEN false ELSE true END 
			WHERE id = NEW.id;
		 RETURN NEW;
	END;
$BODY$LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.leak_repaired() IS 'Fcn/Trigger: updates the repaired status of the leak.';

CREATE TRIGGER leak_repaired_trigger
	AFTER INSERT OR UPDATE OF repair_date ON distribution.leak
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.leak_repaired();
COMMENT ON TRIGGER leak_repaired_trigger ON distribution.leak IS 'Trigger: updates the repaired status of the leak.';

COMMIT;
