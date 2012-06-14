/*
	qWat - QGIS Water Module
	
	SQL file :: installations view
*/

BEGIN;


DROP VIEW IF EXISTS distribution.installations_view ;
CREATE VIEW distribution.installations_view AS 
	SELECT
		installations.id                                ,
		installations.name                              ,
		installations.id_type                           ,
		installations.id_distributor                    ,
		installations.id_status                         ,
		installations.remarks                           ,
		installations.geometry::geometry(Point,21781)   ,
		installations_type.name       AS _type          ,
		installations_type.short_name AS _type_shortname,
		status.status                 AS _status        ,
		status.active                 AS _status_active ,
		distributor.name              AS _distributor   ,
		CASE 
			WHEN installations.schema_force_view IS NULL THEN installations_type.schema_view
			ELSE installations.schema_force_view
		END AS _schema_view
	FROM distribution.installations 
	INNER      JOIN distribution.installations_type ON installations.id_type        = installations_type.id 
	INNER      JOIN distribution.status             ON installations.id_status      = status.id 
	LEFT OUTER JOIN distribution.distributor        ON installations.id_distributor = distributor.id ;


/* TODO: rules */


COMMIT;
