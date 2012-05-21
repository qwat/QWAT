/*
	qWat - QGIS Water Module
	
	SQL file :: pipes view
*/

BEGIN;

DROP VIEW IF EXISTS distribution.pipes_view CASCADE;
CREATE VIEW distribution.pipes_view AS 
	SELECT  
		pipes.id				,
		pipes.id_parent         ,
		pipes.id_function       ,
		pipes.id_install_method ,
		pipes.id_material       ,
		pipes.id_owner          ,
		pipes.id_precision      ,
		pipes.id_protection     ,
		pipes.id_status         ,
		pipes.id_pressure_zone  ,
		pipes.id_node_a         ,
		pipes.id_node_b         ,
		pipes.schema_force_view ,
		pipes.year              ,
		pipes.tunnel_or_bridge  ,
		pipes.pressure_nominale ,
		pipes.folder            ,
		pipes.remarks           , 
		pipes._length2d         ,
		pipes._length3d         ,
		pipes._length3d_uptodate,
		pipes._is_on_map        ,
		pipes._is_on_district   ,
		pipes.geometry::geometry(LineString,21781),
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,
		pipes_function.function             AS _function_name, 
		pipes_install_method.name           AS _install_method,
		pipes_material._fancy_name          AS _material_name,
		pipes_material.name                 AS _material_longname,
		pipes_material.diameter             AS _material_diameter,
		pipes_material.diameter_internal    AS _material_diameter_internal,
		owner.name                          AS _owner,
		"precision".name                    AS _precision,
		pipes_protection.name               AS _protection,
		pipes_status.status                 AS _status_name,
		pipes_status.active                 AS _status_active,
		pressure_zones.name                 AS _pressure_zone,
		CASE 
			WHEN pipes.schema_force_view IS NULL THEN pipes_function.schema_view
			ELSE pipes.schema_force_view
		END AS _schema_view
		FROM distribution.pipes
		INNER JOIN distribution.pipes_function         ON pipes.id_function       = pipes_function.id
		INNER JOIN distribution.pipes_install_method   ON pipes.id_install_method = pipes_install_method.id
		INNER JOIN distribution.pipes_material         ON pipes.id_material       = pipes_material.id
		LEFT OUTER JOIN  distribution.owner            ON pipes.id_owner          = owner.id
		INNER JOIN distribution."precision"            ON pipes.id_precision      = "precision".id
		LEFT OUTER JOIN  distribution.pipes_protection ON pipes.id_protection     = pipes_protection.id
		INNER JOIN distribution.pipes_status           ON pipes.id_status         = pipes_status.id
		LEFT OUTER JOIN  distribution.pressure_zones   ON pipes.id_pressure_zone  = pressure_zones.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.pipes_view IS 'View for pipes. This view is editable (a rule exists to forwad changes to the table). 
		schema_view is a boolean to define if the pipes is visible in the schematic view. This field is usually determined by the pipe''s function attribute schema_view,
		but it can be overridden by the pipe''s attribute schema_force_view.';


/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE pipes_update AS
	ON UPDATE TO distribution.pipes_view DO INSTEAD
		UPDATE distribution.pipes SET 
			id_function        = NEW.id_function        ,
			id_material        = NEW.id_material        ,
			id_status          = NEW.id_status          ,
			id_owner           = NEW.id_owner           ,
			id_pressure_zone   = NEW.id_pressure_zone   ,
			id_precision       = NEW.id_precision       ,
			id_protection      = NEW.id_protection      ,
			id_install_method  = NEW.id_install_method  ,
			year               = NEW.year               ,
			tunnel_or_bridge   = NEW.tunnel_or_bridge   ,
			pressure_nominale  = NEW.pressure_nominale  ,
			schema_force_view  = NEW.schema_force_view  ,
			folder             = NEW.folder             ,
			remarks            = NEW.remarks            ,
			geometry       = NEW.geometry       ,
			id_parent          = NULLIF(NEW.id_parent,0)::integer	
		WHERE id = NEW.id;
CREATE OR REPLACE RULE pipes_insert AS
	ON INSERT TO distribution.pipes_view DO INSTEAD
		INSERT INTO distribution.pipes 
			(    id_function,    id_material,    id_status,    id_parent,    id_owner,    id_pressure_zone,    id_precision,    id_protection,    id_install_method,    year,    tunnel_or_bridge,    pressure_nominale,    schema_force_view,    folder,    remarks,    geometry)     
		VALUES
			(NEW.id_function,NEW.id_material,NEW.id_status,NEW.id_parent,NEW.id_owner,NEW.id_pressure_zone,NEW.id_precision,NEW.id_protection,NEW.id_install_method,NEW.year,NEW.tunnel_or_bridge,NEW.pressure_nominale,NEW.schema_force_view,NEW.folder,NEW.remarks,NEW.geometry);
CREATE OR REPLACE RULE pipes_delete AS
	ON DELETE TO distribution.pipes_view DO INSTEAD
		DELETE FROM distribution.pipes WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE pipes_update IS 'Rule to forward changes for pipes_view to the table pipes.';
COMMENT ON RULE pipes_insert IS 'Rule to forward insert of pipes_view to the table pipes.';
COMMENT ON RULE pipes_delete IS 'Rule to forward deletion of pipes_view to the table pipes.';

COMMIT;
