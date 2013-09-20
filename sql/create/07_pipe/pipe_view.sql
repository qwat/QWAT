/*
	qWat - QGIS Water Module
	
	SQL file :: pipe view
*/



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
		pipe._valve_count      ,
		pipe._valve_closed     ,
		pipe._schema_view      ,
		pipe.id_node_a         ,
		pipe.id_node_b         ,
		pipe.id_district       ,
		pipe.id_pressurezone   ,
		pipe.id_printmap       ,
		pipe._length2d         ,
		pipe._length3d         ,
		pipe._diff_elevation   ,
		pipe._printmaps        ,
		pipe._districts        ,
		pipe.geometry::geometry(LineString,21781),
 		pipe_function.name              AS _function_name, 
 		pipe_function.code_sire         AS _function_code_sire, 
		pipe_install_method.name        AS _install_method,
		pipe_material._fancyname       AS _material_name,
		pipe_material.name              AS _material_longname,
		pipe_material.diameter          AS _material_diameter,
		pipe_material.diameter_internal AS _material_diameter_internal,
		pipe_material.code_sire         AS _material_code_sire,
		distributor.name                AS _distributor,
		"precision".name                AS _precision,
		pipe_protection.name            AS _protection,
		status.name                     AS _status_name,
		status.active                   AS _status_active,
		pressurezone.name               AS _pressurezone,
		pressurezone.shortname          AS _pressurezone_shortname,
		pressurezone.colorcode          AS _pressurezone_colorcode
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
COMMENT ON VIEW distribution.pipe_view IS 'View for pipe. This view is not editable';


