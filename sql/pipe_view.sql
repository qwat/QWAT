/*
	qWat - QGIS Water Module
	
	SQL file :: pipe view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.pipe_view CASCADE;
CREATE VIEW distribution.pipe_view AS 
	SELECT  
		pipe.id                ,
		pipe.id_parent         ,
		pipe.id_function       ,
		pipe.id_install_method ,
		pipe.id_material       ,
		pipe.id_distributor    ,
		pipe.id_precision      ,
		pipe.id_protection     ,
		pipe.id_status         ,
		pipe.schema_force_view ,
		pipe.year              ,
		pipe.tunnel_or_bridge  ,
		pipe.pressure_nominal  ,
		pipe.folder            ,
		pipe.remarks           ,
		pipe.id_node_a         ,
		pipe.id_node_b         ,
		pipe.id_district       ,
		pipe.id_pressurezone   ,
		pipe.id_printmap       ,
		pipe._length2d         ,
		pipe._length3d         ,
		pipe._printmaps        ,
		pipe._districts        ,
		pipe.geometry::geometry(LineString,21781),
 		pipe_function.function          AS _function_name, 
		pipe_install_method.name        AS _install_method,
		pipe_material._fancy_name       AS _material_name,
		pipe_material.name              AS _material_longname,
		pipe_material.diameter          AS _material_diameter,
		pipe_material.diameter_internal AS _material_diameter_internal,
		distributor.name                AS _distributor,
		"precision".name                AS _precision,
		pipe_protection.name            AS _protection,
		status.status                   AS _status_name,
		status.active                   AS _status_active,
		pressurezone.name               AS _pressurezone,
		pressurezone.shortname          AS _pressurezone_shortname,
		pressurezone.colorcode          AS _pressurezone_colorcode,
		CASE 
			WHEN pipe.schema_force_view IS NULL THEN pipe_function.schema_view
			ELSE pipe.schema_force_view
		END AS _schema_view,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN 0
			ELSE abs(node_a.altitude_dtm-node_b.altitude_dtm)
		END AS _diff_elevation,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN NULL
			ELSE abs(node_a.altitude_dtm-node_b.altitude_dtm)/_length3d
		END AS _slope,
		distribution.pipe_count_valve(pipe.id) AS _valve_count,
		distribution.pipe_isClosed(pipe.id)    AS _valve_closed
		FROM distribution.pipe
		INNER      JOIN distribution.pipe_function       ON pipe.id_function       = pipe_function.id
		INNER      JOIN distribution.pipe_install_method ON pipe.id_install_method = pipe_install_method.id
		INNER      JOIN distribution.pipe_material       ON pipe.id_material       = pipe_material.id
		INNER      JOIN distribution.distributor         ON pipe.id_distributor    = distributor.id
		INNER      JOIN distribution."precision"         ON pipe.id_precision      = "precision".id
		LEFT OUTER JOIN distribution.pipe_protection     ON pipe.id_protection     = pipe_protection.id
		INNER      JOIN distribution.status              ON pipe.id_status         = status.id
		LEFT OUTER JOIN distribution.pressurezone        ON pipe.id_pressurezone   = pressurezone.id 
		LEFT OUTER JOIN distribution.node AS node_a      ON pipe.id_node_a         = node_a.id
		LEFT OUTER JOIN distribution.node AS node_b      ON pipe.id_node_b         = node_b.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.pipe_view IS 'View for pipe. This view is editable (a rule exists to forwad changes to the table). 
		schema_view is a boolean to define if the pipe is visible in the schematic view. This field is usually determined by the pipe''s function attribute schema_view,
		but it can be overridden by the pipe''s attribute schema_force_view.';


/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE pipe_update AS
	ON UPDATE TO distribution.pipe_view DO INSTEAD
		UPDATE distribution.pipe SET 
			id_function        = NEW.id_function        ,
			id_material        = NEW.id_material        ,
			id_status          = NEW.id_status          ,
			id_distributor     = NEW.id_distributor     ,
			id_pressurezone    = NEW.id_pressurezone    ,
			id_precision       = NEW.id_precision       ,
			id_protection      = NEW.id_protection      ,
			id_install_method  = NEW.id_install_method  ,
			year               = NEW.year               ,
			tunnel_or_bridge   = NEW.tunnel_or_bridge   ,
			pressure_nominal   = NEW.pressure_nominal   ,
			schema_force_view  = NEW.schema_force_view  ,
			folder             = NEW.folder             ,
			remarks            = NEW.remarks            ,
			geometry           = NEW.geometry           ,
			id_parent          = NULLIF(NEW.id_parent,0)::integer	
		WHERE id = NEW.id;
CREATE OR REPLACE RULE pipe_insert AS
	ON INSERT TO distribution.pipe_view DO INSTEAD
		INSERT INTO distribution.pipe 
			(    id_function,    id_material,    id_status,    id_parent,    id_distributor,    id_pressurezone,    id_precision,    id_protection,    id_install_method,    year,    tunnel_or_bridge,    pressure_nominal,    schema_force_view,    folder,    remarks,    geometry)     
		VALUES
			(NEW.id_function,NEW.id_material,NEW.id_status,NEW.id_parent,NEW.id_distributor,NEW.id_pressurezone,NEW.id_precision,NEW.id_protection,NEW.id_install_method,NEW.year,NEW.tunnel_or_bridge,NEW.pressure_nominal,NEW.schema_force_view,NEW.folder,NEW.remarks,NEW.geometry);
CREATE OR REPLACE RULE pipe_delete AS
	ON DELETE TO distribution.pipe_view DO INSTEAD
		DELETE FROM distribution.pipe WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE pipe_update IS 'Rule to forward changes for pipe_view to the table pipe.';
COMMENT ON RULE pipe_insert IS 'Rule to forward insert of pipe_view to the table pipe.';
COMMENT ON RULE pipe_delete IS 'Rule to forward deletion of pipe_view to the table pipe.';

COMMIT;
