/*
	qWat - QGIS Water Module
	
	SQL file :: installation view
*/




DROP VIEW IF EXISTS distribution.installation_view ;
CREATE VIEW distribution.installation_view AS 
	SELECT
		installation.id                                 ,
		installation.name                               ,
		installation.identification                               ,
		installation.id_status                          ,
		installation.id_distributor                     ,
		installation.remarks                            ,
		installation.links                              ,
		installation.year                               ,
		installation.altitude_real                      ,
		installation.open_water_surface                 ,
		installation.parcel                             ,
		installation.eca                                ,
		installation.id_node                            ,
		installation.id_district                        ,
		installation.id_pressurezone                    ,
		installation.id_printmap                        ,
		installation._printmaps                         ,
		installation._districts                         ,
		installation._schema_view                       ,
		installation.geometry::geometry(Point,21781)    ,
		installation_type.name      AS _type            ,
		installation_type.shortname AS _type_shortname  ,
		status.status               AS _status          ,
		status.active               AS _status_active   ,
		distributor.name            AS _distributor     ,
		node.altitude_dtm          AS _altitude_dtm,
		district.name              AS _district,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
		pressurezone.colorcode     AS _pressurezone_colorcode
	FROM distribution.installation 
	INNER      JOIN distribution.installation_type ON installation.id_type         = installation_type.id 
	INNER      JOIN distribution.status            ON installation.id_status       = status.id 
	LEFT OUTER JOIN distribution.distributor       ON installation.id_distributor  = distributor.id 
	LEFT OUTER JOIN distribution.node              ON installation.id_node         = node.id       
	LEFT OUTER JOIN distribution.district          ON installation.id_district     = district.id       
	LEFT OUTER JOIN distribution.pressurezone      ON installation.id_pressurezone = pressurezone.id;

-- no rules


