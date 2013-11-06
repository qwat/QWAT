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
		pipe.id_installmethod ,
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
		pipe.labelremark       ,
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
 		vl_pipe_function.value_fr          AS _function, 
 		vl_pipe_function.code_sire         AS _function_code_sire, 
		vl_pipe_installmethod.value_fr     AS _install_method,
		vl_pipe_material._displayname_fr   AS _material_name,
		vl_pipe_material.value_fr          AS _material_longname,
		vl_pipe_material.diameter          AS _material_diameter,
		vl_pipe_material.diameter_internal AS _material_diameter_internal,
		vl_pipe_material.diameter_external AS _material_diameter_external,
		vl_pipe_material.code_sire         AS _material_code_sire,
		distributor.name            AS _distributor,
		vl_precision.value_fr       AS _precision,
		vl_pipe_protection.value_fr AS _protection,
		vl_status.value_fr          AS _status,
		vl_status.active            AS _status_active,
		pressurezone.name           AS _pressurezone,
		pressurezone.shortname      AS _pressurezone_shortname,
		pressurezone.colorcode      AS _pressurezone_colorcode
		FROM distribution.pipe
		INNER      JOIN distribution.vl_pipe_function      ON pipe.id_function      = vl_pipe_function.id
		INNER      JOIN distribution.vl_pipe_installmethod ON pipe.id_installmethod = vl_pipe_installmethod.id
		INNER      JOIN distribution.vl_pipe_material      ON pipe.id_material      = vl_pipe_material.id
		INNER      JOIN distribution.distributor           ON pipe.id_distributor   = distributor.id
		INNER      JOIN distribution.vl_precision          ON pipe.id_precision     = vl_precision.id
		LEFT OUTER JOIN distribution.vl_pipe_protection    ON pipe.id_protection    = vl_pipe_protection.id
		INNER      JOIN distribution.vl_status             ON pipe.id_status        = vl_status.id
		LEFT OUTER JOIN distribution.pressurezone          ON pipe.id_pressurezone  = pressurezone.id 
		LEFT OUTER JOIN distribution.node AS node_a        ON pipe.id_node_a        = node_a.id
		LEFT OUTER JOIN distribution.node AS node_b        ON pipe.id_node_b        = node_b.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW distribution.pipe_view IS 'View for pipe. This view is not editable';


