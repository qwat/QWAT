export db_address=172.24.171.203
export shapeoutput=/home/denis/Documents/PPDE/out

#export PGCLIENTENCODING=ISO-8859-1
export PGCLIENTENCODING=LATIN1
#export PGCLIENTENCODING=UTF8

rm $shapeoutput/*


# save schema in a table
#psql -h $db_address -U sige -c "DROP TABLE IF EXISTS qwat.vw_pipe_schema_temp; CREATE TABLE qwat.vw_pipe_schema_temp AS SELECT * FROM qwat.vw_pipe_schema_node;"
read -p "Press any key to continue..."

 # vannes
pgsql2shp -h $db_address -g geom -f $shapeoutput/vannes -P db4wat$ -u sige sige "\
SELECT \
 vw_valve.id,                              \
 'VA_' || vw_valve.id::varchar   AS IDTXT, \
 identification         AS identification,   \
 id_pipe                AS CONDUTE,          \
 id_node                AS NOEUD,            \
 closed                 AS FERMEE,           \
 diameter_nominal,                           \
 year,                                       \
 remark ,                                    \
 _districts,                                 \
 geometry::geometry(Point,21781) AS geom,    \
 _function,                                  \
 _type,                                      \
 _label,                                     \
 altitude_real,                              \
 _altitude_dtm,                              \
 _district AS COMMUNNE,                      \
 _pressurezone AS ZONE_PRES,                 \
 vl_precision.value_fr          AS PRECISIO  \
 FROM qwat.vw_valve  \
 INNER JOIN qwat.vl_precision ON vw_valve.id_precision = vl_precision.id\
 WHERE id_function != 6105 AND _schema_visible IS TRUE "
read -p "Press any key to continue..."

# zones
pgsql2shp -h $db_address -g geom -f $shapeoutput/zones -P db4wat$ -u sige sige "\
SELECT                                     \
 id AS ID,                                  \
 name AS NOM,                               \
 geometry::geometry(MultiPolygon,21781) AS geom  \
FROM qwat.od_pressurezone "
read -p "Press any key to continue..."

# conduites
pgsql2shp -h $db_address -g geom -f $shapeoutput/conduites -P db4wat$ -u sige sige "\
SELECT                                         \
 pipe_schema_temp.id,                          \
 'CO_' || pipe_schema_temp.id::varchar AS IDTXT,\
 geometry::geometry(LineString,21781) AS geom, \
 _length2d                        AS LONGU_2D,    \
 _length3d                        AS LONGU_3D,    \
 remark                           AS REMARQUE,    \
 vl_precision.value_fr            AS PRECISIO,    \
 vl_status.value_fr               AS STATUT,      \
 vl_pipe_function.value_fr        AS FONCTION,    \
 vl_pipe_function.code_sire       AS SIRE_FONCT,  \
 vl_pipe_material._displayname_fr AS MATERIAU,    \
 vl_pipe_material.code_sire       AS SIRE_MATER,  \
 vl_pipe_material.diameter_external AS DIAM_EXTER,\
 CASE                                             \
    WHEN vl_status.value_fr = 'fictif' THEN 20000 \
    ELSE vl_pipe_material.diameter_internal       \
 END AS DIAM_INT,                              \
 id_pressurezone             AS ZONE_PRES,     \
 _valve_closed               AS VAN_FERM,      \
 year                        AS ANNEE,         \
 id_node_a                   AS NOEUD_A,       \
 id_node_b                   AS NOEUD_B,       \
 NULL::varchar(10)           AS PRESSION,      \
 NULL::varchar(10)           AS RUGOSITE,      \
 NULL::boolean               AS CALC_HYD,      \
 NULL::boolean               AS A_DESAFE       \
FROM qwat.vw_pipe_schema_temp \
INNER      JOIN qwat.vl_pipe_function     ON pipe_schema_temp.id_function       = vl_pipe_function.id \
INNER      JOIN qwat.vl_pipe_material     ON pipe_schema_temp.id_material       = vl_pipe_material.id \
INNER      JOIN qwat.vl_precision         ON pipe_schema_temp.id_precision      = vl_precision.id \
INNER      JOIN qwat.vl_status            ON pipe_schema_temp.id_status         = vl_status.id "
# \
# WHERE id_distributor = 1 "
read -p "Press any key to continue..."



# noeuds
pgsql2shp -h $db_address -g geom -f $shapeoutput/noeuds -P db4wat$ -u sige sige "\
SELECT                                                           \
 id,                                      \
 'NO_' || id::varchar   AS IDTXT,               \
 altitude_dtm AS ALTITUDE,                                       \
 geometry::geometry(Point,21781) AS geom                         \
FROM qwat.node                                           \
WHERE _schema_visible IS TRUE                                       \
  AND _status_active IS TRUE                                     \
  AND id IN (                                                    \
    SELECT DISTINCT(id_node_a)                                   \
    FROM qwat.vw_pipe_schema_temp WHERE id_distributor = 1  \
    UNION SELECT DISTINCT(id_node_b)                             \
    FROM qwat.vw_pipe_schema_temp WHERE id_distributor = 1  \
  )                                                              \
  AND id NOT IN (                                                \
    SELECT id_node FROM qwat.od_installation_pump WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_installation_tank WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_installation_source WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_installation_treatment WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_installation_pressurecontrol WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_installation_valvechamber WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_hydrant WHERE id_node IS NOT NULL \
    UNION                                                        \
    SELECT id_node FROM qwat.od_valve_schema WHERE id_node IS NOT NULL AND ( closed IS TRUE OR _function = 'vanne de rÃ©gulation' ) \
  )
 "
read -p "Press any key to continue..."

# hydrante
# TODO: 8 Noville, retirer etrangers
pgsql2shp -h $db_address -g geom -f $shapeoutput/hydrantes -P db4wat$ -u sige sige "\
SELECT                                    \
 id,                                      \
 'HY_' || id::varchar   AS IDTXT,         \
 _district_shortname || '_' || identification AS ID_SIGE,\
 id_node        AS NOEUD,                 \
 year           AS ANNEE,                 \
 model          AS MODELE,                \
 remark         AS REMARQUE,              \
 underground    AS SOUTERRAIN,            \
 geometry::geometry(Point,21781) AS geom, \
 _distributor   AS FOURNISS,              \
 _status        AS STATUT,                \
 _status_active AS ACTIF,                 \
 _provider      AS DISTRIB,               \
 CASE                                     \
    WHEN altitude_real IS NOT NULL THEN altitude_real \
    ELSE _altitude_dtm                    \
 END            AS ALTITUDE,              \
 _district      AS COMMUNNE,              \
 _pressurezone  AS ZONE_PRES,             \
 pressure_static  AS PRESS_STA,           \
 pressure_dynamic  AS PRESS_DYN,          \
 flow  AS SOUTIRAGE,                      \
 observation_date  AS CALC_DATE,          \
 observation_source  AS CALC_SOURCE       \
FROM qwat.vw_hydrant"
read -p "Press any key to continue..."



# points de prélèvement
pgsql2shp -h $db_address -g geom -f $shapeoutput/point_prelev -P db4wat$ -u sige sige "\
SELECT                                    \
 id,                                      \
 'PP_' || id::varchar   AS IDTXT,         \
 identification AS ID_SIGE               ,\
 id_pressurezone AS ZONE_PRES            ,\
 remark         AS REMARQUE,              \
 geometry::geometry(Point,21781) AS geom, \
 _districts      AS COMMUNNE             \
FROM qwat.od_samplingpoint"
read -p "Press any key to continue..."
























#reservoir
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_reservoir -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_tank.id                                       ,\
 identification AS SIGE                   ,\
 'RE_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_tank.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES            ,\
CASE                                                                                 \
    WHEN installation_tank.id_overflow = 1 THEN 'en décharge'::VARCHAR(100)          \
    WHEN installation_tank.id_overflow = 2 THEN 'récupéré'::VARCHAR(100)             \
    ELSE 'inconnu'::VARCHAR(100)                                                     \
END AS TROPPLEIN,                                                                    \
CASE                                                                                 \
    WHEN installation_tank.id_firestorage = 1 THEN 'aucune'::VARCHAR(100)            \
    WHEN installation_tank.id_firestorage = 2 THEN 'cuve 1 entiere'::VARCHAR(100)    \
    WHEN installation_tank.id_firestorage = 3 THEN 'cave 1 partielle'::VARCHAR(100)  \
    WHEN installation_tank.id_firestorage = 4 THEN 'cuve 2 entiere'::VARCHAR(100)    \
    WHEN installation_tank.id_firestorage = 5 THEN 'cave 2 partielle'::VARCHAR(100)  \
    WHEN installation_tank.id_firestorage = 6 THEN '2 cuves partielles'::VARCHAR(100)\
    ELSE ''::VARCHAR(100)                                                            \
END AS RES_INCENDIE                                                                 ,\
node.altitude_dtm                      AS ALTI_DTM                                  ,\
installation_tank.storage_total        AS VOLUM_TOT                                 ,\
installation_tank.storage_supply       AS VOLUM_UTIL                                ,\
installation_tank.storage_fire         AS VOLUM_INCE                                ,\
installation_tank.altitude_overflow    AS ALT_TROPLEIN                              ,\
installation_tank.altitude_apron       AS ALT_RADIER                                ,\
installation_tank.height_max           AS HEIGHT_MAX                                ,\
installation_tank.fire_valve           AS FIRE_VALVE                                ,\
installation_tank.fire_remote          AS FIRE_REMOTE                               ,\
installation_tank._litrepercm          AS LITREPERCM                                ,\
installation_tank.cistern1_id_type     AS CUV1_TYPE                                 ,\
installation_tank.cistern1_dimension_1 AS CUV1_DIM1                                 ,\
installation_tank.cistern1_dimension_2 AS CUV1_DIM2                                 ,\
installation_tank.cistern1_storage     AS CUV1_VOLU                                 ,\
installation_tank._cistern1_litrepercm AS CUV1_LPCM                                 ,\
installation_tank.cistern2_id_type     AS CUV2_TYPE                                 ,\
installation_tank.cistern2_dimension_1 AS CUV2_DIM1                                 ,\
installation_tank.cistern2_dimension_2 AS CUV2_DIM2                                 ,\
installation_tank.cistern2_storage     AS CUV2_VOLU                                 ,\
installation_tank._cistern2_litrepercm AS CUV2_LPCM                                  \
FROM qwat.od_installation_tank INNER JOIN qwat.node ON installation_tank.id_node = node.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

#source
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_source -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_source.id                                       ,\
 identification AS SIGE                   ,\
 'SO_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 altitude_real                            ,\
 node.altitude_dtm AS ALTI_DTM            ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_source.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES            ,\
 id_type -1 AS GENRE   ,                     \
 id_quality -1 AS QUAL_CAPT   ,                     \
 flow_lowest  AS ETIAGE,                              \
 flow_mean    AS Q_MOY,                               \
 flow_concession  AS Q_CONCESS,                       \
 contract_end     AS FIN_CONCES,                      \
 gathering_chamber AS CHB_RASSEMB                     \
 FROM qwat.od_installation_source INNER JOIN qwat.node ON installation_source.id_node = node.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# traitement
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_traitement -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_treatment.id                                       ,\
 identification AS SIGE                   ,\
 'CT_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 altitude_real                            ,\
 node.altitude_dtm AS ALTI_DTM            ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_treatment.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES            ,\
 sanitization_uv     AS DESIN_UV                                ,\
 sanitization_chlorine_liquid DESIN_CL_L                        ,\
 sanitization_chlorine_gazeous DESIN_CL_G                       ,\
 sanitization_ozone        DESIN_O3                             ,\
 filtration_membrane          FILTR_MEM                         ,\
 filtration_sandorgravel      FILTR_SABL                        ,\
 flocculation                 FLOCULAT                          ,\
 activatedcharcoal            CHARB_ACT                         ,\
 settling                     DECANTAT                          ,\
 treatment_capacity           TRAIT_CAPA                        \
  FROM qwat.od_installation_treatment INNER JOIN qwat.node ON installation_treatment.id_node = node.id\
  WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# pompage
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_pompage -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_pump.id                     ,\
 identification AS SIGE                   ,\
 'PO_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 altitude_real                            ,\
 node.altitude_dtm AS ALTI_DTM            ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_pump.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES            ,\
 installation_pump.id_type -1         AS GENRE            ,\
 id_operating     AS FONCTION                             ,\
 no_pumps                                                 ,\
 rejected_flow    AS Q_REFOUL                             ,\
 manometric_height AS H_MANOMETR                          \
 FROM qwat.od_installation_pump  INNER JOIN qwat.node ON installation_pump.id_node = node.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# regul pression
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_regulpression -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_pressurecontrol.id          ,\
 identification AS SIGE                   ,\
 'RP_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 altitude_real                            ,\
 node.altitude_dtm AS ALTI_DTM            ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_pressurecontrol.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES            ,\
 CASE                                     \
        WHEN id_type = 1 THEN 'reducteur'             \
        WHEN id_type = 2 THEN 'coupe-pression'        \
        WHEN id_type = 3 THEN 'rassemblement'         \
        ELSE ''                                       \
 END AS type                                          \
 FROM qwat.od_installation_pressurecontrol  INNER JOIN qwat.node ON installation_pressurecontrol.id_node = node.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# chambres
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_chambvanne -P db4wat$ -u sige sige "\
SELECT                                     \
 installation_valvechamber.id             ,\
 identification AS SIGE                   ,\
 'RP_' || identification::varchar AS IDTXT,\
 id_node AS NOEUD                         ,\
  name                                    ,\
 id_distributor                           ,\
 remark                                   ,\
 year                                     ,\
 altitude_real                            ,\
 node.altitude_dtm AS ALTI_DTM            ,\
 open_water_surface                       ,\
 parcel                                   ,\
 eca                                      ,\
 installation_valvechamber.geometry::geometry(Point,21781) AS geom  ,\
 id_pressurezone AS ZONE_PRES             ,\
 networkseparation  AS SEPAR_RESO         ,\
 meter              AS COMPTEUR            \
 FROM qwat.od_installation_valvechamber  INNER JOIN qwat.node ON installation_valvechamber.id_node = node.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."
