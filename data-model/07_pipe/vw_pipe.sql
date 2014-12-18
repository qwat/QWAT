/*
	qWat - QGIS Water Module
	
	SQL file :: pipe view
*/



DROP VIEW IF EXISTS qwat.vw_pipe CASCADE;
CREATE VIEW qwat.vw_pipe AS 
	SELECT  
		od_pipe.id                ,
		od_pipe.id_parent         ,
		od_pipe.id_function       ,
		od_pipe.id_installmethod  ,
		od_pipe.id_material       ,
		od_pipe.id_distributor    ,
		od_pipe.id_precision      ,
		od_pipe.id_protection     ,
		od_pipe.id_status         ,
		od_pipe.schema_force_view ,
		od_pipe.year              ,
		od_pipe.tunnel_or_bridge  ,
		od_pipe.pressure_nominal  ,
		od_pipe.folder            ,
		od_pipe.labelremark       ,
		od_pipe.remark            ,
		od_pipe._valve_count      ,
		od_pipe._valve_closed     ,
		od_pipe._schema_visible   ,
		od_pipe.id_node_a         ,
		od_pipe.id_node_b         ,
		od_pipe.id_district       ,
		od_pipe.id_pressurezone   ,
		od_pipe.id_printmap       ,
		od_pipe._length2d         ,
		od_pipe._length3d         ,
		od_pipe._diff_elevation   ,
		od_pipe._printmaps        ,
		od_pipe._district         ,
		od_pipe.geometry::geometry(LineString,21781),
 		vl_pipe_function.value_fr          AS _function, 
 		vl_pipe_function.code_sire         AS _function_code_sire, 
		vl_pipe_installmethod.value_fr     AS _installmethod,
		vl_pipe_material._displayname_fr   AS _material_name,
		vl_pipe_material.value_fr          AS _material_longname,
		vl_pipe_material.diameter          AS _material_diameter,
		vl_pipe_material.diameter_internal AS _material_diameter_internal,
		vl_pipe_material.diameter_external AS _material_diameter_external,
		vl_pipe_material.code_sire         AS _material_code_sire,
		od_distributor.name         AS _distributor,
		vl_precision.value_fr       AS _precision,
		vl_pipe_protection.value_fr AS _protection,
		vl_status.value_fr          AS _status,
		vl_status.active            AS _status_active,
		od_pressurezone.name        AS _pressurezone,
		od_pressurezone.colorcode   AS _pressurezone_colorcode
		FROM qwat.od_pipe
		INNER      JOIN qwat.vl_pipe_function      ON od_pipe.id_function      = vl_pipe_function.id
		INNER      JOIN qwat.vl_pipe_installmethod ON od_pipe.id_installmethod = vl_pipe_installmethod.id
		INNER      JOIN qwat.vl_pipe_material      ON od_pipe.id_material      = vl_pipe_material.id
		INNER      JOIN qwat.od_distributor        ON od_pipe.id_distributor   = od_distributor.id
		INNER      JOIN qwat.vl_precision          ON od_pipe.id_precision     = vl_precision.id
		LEFT OUTER JOIN qwat.vl_pipe_protection    ON od_pipe.id_protection    = vl_pipe_protection.id
		INNER      JOIN qwat.vl_status             ON od_pipe.id_status        = vl_status.id
		LEFT OUTER JOIN qwat.od_pressurezone       ON od_pipe.id_pressurezone  = od_pressurezone.id 
		LEFT OUTER JOIN qwat.od_node AS node_a     ON od_pipe.id_node_a        = node_a.id
		LEFT OUTER JOIN qwat.od_node AS node_b     ON od_pipe.id_node_b        = node_b.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW qwat.vw_pipe IS 'View for pipe. This view is not editable';


