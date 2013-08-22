export db_address=172.24.171.203
export shapeoutput=/home/denis/Documents/out

export PGCLIENTENCODING=ISO-8859-1
export PGCLIENTENCODING=LATIN1

export box="ST_SetSRID(ST_GeomFromText('POLYGON((555596.67549374 137153.37170785, 555543.19302103 137153.08672131, 555543.66799858 137110.33874135, 555597.62544885 137110.62372788, 555596.67549374 137153.37170785))'),21781)"


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
