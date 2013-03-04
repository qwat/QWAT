export db_address=172.24.171.203
export shapeoutput=/home/denis/Documents/PPDE/out

export PGCLIENTENCODING=ISO-8859-1
export PGCLIENTENCODING=LATIN1


rm $shapeoutput/*

# vannes: prendre fermée + vanne régulation/secour (fct) 

# save schema in a table
psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
read -p "Press any key to continue..."

 # vannes 
pgsql2shp -h $db_address -g geom -f $shapeoutput/vannes -P db4wat$ -u sige sige "\
SELECT \
 'VA_' || id::varchar   AS ID,               \
 sige                   AS SIGE,             \
 id_pipe                AS CONDUTE,          \
 id_node                AS NOEUD,            \
 diameter_nominal,                           \
 year,                                       \
 '2' AS closed,                              \
 remarks,                                    \
 _districts,                                 \
 geometry::geometry(Point,21781) AS geom,    \
 _function,                                  \
 _type,                                      \
 _label,                                     \
 CASE                                        \
    WHEN altitude_real IS NOT NULL THEN altitude_real \
    ELSE _altitude_dtm                       \
 END AS ALTITUDE,                            \
 _district AS COMMUNNE,                      \
 _pressurezone AS ZONE_PRES                  \
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
SELECT                                         \
 'CO_' || id::varchar        AS ID,            \
 geometry::geometry(LineString,21781) AS geom, \
 _length2d                   AS LONGU_2D,      \
 _length3d                   AS LONGU_3D,      \
 remarks                     AS REMARQUE,      \
 _precision                  AS PRECISIO,      \
 _status_name                AS STATUT,        \
 _function_name              AS FONCTION,      \
 _material_longname          AS MATERIAU,      \
 CASE \
    WHEN _status_name = 'fictif' THEN 20000::varchar \
    ELSE _material_diameter_internal \
 END AS DIAM_INT,      \
 _pressurezone               AS ZONE_PRES,     \
 _valve_closed               AS VAN_FERM,      \
 year                        AS ANNEE,         \
 id_node_a                   AS NOEUD_A,       \
 id_node_b                   AS NOEUD_B,       \
 NULL::varchar(10)           AS PRESSION,      \
 NULL::varchar(10)           AS RUGOSITE,      \
 NULL::boolean               AS CALC_HYD,      \
 NULL::boolean               AS A_DESAFE       \
FROM distribution.pipe_schema_temp WHERE id_distributor = 1 "
read -p "Press any key to continue..."

# ouvrages
# TODO proprio etrangers
#export ouvtype=( "Inconnu" "Réservoir" "Source" "Pompage" "Chambres de vannes" "Chambre compteur" "Chambre de traitement" "Chambre réducteur" "Chambre coupe pression" "Chambre de rassemblement")
export ouvtype=(I R S P CV CC CT CR CCP CRA)
for i in "${ouvtype[@]}"
do :
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_${i// /_} -P db4wat$ -u sige sige "\
SELECT                                      \
 'OU_' || id::varchar   AS ID,              \
 id_node AS NOEUD,                          \
 geometry::geometry(Point,21781) AS geom,   \
 _type_shortname || '. ' || name    AS NOM, \
 _type   AS TYPE,                           \
 CASE                                       \
    WHEN altitude_real IS NOT NULL THEN altitude_real \
    ELSE _altitude_dtm                      \
 END           AS ALTITUDE,                 \
 _districts     AS COMMUNNE,                 \
 _pressurezone AS ZONE_PRES                 \
FROM distribution.installation_view WHERE _type_shortname = '$i' AND id_distributor=1 AND _status_active IS TRUE"        
done
read -p "Press any key to continue..."

# noeuds
pgsql2shp -h $db_address -g geom -f $shapeoutput/noeuds -P db4wat$ -u sige sige "\
SELECT                                                           \
 'NO_' || id::varchar   AS ID,               \
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
    SELECT id_node FROM distribution.installation WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM distribution.hydrant WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM distribution.valve_schema WHERE id_node IS NOT NULL AND ( closed IS TRUE OR _function = 'vanne de régulation' ) \
  )
 "
read -p "Press any key to continue..."
    
# hydrante
# TODO: bouche arrosage, 8 Noville, retirer etrangers
pgsql2shp -h $db_address -g geom -f $shapeoutput/hydrantes -P db4wat$ -u sige sige "\
SELECT                                    \
 'HY_' || id::varchar   AS ID,               \
 _district_shortname || '_' || sige AS ID_SIGE,\
 id_node        AS NOEUD,                 \
 year           AS ANNEE,                 \
 model          AS MODELE,                \
 remarks        AS REMARQUE,              \
 geometry::geometry(Point,21781) AS geom, \
 _type          AS TYPE,                  \
 _distributor   AS FOURNISS,              \
 _status_name   AS STATUT,                \
 _status_active AS ACTIF,                 \
 _provider      AS DISTRIB,               \
 CASE                                     \
    WHEN altitude_real IS NOT NULL THEN altitude_real \
    ELSE _altitude_dtm                    \
 END            AS ALTITUDE,              \
 _district      AS COMMUNNE,              \
 _pressurezone  AS ZONE_PRES              \
FROM distribution.hydrant_view WHERE id_type = 1"
read -p "Press any key to continue..."
