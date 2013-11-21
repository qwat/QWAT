/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS distribution.vw_consumptionzone CASCADE;
CREATE VIEW distribution.vw_consumptionzone AS 
	SELECT 
		consumptionzone AS name, 
		ST_Multi(ST_CollectionHomogenize(ST_Union(geometry)))::geometry(MultiPolygon,21781)
	FROM distribution.od_pressurezone
	GROUP BY consumptionzone;

