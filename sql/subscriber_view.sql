/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber view
*/

BEGIN;

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
		subscriber.geometry::geometry(Point,21781),	
		subscriber_type.name             AS _type ,
		districts.subscriber_prefix::varchar || '-' || subscriber.id_client::varchar AS id_client_full
		FROM distribution.subscriber
		INNER      JOIN distribution.subscriber_type ON subscriber.id_type         = subscriber_type.id 
		LEFT OUTER JOIN distribution.districts       ON subscriber._is_on_district = districts.name ;
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
