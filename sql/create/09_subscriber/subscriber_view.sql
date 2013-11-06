/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber view
*/



DROP VIEW IF EXISTS distribution.subscriber_view CASCADE;
CREATE VIEW distribution.subscriber_view AS 
	SELECT 
		subscriber.id			   ,
		subscriber.id_type         ,
		subscriber.id_pipe         ,
		subscriber.client_identification       ,
		subscriber._client_identification_full ,
		subscriber.parcel          ,
		subscriber.id_district     ,
		subscriber.id_pressurezone ,
		subscriber.id_printmap     ,
		subscriber._printmaps      ,
		subscriber._districts      ,
		subscriber.geometry::geometry(Point,21781),	
		vl_subscriber_type.value_fr AS _type     ,
		district.name               AS _district ,
		pressurezone.name           AS _pressurezone,
		pressurezone.shortname      AS _pressurezone_shortname,
		pressurezone.colorcode      AS _pressurezone_colorcode
		FROM distribution.subscriber
		INNER      JOIN distribution.vl_subscriber_type ON subscriber.id_type         = vl_subscriber_type.id 
		LEFT OUTER JOIN distribution.district           ON subscriber.id_district     = district.id
		LEFT OUTER JOIN distribution.pressurezone       ON subscriber.id_pressurezone = pressurezone.id;
/* Comment */	
COMMENT ON VIEW distribution.subscriber_view IS 'View for subscriber. This view is editable (a rule exists to forward changes to the table).';


--/*----------------!!!---!!!----------------*/
--/* INSERT,UPDATE,DELETE RULES */
--
--CREATE OR REPLACE RULE subscriber_update AS
--	ON UPDATE TO distribution.subscriber_view DO INSTEAD
--		UPDATE distribution.subscriber SET 
--			id_type     = NEW.id_type                      ,
--			id_pipe     = NULLIF(NEW.id_pipe,0)::integer   ,
--			id_client   = NEW.id_client                    ,
--			id_district = NEW.id_district                  ,
--			parcel      = NEW.parcel                       ,
--			geometry    = NEW.geometry
--		WHERE id = NEW.id;
--CREATE OR REPLACE RULE subscriber_insert AS
--	ON INSERT TO distribution.subscriber_view DO INSTEAD
--		INSERT INTO distribution.subscriber 
--			(    id_type,    id_pipe,    id_client,    id_district,    parcel,    geometry)
--		VALUES
--			(NEW.id_type,NEW.id_pipe,NEW.id_client,NEW.id_district,NEW.parcel,NEW.geometry);
--CREATE OR REPLACE RULE subscriber_delete AS
--	ON DELETE TO distribution.subscriber_view DO INSTEAD
--		DELETE FROM distribution.subscriber WHERE id = OLD.id;
--/* Comments */	
--COMMENT ON RULE subscriber_update IS 'Rule to forward changes for subscriber_view to the table subscriber.';
--COMMENT ON RULE subscriber_insert IS 'Rule to forward insert of subscriber_view to the table subscriber.';
--COMMENT ON RULE subscriber_delete IS 'Rule to forward deletion of subscriber_view to the table subscriber.';


