/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint view
*/



DROP VIEW IF EXISTS distribution.samplingpoint_view CASCADE;
CREATE VIEW distribution.samplingpoint_view AS 
	SELECT  
		samplingpoint.id             ,
		samplingpoint.identification        ,
		samplingpoint.id_district    ,
		samplingpoint.id_printmap    ,
		samplingpoint.id_pressurezone,
		samplingpoint._printmaps     ,
		samplingpoint._districts     ,
		samplingpoint.remarks        ,
		samplingpoint.geometry::geometry(Point,21781),
		district.name              AS _district,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
		pressurezone.colorcode     AS _pressurezone_colorcode
		FROM distribution.samplingpoint
		LEFT OUTER JOIN distribution.district      ON samplingpoint.id_district     = district.id       
		LEFT OUTER JOIN  distribution.pressurezone ON samplingpoint.id_pressurezone = pressurezone.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.samplingpoint_view IS 'View for samplingpoint. This view is editable (a rule exists to forwad changes to the table).';

--/*----------------!!!---!!!----------------*/
--/* INSERT,UPDATE,DELETE RULES */
--CREATE OR REPLACE RULE samplingpoint_update AS
--	ON UPDATE TO distribution.samplingpoint_view DO INSTEAD
--		UPDATE distribution.samplingpoint SET 
--			identification      = NEW.identification ,
--			remarks   = NEW.remarks 
--		WHERE id = NEW.id;
--CREATE OR REPLACE RULE samplingpoint_insert AS
--	ON INSERT TO distribution.samplingpoint_view DO INSTEAD
--		INSERT INTO distribution.samplingpoint 
--			(    identification,    remarks,    geometry)     
--		VALUES
--			(NEW.identification,NEW.remarks,NEW.geometry);
--CREATE OR REPLACE RULE samplingpoint_delete AS
--	ON DELETE TO distribution.samplingpoint_view DO INSTEAD
--		DELETE FROM distribution.samplingpoint WHERE id = OLD.id;
--/* Comments */	
--COMMENT ON RULE samplingpoint_update IS 'Rule to forward changes for samplingpoint_view to the table samplingpoint.';
--COMMENT ON RULE samplingpoint_insert IS 'Rule to forward insert of samplingpoint_view to the table samplingpoint.';
--COMMENT ON RULE samplingpoint_delete IS 'Rule to forward deletion of samplingpoint_view to the table samplingpoint.';


