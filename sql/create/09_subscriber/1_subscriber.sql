/*
	qWat - QGIS Water Module

	SQL file :: subscriber table
*/


DROP TABLE IF EXISTS distribution.subscriber CASCADE;
CREATE TABLE distribution.subscriber (id serial NOT NULL, CONSTRAINT subscriber_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.subscriber IS 'Table for subscriber.';

SELECT setval('distribution.subscriber_id_seq', 8000, true);

ALTER TABLE distribution.subscriber ADD COLUMN id_type integer;                                 /* id_type       FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN id_status integer default 1;                     /* id_status       FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN id_pipe integer;									/* id_pipe       FK SIMPLE*/
ALTER TABLE distribution.subscriber ADD COLUMN identification varchar (12);
ALTER TABLE distribution.subscriber ADD COLUMN _identification_full varchar (16);
ALTER TABLE distribution.subscriber ADD COLUMN parcel varchar (12) ;
ALTER TABLE distribution.subscriber ADD COLUMN remarks text;

/* GEOMETRY */
SELECT distribution.geom_tool_point('subscriber',false,false,false,false,false);

/* CONSTRAINTS */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_type  FOREIGN KEY (id_type)   REFERENCES distribution.vl_subscriber_type (id) MATCH FULL  ; CREATE INDEX fki_id_type   ON distribution.subscriber(id_type)        ;
ALTER TABLE distribution.subscriber ADD CONSTRAINT pipe_id_status      FOREIGN KEY (id_status) REFERENCES distribution.vl_status(id)           MATCH FULL  ; CREATE INDEX fki_id_status ON distribution.subscriber(id_status)	  	;
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_pipe  FOREIGN KEY (id_pipe)   REFERENCES distribution.pipe (id)            MATCH SIMPLE; CREATE INDEX fki_id_pipe   ON distribution.subscriber(id_pipe)        ;


/* Trigger */
CREATE OR REPLACE FUNCTION distribution.subscriber_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		 UPDATE distribution.subscriber SET _identification_full = district.prefix||'_'||NEW.identification FROM distribution.district WHERE subscriber.id = NEW.id AND district.id = NEW.id_district ;
		 RETURN NEW;
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.subscriber_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER subscriber_fullid_trigger
	AFTER INSERT OR UPDATE OF id_district,identification ON distribution.subscriber
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.subscriber_fullid();
COMMENT ON TRIGGER subscriber_fullid_trigger ON distribution.subscriber IS 'Trigger: updates the full identification (district prefix) of the client.';




