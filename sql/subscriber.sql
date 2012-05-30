/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.subscriber CASCADE;
CREATE TABLE distribution.subscriber (id serial NOT NULL);
SELECT setval('distribution.subscriber_id_seq', 8000, true);

ALTER TABLE distribution.subscriber ADD COLUMN   id_type integer;                                      /* id_parent         FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN   id_pipe integer;									/* id_function       FK SIMPLE*/ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_district integer;									/* id_district       FK SIMPLE */ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_client character varying (12);                              /*  */
ALTER TABLE distribution.subscriber ADD COLUMN   parcel character varying (12) ;                                    /*  */
ALTER TABLE distribution.subscriber ADD COLUMN   _is_on_map character varying (80) DEFAULT '';                      /* _is_on_map           */

SELECT AddGeometryColumn('distribution', 'subscriber', 'geometry', 21781, 'POINT', 2);                                                                                        


/*----------------!!!---!!!----------------*/
/* Add constraints */
/* primary key */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_pkey PRIMARY KEY (id);
/* id_type */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_type FOREIGN KEY (id_type) REFERENCES distribution.subscriber_type (id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_type ON distribution.subscriber(id_type);
/* id_pipe */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_pipe FOREIGN KEY (id_pipe) REFERENCES distribution.pipes (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_pipe ON distribution.subscriber(id_pipe);
/* GIST index*/
CREATE INDEX subscriber_geoidx ON distribution.subscriber USING GIST ( geometry );

/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON TABLE distribution.subscriber IS 'Table for subscriber. This should not be used for editing/viewing, as a more complete view (subscriber_view) exists.';

/*----------------!!!---!!!----------------*/
/* INSERT / geometry UPDATE */
CREATE OR REPLACE FUNCTION distribution.subscriber_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.subscriber SET 
			_is_on_map      = distribution.get_map(NEW.geometry)
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



/* INSERT without id_district */
CREATE OR REPLACE FUNCTION distribution.subscriber_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.subscriber SET 
			id_district = distribution.get_district_id(NEW.geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.subscriber_geom() IS 'Fcn/Trigger: updates the disctrict and map of the subscriber after insert/update.';

CREATE TRIGGER subscriber_insert_trigger 
	AFTER INSERT ON distribution.subscriber
	FOR EACH ROW
	WHEN (NEW.id_district IS NULL)
	EXECUTE PROCEDURE distribution.subscriber_geom();
COMMENT ON TRIGGER subscriber_geom_trigger ON distribution.subscriber IS 'Trigger: updates the disctrict and map of the subscriber after insert/update.';


COMMIT;

