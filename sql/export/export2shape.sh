export db_address=172.24.171.202
export shapeoutput=/home/denis/Documents/PPDE/out


# vannes: prendre fermée + vanne régulation/secour (fct) 

# save schema in a table
psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
read -p "Press any key to continue..."

 # vannes 
pgsql2shp -h $db_address -g geom -f $shapeoutput/vannes -P db4wat$ -u sige sige "\
SELECT \
 id ,                                        \
 sige,                                       \
 id_pipe,                                    \
 id_node,                                    \
 diameter_nominal,                           \
 year,                                       \
 closed,                                     \
 altitude_dtm,                               \
 altitude_real,                              \
 remarks,                                    \
 _is_on_map,                                 \
 _district,                                  \
 geometry::geometry(Point,21781) AS geom,    \
 _function,                                  \
 _type,                                      \
 _label                                      \
FROM distribution.valve_schema WHERE closed IS TRUE OR _function = 'vanne de régulation' " 
read -p "Press any key to continue..."

# zones
pgsql2shp -h $db_address -g geom -f $shapeoutput/zones -P db4wat$ -u sige sige "\
SELECT                                     \
 id AS ID,                                  \
 name AS NOM,                               \
 geometry::geometry(Polygon,21781) AS geom  \
FROM distribution.pressurezone "
read -p "Press any key to continue..."

# conduites
pgsql2shp -h $db_address -g geom -f $shapeoutput/conduites -P db4wat$ -u sige sige "\
SELECT                                          \
 id AS ID,                         \
 geometry::geometry(LineString,21781) AS geom, \
 _length2d AS LONGU_2D,                        \
 CASE WHEN _length3d_uptodate IS TRUE          \
  THEN _length3d                              \
  ELSE NULL                                   \
 END AS LONGU_3D,                              \
 remarks AS REMARQUE,                          \
 _precision AS PRECISIO,                       \
 _distributor AS DISTRIBU,                     \
 _function_name AS FONCTION,                   \
 _material_longname AS MATERIAU,               \
 _material_diameter_internal AS DIAM_INT,      \
 year AS ANNEE,                                \
 id_node_a AS NOEUD_A,                         \
 id_node_b AS NOEUD_B,                         \
 NULL::varchar(10) AS PRESSION,                \
 NULL::varchar(10) AS RUGOSITE,                \
 NULL::boolean AS CALC_HYD,                    \
 NULL::boolean AS A_DESAFE                     \
FROM distribution.pipe_schema_temp WHERE id_distributor = 1 "
read -p "Press any key to continue..."

# ouvrages
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages -P db4wat$ -u sige sige "\
SELECT                                      \
 id AS ID,                                  \
 geometry::geometry(Point,21781) AS geom,   \
 name AS NOM,                               \
 _type AS TYPE                              \
FROM distribution.installation_view"        
read -p "Press any key to continue..."

# noeuds
pgsql2shp -h $db_address -g geom -f $shapeoutput/noeuds -P db4wat$ -u sige sige "\
SELECT                                                           \
 id AS ID,                                                       \
 altitude_dtm AS ALTITUDE,                                       \
 geometry::geometry(Point,21781) AS geom                         \
FROM distribution.node                                           \
WHERE _schema_view IS TRUE                                       \
  AND _status_active IS TRUE                                     \
  AND id IN (                                                    \
    SELECT DISTINCT(id_node_a)                                   \
    FROM distribution.pipe_schema_temp WHERE id_distributor = 1  \
    UNION SELECT DISTINCT(id_node_b)                             \
    FROM distribution.pipe_schema_temp WHERE id_distributor = 1  \
  )                                                              \
  AND id NOT IN (                                                \
    SELECT id_node FROM distribution.installation                \
    UNION                                                        \
    SELECT id_node FROM distribution.hydrant                     \
    UNION                                                        \
    SELECT id_node FROM distribution.installation                \
  )
 "
read -p "Press any key to continue..."

# hydrantes
pgsql2shp -h $db_address -g geom -f $shapeoutput/hydrantes -P db4wat$ -u sige sige "\
SELECT                                    \
 id             AS ID,                    \
 sige           AS ID_SIGE,               \
 id_node        AS NOEUD,                 \
 year           AS ANNEE,                 \
 altitude       AS ALTITUDE,              \
 model          AS MODELE,                \
 remarks        AS REMARQUE,              \
 geometry::geometry(Point,21781) AS geom, \
 _type AS TYPE,                           \
 _distributor AS FOURNISS,                \
 _status_name AS STATUT,                  \
 _status_active AS ACTIF,                 \
 _provider AS DISTRIB,                    \
 _district AS COMMUNNE,                   \
 _pressurezone AS ZONE_PRES               \
FROM distribution.hydrant_view "
read -p "Press any key to continue..."
