/*
	qWat - QGIS Water Module
	
	SQL file :: protection zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS distribution.vw_printmap CASCADE;
CREATE VIEW distribution.vw_printmap AS 
	SELECT 
		od_printmap.*, 
		od_district.name || ' ' || od_printmap.name AS _longname,
		od_district.name AS _district,
		od_district.shortname AS _district_short
	FROM distribution.od_printmap
	INNER JOIN distribution.od_district ON od_printmap.id_district = od_district.id ;

