/*
	qWat - QGIS Water Module

	SQL file :: subscriber table
*/


DROP TABLE IF EXISTS qwat.od_subscriber CASCADE;
CREATE TABLE qwat.od_subscriber (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_subscriber IS 'Table for subscriber.';



ALTER TABLE qwat.od_subscriber ADD COLUMN id_type              integer not null;
ALTER TABLE qwat.od_subscriber ADD COLUMN id_status            integer not null default 1301;
ALTER TABLE qwat.od_subscriber ADD COLUMN id_pipe              integer;
ALTER TABLE qwat.od_subscriber ADD COLUMN identification       varchar(12) default '' ;
ALTER TABLE qwat.od_subscriber ADD COLUMN _identification_full varchar(16) default '' ;
ALTER TABLE qwat.od_subscriber ADD COLUMN parcel               varchar(12) default '' ;
ALTER TABLE qwat.od_subscriber ADD COLUMN remark               text default '';

/* GEOMETRY                        (table_name,      is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_subscriber', false,   false,       false,            false,    false,         true);

/* CONSTRAINTS */
ALTER TABLE qwat.od_subscriber ADD CONSTRAINT subscriber_id_type  FOREIGN KEY (id_type)   REFERENCES qwat.vl_subscriber_type (id) MATCH FULL  ; CREATE INDEX fki_subscriber_id_type   ON qwat.od_subscriber(id_type)        ;
ALTER TABLE qwat.od_subscriber ADD CONSTRAINT pipe_id_status      FOREIGN KEY (id_status) REFERENCES qwat.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_subscriber_id_status ON qwat.od_subscriber(id_status)	  	;
ALTER TABLE qwat.od_subscriber ADD CONSTRAINT subscriber_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES qwat.od_pipe (id)            MATCH SIMPLE; CREATE INDEX fki_subscriber_id_pipe   ON qwat.od_subscriber(id_pipe)        ;


/* Trigger */
CREATE OR REPLACE FUNCTION qwat.ft_subscriber_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		 NEW._identification_full := od_district.prefix||'_'||NEW.identification FROM qwat.od_district WHERE od_district.id = NEW.id_district ;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat.ft_subscriber_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER tr_subscriber_fullid
	BEFORE INSERT OR UPDATE OF id_district,identification ON qwat.od_subscriber
	FOR EACH ROW
	EXECUTE PROCEDURE qwat.ft_subscriber_fullid();
COMMENT ON TRIGGER tr_subscriber_fullid ON qwat.od_subscriber IS 'Trigger: updates the full identification (district prefix) of the client.';




