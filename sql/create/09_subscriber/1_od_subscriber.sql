/*
	qWat - QGIS Water Module

	SQL file :: subscriber table
*/


DROP TABLE IF EXISTS distribution.od_subscriber CASCADE;
CREATE TABLE distribution.od_subscriber (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_subscriber IS 'Table for subscriber.';

SELECT setval('distribution.od_subscriber_id_seq', 8000, true);

ALTER TABLE distribution.od_subscriber ADD COLUMN id_type              integer not null;
ALTER TABLE distribution.od_subscriber ADD COLUMN id_status            integer not null default 1301;
ALTER TABLE distribution.od_subscriber ADD COLUMN id_pipe              integer;
ALTER TABLE distribution.od_subscriber ADD COLUMN identification       varchar(12) default '' ;
ALTER TABLE distribution.od_subscriber ADD COLUMN _identification_full varchar(16) default '' ;
ALTER TABLE distribution.od_subscriber ADD COLUMN parcel               varchar(12) default '' ;
ALTER TABLE distribution.od_subscriber ADD COLUMN remark               text default '';

/* GEOMETRY                        (table_name,      is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_subscriber', false,   false,       false,            false,    false,         true);

/* CONSTRAINTS */
ALTER TABLE distribution.od_subscriber ADD CONSTRAINT subscriber_id_type  FOREIGN KEY (id_type)   REFERENCES distribution.vl_subscriber_type (id) MATCH FULL  ; CREATE INDEX fki_subscriber_id_type   ON distribution.od_subscriber(id_type)        ;
ALTER TABLE distribution.od_subscriber ADD CONSTRAINT pipe_id_status      FOREIGN KEY (id_status) REFERENCES distribution.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_subscriber_id_status ON distribution.od_subscriber(id_status)	  	;
ALTER TABLE distribution.od_subscriber ADD CONSTRAINT subscriber_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES distribution.od_pipe (id)            MATCH SIMPLE; CREATE INDEX fki_subscriber_id_pipe   ON distribution.od_subscriber(id_pipe)        ;


/* Trigger */
CREATE OR REPLACE FUNCTION distribution.od_subscriber_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		 NEW._identification_full := od_district.prefix||'_'||NEW.identification FROM distribution.od_district WHERE od_district.id = NEW.id_district ;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.od_subscriber_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER subscriber_fullid_trigger
	BEFORE INSERT OR UPDATE OF id_district,identification ON distribution.od_subscriber
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.od_subscriber_fullid();
COMMENT ON TRIGGER subscriber_fullid_trigger ON distribution.od_subscriber IS 'Trigger: updates the full identification (district prefix) of the client.';




