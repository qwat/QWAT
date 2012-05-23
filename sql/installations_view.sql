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
		installations.status                          ,
		installations.remarks                          ,
		installations.geometry::geometry(Point,21781)   ,
		installations_type.name       AS _type_name     ,
		installations_type.short_name AS _type_shortname
	FROM distribution.installations 
	INNER JOIN distribution.installations_type ON installations.id_type = installations_type.id ;


/* TODO: rules */


COMMIT;
