/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat.od_meter CASCADE;
CREATE TABLE qwat.od_meter (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_meter IS 'Table for meters.';



/* COLUMNS */
ALTER TABLE qwat.od_meter ADD COLUMN id_status integer not null;
ALTER TABLE qwat.od_meter ADD COLUMN id_pipe integer;
ALTER TABLE qwat.od_meter ADD COLUMN identification varchar(12) default '';
ALTER TABLE qwat.od_meter ADD COLUMN _identification_full varchar(16) default '';
ALTER TABLE qwat.od_meter ADD COLUMN parcel varchar(12) default '' ;
ALTER TABLE qwat.od_meter ADD COLUMN remark  text default '';
ALTER TABLE qwat.od_meter ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);

/* GEOMETRY                           (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_meter', false,    false,      false,            false,    true,         true);

/* CONSTRAINTS */
ALTER TABLE qwat.od_meter ADD CONSTRAINT pipe_id_status FOREIGN KEY (id_status) REFERENCES qwat.vl_status(id) MATCH FULL  ; CREATE INDEX fki_id_status ON qwat.od_meter(id_status);
ALTER TABLE qwat.od_meter ADD CONSTRAINT meter_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES qwat.od_pipe (id)  MATCH SIMPLE; CREATE INDEX fki_id_pipe   ON qwat.od_meter(id_pipe)  ;


/* TRIGGER */
CREATE OR REPLACE FUNCTION qwat.ft_meter_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		NEW._identification_full := od_district.prefix||'_'||NEW.identification FROM qwat.od_district WHERE od_district.id = NEW.id_district ;
		RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.ft_meter_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER tr_meter_fullid
	BEFORE INSERT OR UPDATE OF id_district,identification ON qwat.od_meter
	FOR EACH ROW
	EXECUTE PROCEDURE qwat.ft_meter_fullid();
COMMENT ON TRIGGER tr_meter_fullid ON qwat.od_meter IS 'Trigger: updates the full identification (district prefix) of the meter.';




