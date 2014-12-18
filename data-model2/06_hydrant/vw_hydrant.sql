/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant view
*/



DROP VIEW IF EXISTS qwat.vw_hydrant CASCADE;
CREATE VIEW qwat.vw_hydrant AS 
	SELECT  
		od_hydrant.id             ,
		od_hydrant.identification ,
		od_hydrant.id_distributor ,
		od_hydrant.id_status      ,
		od_hydrant.id_provider    ,
		od_hydrant.year           ,
		od_hydrant.model          ,
		od_hydrant.underground    ,
		od_hydrant.altitude_real  ,
		od_hydrant.marked         ,
		od_hydrant.remark         ,
		od_hydrant.pressure_static   ,
		od_hydrant.pressure_dynamic  ,
		od_hydrant.flow              ,
		od_hydrant.observation_date  ,
		od_hydrant.observation_source,
		od_hydrant.id_node        ,
		od_hydrant.id_district    ,
		od_hydrant.id_pressurezone,
		od_hydrant.id_printmap    ,
		od_hydrant._printmaps     ,
		od_hydrant.geometry::geometry(Point,21781),
		od_distributor.name       AS _distributor,
		vl_status.value_fr        AS _status,
		vl_status.active          AS _status_active,
		vl_hydrant_provider.name  AS _provider,
		od_node.altitude_dtm      AS _altitude_dtm,
		od_district.name          AS _district,
		od_district.shortname     AS _district_shortname,
		od_pressurezone.name      AS _pressurezone,
		od_pressurezone.colorcode AS _pressurezone_colorcode
		FROM qwat.od_hydrant
		INNER JOIN qwat.od_distributor           ON od_hydrant.id_distributor  = od_distributor.id
		INNER JOIN qwat.vl_status                ON od_hydrant.id_status       = vl_status.id
		LEFT OUTER JOIN qwat.vl_hydrant_provider ON od_hydrant.id_provider     = vl_hydrant_provider.id
		LEFT OUTER JOIN qwat.od_node             ON od_hydrant.id_node         = od_node.id       
		LEFT OUTER JOIN qwat.od_district         ON od_hydrant.id_district     = od_district.id       
		LEFT OUTER JOIN qwat.od_pressurezone     ON od_hydrant.id_pressurezone = od_pressurezone.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW qwat.vw_hydrant IS 'View for hydrant. This view is editable (a rule exists to forward changes to the table).';

