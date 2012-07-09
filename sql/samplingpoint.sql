/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/
BEGIN;

/* create */
DROP TABLE IF EXISTS distribution.samplingpoint CASCADE;
CREATE TABLE distribution.samplingpoint (id serial NOT NULL);
SELECT setval('distribution.samplingpoint_id_seq', 200, true);

/* columns */
ALTER TABLE distribution.samplingpoint ADD COLUMN  sige          integer       ;
ALTER TABLE distribution.samplingpoint ADD COLUMN  id_district      integer       ;
ALTER TABLE distribution.samplingpoint ADD COLUMN  id_pressurezone  integer       ;
ALTER TABLE distribution.samplingpoint ADD COLUMN  remarks          text          ;
ALTER TABLE distribution.samplingpoint ADD COLUMN  _is_on_map       varchar(30)   ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'samplingpoint', 'geometry', 21781, 'POINT', 2);                                                                                        
CREATE INDEX samplingpoint_geoidx ON distribution.samplingpoint USING GIST ( geometry );


/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.samplingpoint_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.samplingpoint SET 
			id_pressurezone    = distribution.get_pressurezone_id(NEW.geometry),
			id_district        = distribution.get_district_id(NEW.geometry),
			_is_on_map         = distribution.get_map(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.samplingpoint_geom() IS 'Fcn/Trigger: updates auto fields of the samplingpoint after insert/update.';

CREATE TRIGGER samplingpoint_geom_trigger_insert
	AFTER INSERT ON distribution.samplingpoint
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.samplingpoint_geom();
COMMENT ON TRIGGER samplingpoint_geom_trigger_insert ON distribution.samplingpoint IS 'Trigger: updates auto fields of the samplingpoint after insert.';

CREATE TRIGGER samplingpoint_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.samplingpoint 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.samplingpoint_geom();
COMMENT ON TRIGGER samplingpoint_geom_trigger_update ON distribution.samplingpoint IS 'Trigger: updates auto fields of the samplingpoint after geom update.';


COMMIT; 
