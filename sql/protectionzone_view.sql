/*
	qWat - QGIS Water Module
	
	SQL file :: protection view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.protectionzone_view CASCADE;
CREATE VIEW distribution.protectionzone_view AS 
	SELECT 
		protectionzone.id			   ,
		protectionzone.id_type         ,
		protectionzone.name            ,
		protectionzone.validated       ,
		protectionzone.date            ,
		protectionzone.agent           ,
		protectionzone.geometry::geometry(MultiPolygon,21781),	
		protectionzone_type.name  AS _type
		FROM distribution.protectionzone
		INNER JOIN distribution.protectionzone_type ON protectionzone.id_type = protectionzone_type.id;
/* Comment */	
COMMENT ON VIEW distribution.protectionzone_view IS 'View for protectionzone. This view is editable (a rule exists to forward changes to the table).';


/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE protectionzone_update AS
	ON UPDATE TO distribution.protectionzone_view DO INSTEAD
		UPDATE distribution.protectionzone SET 
			id_type    = NEW.id_type  ,
			name       = NEW.name     ,
			validated  = NEW.validated,
			date       = NEW.date     ,
			agent      = NEW.agent    ,
			geometry   = NEW.geometry
		WHERE id = NEW.id;
CREATE OR REPLACE RULE protectionzone_insert AS
	ON INSERT TO distribution.protectionzone_view DO INSTEAD
		INSERT INTO distribution.protectionzone 
			(    id_type,    name,    validated,    date,    agent,    geometry)
		VALUES
			(NEW.id_type,NEW.name,NEW.validated,NEW.date,NEW.agent,NEW.geometry);
CREATE OR REPLACE RULE protectionzone_delete AS
	ON DELETE TO distribution.protectionzone_view DO INSTEAD
		DELETE FROM distribution.protectionzone WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE protectionzone_update IS 'Rule to forward changes for protectionzone_view to the table protectionzone.';
COMMENT ON RULE protectionzone_insert IS 'Rule to forward insert of protectionzone_view to the table protectionzone.';
COMMENT ON RULE protectionzone_delete IS 'Rule to forward deletion of protectionzone_view to the table protectionzone.';

COMMIT;
