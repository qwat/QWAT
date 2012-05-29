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
		installations.status                            ,
		installations.remarks                           ,
		installations.geometry::geometry(Point,21781)   ,
		installations_type.name       AS _type_name     ,
		installations_type.short_name AS _type_shortname,
		owner.name AS _owner,
		CASE 
			WHEN installations.schema_force_view IS NULL THEN installations_type.schema_view
			ELSE installations.schema_force_view
		END AS _schema_view
	FROM distribution.installations 
	INNER      JOIN distribution.installations_type ON installations.id_type  = installations_type.id 
	LEFT OUTER JOIN distribution.owner              ON installations.id_owner = owner.id ;


/* TODO: rules */


COMMIT;
