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
		installations.id_owner                          ,
		installations.id_status                         ,
		installations.remarks                           ,
		installations.geometry::geometry(Point,21781)   ,
		installations_type.name       AS _type          ,
		installations_type.short_name AS _type_shortname,
		installations_status.status   AS _status        ,
		installations_status.active   AS _status_active ,
		owner.name AS _owner,
		CASE 
			WHEN installations.schema_force_view IS NULL THEN installations_type.schema_view
			ELSE installations.schema_force_view
		END AS _schema_view
	FROM distribution.installations 
	INNER      JOIN distribution.installations_type   ON installations.id_type    = installations_type.id 
	INNER      JOIN distribution.installations_status ON installations.id_status  = installations_status.id 
	LEFT OUTER JOIN distribution.owner                ON installations.id_owner   = owner.id ;


/* TODO: rules */


COMMIT;
