/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.hydrant_view CASCADE;
CREATE VIEW distribution.hydrant_view AS 
	SELECT  
		hydrant.id             ,
		hydrant.sige           ,
		hydrant.id_type        ,
		hydrant.id_distributor ,
		hydrant.id_status      ,
		hydrant.id_provider    ,
		hydrant.id_node        ,
		hydrant.id_district    ,
		hydrant.id_pressurezone,
		hydrant.year           ,
		hydrant.model          ,
		hydrant.altitude_real  ,
		hydrant.remarks        ,
		hydrant._is_on_map     ,
		hydrant.geometry::geometry(Point,21781),
		hydrant_type.name          AS _type, 
		distributor.name           AS _distributor,
		status.status              AS _status_name,
		status.active              AS _status_active,
		hydrant_provider.name      AS _provider,
		node.altitude_dtm          AS _altitude_dtm,
		district.name              AS _district,
		district.shortname         AS _district_shortname,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
		pressurezone.consummerzone AS _consummerzone,
		pressurezone.colorcode     AS _pressurezone_colorcode
		FROM distribution.hydrant
		INNER JOIN distribution.hydrant_type          ON hydrant.id_type         = hydrant_type.id
		INNER JOIN distribution.distributor           ON hydrant.id_distributor  = distributor.id
		INNER JOIN distribution.status                ON hydrant.id_status       = status.id
		LEFT OUTER JOIN distribution.hydrant_provider ON hydrant.id_provider     = hydrant_provider.id
		LEFT OUTER JOIN distribution.node             ON hydrant.id_node         = node.id       
		LEFT OUTER JOIN distribution.district         ON hydrant.id_district     = district.id       
		LEFT OUTER JOIN distribution.pressurezone     ON hydrant.id_pressurezone = pressurezone.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.hydrant_view IS 'View for hydrant. This view is editable (a rule exists to forwad changes to the table).';

/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE hydrant_update AS
	ON UPDATE TO distribution.hydrant_view DO INSTEAD
		UPDATE distribution.hydrant SET 
			sige            = NEW.sige               ,
			id_type         = NEW.id_type            ,
			id_status       = NEW.id_status          ,
			id_distributor  = NEW.id_distributor     ,
			id_provider     = NEW.id_provider        ,
			id_district     = NEW.id_district        ,
			id_pressurezone = NEW.id_pressurezone    ,
			id_node         = NEW.id_node            ,
			year            = NEW.year               ,
			model           = NEW.model              ,
			altitude_real   = NEW.altitude_real      ,
			remarks         = NEW.remarks            ,
			geometry        = NEW.geometry
		WHERE id = NEW.id;
CREATE OR REPLACE RULE hydrant_insert AS
	ON INSERT TO distribution.hydrant_view DO INSTEAD
		INSERT INTO distribution.hydrant 
			(    sige,    id_type,    id_status,    id_distributor,    id_provider,    id_district,    id_pressurezone,    id_node,    year,    model,    altitude_real,    remarks,    geometry)     
		VALUES
			(NEW.sige,NEW.id_type,NEW.id_status,NEW.id_distributor,NEW.id_provider,NEW.id_district,NEW.id_pressurezone,NEW.id_node,NEW.year,NEW.model,NEW.altitude_real,NEW.remarks,NEW.geometry);
CREATE OR REPLACE RULE hydrant_delete AS
	ON DELETE TO distribution.hydrant_view DO INSTEAD
		DELETE FROM distribution.hydrant WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE hydrant_update IS 'Rule to forward changes for hydrant_view to the table hydrant.';
COMMENT ON RULE hydrant_insert IS 'Rule to forward insert of hydrant_view to the table hydrant.';
COMMENT ON RULE hydrant_delete IS 'Rule to forward deletion of hydrant_view to the table hydrant.';

COMMIT;
