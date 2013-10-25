/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant view
*/



DROP VIEW IF EXISTS distribution.hydrant_view CASCADE;
CREATE VIEW distribution.hydrant_view AS 
	SELECT  
		hydrant.id             ,
		hydrant.identification ,
		hydrant.id_distributor ,
		hydrant.id_status      ,
		hydrant.id_provider    ,
		hydrant.year           ,
		hydrant.model          ,
		hydrant.underground    ,
		hydrant.altitude_real  ,
		hydrant.remarks        ,
		hydrant.id_node        ,
		hydrant.id_district    ,
		hydrant.id_pressurezone,
		hydrant.id_printmap    ,
		hydrant._printmaps     ,
		hydrant._districts     ,
		hydrant.geometry::geometry(Point,21781),
		hydrant_type.name          AS _type, 
		distributor.name           AS _distributor,
		status.name                AS _status_name,
		status.active              AS _status_active,
		hydrant_provider.name      AS _provider,
		node.altitude_dtm          AS _altitude_dtm,
		district.name              AS _district,
		district.shortname         AS _district_shortname,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
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

