/*
	qWat - QGIS Water Module
	
	SQL file :: installation view
*/

BEGIN;


DROP VIEW IF EXISTS distribution.installation_view ;
CREATE VIEW distribution.installation_view AS 
	SELECT
		installation.id                                 ,
		installation.name                               ,
		installation.sige                               ,
		installation.id_status                          ,
		installation.id_distributor                     ,
		installation.id_type                            ,
		installation.id_node                            ,
		installation.id_district                        ,
		installation.id_pressurezone                    ,
		installation.remarks                            ,
		installation.links                              ,
		installation.year                               ,
		installation.altitude_real                      ,
		installation._is_on_map                         ,
		installation.open_water_surface                 ,
		installation.parcel                             ,
		installation.eca                                ,
		installation.geometry::geometry(Point,21781)    ,
		installation_type.name       AS _type           ,
		installation_type.short_name AS _type_shortname ,
		status.status                 AS _status        ,
		status.active                 AS _status_active ,
		distributor.name              AS _distributor   ,
		CASE 
			WHEN installation.schema_force_view IS NULL THEN installation_type.schema_view
			ELSE installation.schema_force_view
		END AS _schema_view,
		node.altitude_dtm          AS _altitude_dtm,
		district.name              AS _district,
		pressurezone.name          AS _pressurezone,
		pressurezone.shortname     AS _pressurezone_shortname,
		pressurezone.consummerzone AS _consummerzone,
		pressurezone.colorcode     AS _pressurezone_colorcode
	FROM distribution.installation 
	INNER      JOIN distribution.installation_type ON installation.id_type         = installation_type.id 
	INNER      JOIN distribution.status            ON installation.id_status       = status.id 
	LEFT OUTER JOIN distribution.distributor       ON installation.id_distributor  = distributor.id 
	LEFT OUTER JOIN distribution.node              ON installation.id_node         = node.id       
	LEFT OUTER JOIN distribution.district          ON installation.id_district     = district.id       
	LEFT OUTER JOIN distribution.pressurezone      ON installation.id_pressurezone = pressurezone.id;


/* TODO: rules */


COMMIT;
