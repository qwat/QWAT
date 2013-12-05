/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS distribution.od_meter CASCADE;
CREATE TABLE distribution.od_meter (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_meter IS 'Table for meters.';

SELECT setval('distribution.od_meter_id_seq', 8000, true);

/* COLUMNS */
ALTER TABLE distribution.od_meter ADD COLUMN id_status integer default 1;          /* id_status     FK FULL */
ALTER TABLE distribution.od_meter ADD COLUMN id_pipe integer;						/* id_pipe       FK SIMPLE*/
ALTER TABLE distribution.od_meter ADD COLUMN identification varchar (12);
ALTER TABLE distribution.od_meter ADD COLUMN _identification_full varchar (16);
ALTER TABLE distribution.od_meter ADD COLUMN parcel varchar (12) ;
ALTER TABLE distribution.od_meter ADD COLUMN remark  text;

/* GEOMETRY                        (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_meter', false,  false,        false,            false,    false,         true);

/* CONSTRAINTS */
ALTER TABLE distribution.od_meter ADD CONSTRAINT pipe_id_status FOREIGN KEY (id_status) REFERENCES distribution.vl_status(id)      MATCH FULL  ; CREATE INDEX fki_id_status ON distribution.od_meter(id_status);
ALTER TABLE distribution.od_meter ADD CONSTRAINT meter_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES distribution.od_pipe (id)          MATCH SIMPLE; CREATE INDEX fki_id_pipe   ON distribution.od_meter(id_pipe)  ;


/* TRIGGER */
CREATE OR REPLACE FUNCTION distribution.od_meter_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		NEW._identification_full := od_district.prefix||'_'||NEW.identification FROM distribution.od_district WHERE od_district.id = NEW.id_district ;
		RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_meter_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER meter_fullid_trigger
	BEFORE INSERT OR UPDATE OF id_district,identification ON distribution.od_meter
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_meter_fullid();
COMMENT ON TRIGGER meter_fullid_trigger ON distribution.od_meter IS 'Trigger: updates the full identification (district prefix) of the meter.';




