/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.subscriber CASCADE;
CREATE TABLE distribution.subscriber (id serial NOT NULL);
COMMENT ON TABLE distribution.subscriber IS 'Table for subscriber. This should not be used for editing/viewing, as a more complete view (subscriber_view) exists.';

SELECT setval('distribution.subscriber_id_seq', 8000, true);

ALTER TABLE distribution.subscriber ADD COLUMN   id_type integer;                                   /* id_type       FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN   id_pipe integer;									/* id_pipe       FK SIMPLE*/ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_district integer;								/* id_district   FK SIMPLE */ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_pressurezone integer;					    	/* id_pressurezone FK SIMPLE */ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_client character varying (12);                  /* id_client */
ALTER TABLE distribution.subscriber ADD COLUMN   parcel character varying (12) ;                    /*  */
ALTER TABLE distribution.subscriber ADD COLUMN   _is_on_map character varying (80) DEFAULT '';      /* _is_on_map           */

SELECT AddGeometryColumn('distribution', 'subscriber', 'geometry', 21781, 'POINT', 2);                                                                                        
CREATE INDEX subscriber_geoidx ON distribution.subscriber USING GIST ( geometry );

/*----------------!!!---!!!----------------*/
/* Add constraints */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_pkey PRIMARY KEY (id); 
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.subscriber_type (id) MATCH FULL  ; CREATE INDEX fki_id_type         ON distribution.subscriber(id_type)        ;
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_pipe         FOREIGN KEY (id_pipe)         REFERENCES distribution.pipe (id)            MATCH SIMPLE; CREATE INDEX fki_id_pipe         ON distribution.subscriber(id_pipe)        ;
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_district     FOREIGN KEY (id_district)     REFERENCES distribution.district (id)        MATCH SIMPLE; CREATE INDEX fki_id_district     ON distribution.subscriber(id_district)    ;
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES distribution.pressurezone (id)    MATCH SIMPLE; CREATE INDEX fki_id_pressurezone ON distribution.subscriber(id_pressurezone);


/*----------------!!!---!!!----------------*/
/* INSERT / geometry UPDATE => get map */
CREATE OR REPLACE FUNCTION distribution.subscriber_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.subscriber SET 
			_is_on_map      = distribution.get_map(NEW.geometry),
			id_pressurezone = distribution.get_pressurezone_id(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.subscriber_geom() IS 'Fcn/Trigger: updates the disctrict and map of the subscriber after insert/update.';

CREATE TRIGGER subscriber_geom_trigger 
	AFTER INSERT OR UPDATE OF geometry ON distribution.subscriber
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.subscriber_geom();
COMMENT ON TRIGGER subscriber_geom_trigger ON distribution.subscriber IS 'Trigger: updates the disctrict and map of the subscriber after insert/update.';


/*----------------!!!---!!!----------------*/
/* if inserting without specifying id_district, it uses the get_district_id function */
CREATE OR REPLACE FUNCTION distribution.subscriber_insert() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.subscriber SET 
			id_district = distribution.get_district_id(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.subscriber_insert() IS 'Fcn/Trigger:  if inserting without specifying id_district, it uses the get_district_id function.';

CREATE TRIGGER subscriber_insert_trigger 
	AFTER INSERT ON distribution.subscriber
	FOR EACH ROW
	WHEN (NEW.id_district IS NULL)
	EXECUTE PROCEDURE distribution.subscriber_insert();
COMMENT ON TRIGGER subscriber_insert_trigger ON distribution.subscriber IS 'Trigger:  if inserting without specifying id_district, it uses the get_district_id function.';


COMMIT;

