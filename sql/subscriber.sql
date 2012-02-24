/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber table and view
*/
BEGIN;
DROP TABLE IF EXISTS distribution.subscriber CASCADE;
CREATE TABLE distribution.subscriber (id serial NOT NULL);
SELECT setval('distribution.subscriber_id_seq', 8000, true);

ALTER TABLE distribution.subscriber ADD COLUMN   id_type integer;                                      /* id_parent         FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN   id_pipe integer;									/* id_function       FK SIMPLE*/ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_client character varying (12);                              /*  */
ALTER TABLE distribution.subscriber ADD COLUMN   parcel character varying (12) ;                                    /*  */
ALTER TABLE distribution.subscriber ADD COLUMN   _is_on_map character varying (80) DEFAULT '';                      /* _is_on_map           */
ALTER TABLE distribution.subscriber ADD COLUMN   _is_on_district character varying (100) DEFAULT '';                /* _is_on_district      */

                                                                                                         
ALTER TABLE distribution.subscriber ADD COLUMN   wkb_geometry geometry;                                  /* wkb_geometry         */



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
/* Geometry */
ALTER TABLE distribution.subscriber ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.subscriber ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'POINT'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.subscriber ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
/* GIST index*/
CREATE INDEX subscriber_geoidx ON distribution.subscriber USING GIST ( wkb_geometry );

/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON TABLE distribution.subscriber IS 'Table for subscriber. This should not be used for editing/viewing, as a more complete view (subscriber_view) exists.';

/*----------------!!!---!!!----------------*/
/* Trigger for 2d length, map and district update */
CREATE OR REPLACE FUNCTION distribution.subscriber_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.subscriber SET 
			_is_on_map      = distribution.get_map(NEW.wkb_geometry),
			_is_on_district = distribution.get_district(NEW.wkb_geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.subscriber_geom() IS 'Fcn/Trigger: updates the disctrict and map of the subscriber after insert/update.';

CREATE TRIGGER subscriber_geom_trigger 
	AFTER INSERT OR UPDATE OF wkb_geometry ON distribution.subscriber
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.subscriber_geom();
COMMENT ON TRIGGER subscriber_geom_trigger ON distribution.subscriber IS 'Trigger: updates the disctrict and map of the subscriber after insert/update.';



/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/* SUBSCRIBER VIEW */
DROP VIEW IF EXISTS distribution.subscriber_view CASCADE;
CREATE VIEW distribution.subscriber_view AS 
	SELECT 
		subscriber.id				,
		subscriber.id_type         ,
		subscriber.id_pipe         ,
		subscriber.id_client       ,
		subscriber.parcel          ,
		subscriber._is_on_map      ,
		subscriber._is_on_district ,
		subscriber.wkb_geometry::geometry(Point,21781),	
		subscriber_type.name             AS _type 
		FROM distribution.subscriber
		LEFT OUTER JOIN  distribution.subscriber_type            ON subscriber.id_type          = subscriber_type.id;
/* Comment */	
COMMENT ON VIEW distribution.subscriber_view IS 'View for subscriber. This view is editable (a rule exists to forward changes to the table).';


/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE subscriber_update AS
	ON UPDATE TO distribution.subscriber_view DO INSTEAD
		UPDATE distribution.subscriber SET 
			id_type    = NEW.id_type                   ,
			id_pipe    = NULLIF(NEW.id_pipe,0)::integer,
			id_client  = NEW.id_client                 ,
			parcel     = NEW.parcel
		WHERE id = NEW.id;
CREATE OR REPLACE RULE subscriber_insert AS
	ON INSERT TO distribution.subscriber_view DO INSTEAD
		INSERT INTO distribution.subscriber 
			(    id_type,    id_pipe,    id_client,    parcel)
		VALUES
			(NEW.id_type,NEW.id_pipe,NEW.id_client,NEW.parcel);
CREATE OR REPLACE RULE subscriber_delete AS
	ON DELETE TO distribution.subscriber_view DO INSTEAD
		DELETE FROM distribution.subscriber WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE subscriber_update IS 'Rule to forward changes for subscriber_view to the table subscriber.';
COMMENT ON RULE subscriber_insert IS 'Rule to forward insert of subscriber_view to the table subscriber.';
COMMENT ON RULE subscriber_delete IS 'Rule to forward deletion of subscriber_view to the table subscriber.';

COMMIT;

