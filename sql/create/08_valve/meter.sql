/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS distribution.meter CASCADE;
CREATE TABLE distribution.meter (id serial NOT NULL, CONSTRAINT meter_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.meter IS 'Table for meters.';

SELECT setval('distribution.meter_id_seq', 8000, true);

/* COLUMNS */
ALTER TABLE distribution.meter ADD COLUMN id_status integer default 1;          /* id_status     FK FULL */
ALTER TABLE distribution.meter ADD COLUMN id_pipe integer;						/* id_pipe       FK SIMPLE*/
ALTER TABLE distribution.meter ADD COLUMN identification varchar (12);
ALTER TABLE distribution.meter ADD COLUMN _identification_full varchar (16);
ALTER TABLE distribution.meter ADD COLUMN parcel varchar (12) ;
ALTER TABLE distribution.meter ADD COLUMN remarks text;

/* GEOMETRY */
SELECT distribution.geom_tool_point('meter',false,false,false,false,false);

/* CONSTRAINTS */
ALTER TABLE distribution.meter ADD CONSTRAINT pipe_id_status FOREIGN KEY (id_status) REFERENCES distribution.vl_status(id)      MATCH FULL  ; CREATE INDEX fki_id_status ON distribution.meter(id_status);
ALTER TABLE distribution.meter ADD CONSTRAINT meter_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES distribution.pipe (id)          MATCH SIMPLE; CREATE INDEX fki_id_pipe   ON distribution.meter(id_pipe)  ;


/* TRIGGER */
CREATE OR REPLACE FUNCTION distribution.meter_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		 UPDATE distribution.meter SET _identification_full = district.prefix||'_'||NEW.identification FROM distribution.district WHERE meter.id = NEW.id AND district.id = NEW.id_district ;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.meter_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER meter_fullid_trigger
	AFTER INSERT OR UPDATE OF id_district,identification ON distribution.meter
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.meter_fullid();
COMMENT ON TRIGGER meter_fullid_trigger ON distribution.meter IS 'Trigger: updates the full identification (district prefix) of the meter.';




