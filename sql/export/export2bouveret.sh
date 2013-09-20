export db_address=172.24.171.203
export shapeoutput=/home/denis/Documents/out/bouveret

export PGCLIENTENCODING=ISO-8859-1
export PGCLIENTENCODING=LATIN1

export box="ST_SetSRID(ST_GeomFromText('POLYGON((554198.04386628104839474 138007.19270163495093584,556721.11053559719584882 137977.559368270507548,556708.41053558385465294 135687.3260325322044082,554189.57719960552640259 135755.05936593667138368,554198.04386628104839474 138007.19270163495093584))'),21781)"


rm $shapeoutput/*

 # vannes 
pgsql2shp -h $db_address -g geom -f $shapeoutput/vannes -P db4wat$ -u sige sige "\
SELECT \
 id   AS ID,               \
 identification                   AS id_sige,             \
 geometry::geometry(Point,21781) AS geom \
FROM distribution.valve WHERE ST_Intersects(geometry,$box)" 
read -p "Press any key to continue..."

 # hydrantes 
pgsql2shp -h $db_address -g geom -f $shapeoutput/hydrantes -P db4wat$ -u sige sige "\
SELECT \
 id   AS ID,               \
 identification                   AS id_sige,             \
 geometry::geometry(Point,21781) AS geom \
FROM distribution.hydrant_view WHERE _status_active IS TRUE AND ST_Intersects(geometry,$box)" 
read -p "Press any key to continue..."


# conduites
pgsql2shp -h $db_address -g geom -f $shapeoutput/conduites -P db4wat$ -u sige sige "\
SELECT                                         \
 id   AS ID,               \
 geometry::geometry(LineString,21781) AS geom, \
 _material_name          AS MATERIAU,      \
 _function_name AS FONCTION       \
FROM distribution.pipe_view WHERE _status_active IS TRUE AND ST_Intersects(geometry,$box)"
read -p "Press any key to continue..."
