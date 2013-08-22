export db_address=172.24.171.203
export shapeoutput=/home/denis/Documents/PPDE/out

#export PGCLIENTENCODING=ISO-8859-1
export PGCLIENTENCODING=LATIN1
#export PGCLIENTENCODING=UTF8


rm $shapeoutput/*

# vannes: prendre fermÃ©e + vanne rÃ©gulation/secour (fct)

# save schema in a table
psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
read -p "Press any key to continue..."

 # vannes
pgsql2shp -h $db_address -g geom -f $shapeoutput/vannes -P db4wat$ -u sige sige "\
SELECT \
 'VA_' || id::varchar   AS ID,               \
 identification                   AS identification,             \
 id_pipe                AS CONDUTE,          \
 id_node                AS NOEUD,            \
 diameter_nominal,                           \
 year,                                       \
 '2'::integer AS closed,                              \
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
FROM distribution.valve_schema WHERE closed IS TRUE OR _function = 'vanne de rÃ©gulation' "
read -p "Press any key to continue..."

# zones
pgsql2shp -h $db_address -g geom -f $shapeoutput/zones -P db4wat$ -u sige sige "\
SELECT                                     \
 id AS ID,                                  \
 name AS NOM,                               \
 geometry::geometry(MultiPolygon,21781) AS geom  \
FROM distribution.pressurezone "
read -p "Press any key to continue..."

# conduites
pgsql2shp -h $db_address -g geom -f $shapeoutput/conduites -P db4wat$ -u sige sige "\
SELECT                                         \
 'CO_' || pipe_schema_temp.id::varchar        AS ID,            \
 geometry::geometry(LineString,21781) AS geom, \
 _length2d                   AS LONGU_2D,      \
 _length3d                   AS LONGU_3D,      \
 remarks                     AS REMARQUE,      \
 precision.name              AS PRECISIO,      \
 status.name                 AS STATUT,        \
 pipe_function.name          AS FONCTION,      \
 pipe_function.code_sire     AS SIRE_FONCT,      \
 pipe_material.name          AS MATERIAU,      \
 pipe_material.code_sire     AS SIRE_MATER,      \
 CASE \
    WHEN status.name = 'fictif' THEN 20000::varchar \
    ELSE pipe_material.diameter_internal \
 END AS DIAM_INT,      \
 id_pressurezone             AS ZONE_PRES,     \
 _valve_closed                     AS VAN_FERM,      \
 year                        AS ANNEE,         \
 id_node_a                   AS NOEUD_A,       \
 id_node_b                   AS NOEUD_B,       \
 NULL::varchar(10)           AS PRESSION,      \
 NULL::varchar(10)           AS RUGOSITE,      \
 NULL::boolean               AS CALC_HYD,      \
 NULL::boolean               AS A_DESAFE       \
FROM distribution.pipe_schema_temp \
INNER      JOIN distribution.pipe_function       ON pipe_schema_temp.id_function       = pipe_function.id \
INNER      JOIN distribution.pipe_material       ON pipe_schema_temp.id_material       = pipe_material.id \
INNER      JOIN distribution.precision         ON pipe_schema_temp.id_precision      = precision.id \
INNER      JOIN distribution.status              ON pipe_schema_temp.id_status         = status.id \
WHERE id_distributor = 1 "
read -p "Press any key to continue..."

#reservoir
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_reservoir -P db4wat$ -u sige sige "\
SELECT                                      \
 'RE_' || identification::varchar   AS ID,              \
 id_node AS NOEUD,                          \
 installation_tank.geometry::geometry(Point,21781) AS geom,   \
 installation.remarks || installation_tank.remarks              AS REMARKS         , \
CASE                                                                                  \
    WHEN installation_tank.id_overflow = 1 THEN 'alimentation commandée'::VARCHAR(100)    \
    WHEN installation_tank.id_overflow = 2 THEN 'en décharge'::VARCHAR(100)               \
    WHEN installation_tank.id_overflow = 3 THEN 'récupéré'::VARCHAR(100)                  \
    ELSE 'inconnu'::VARCHAR(100)                                                          \
END AS TROPPLEIN,                                                                         \
CASE                                                                                      \
    WHEN installation_tank.id_firestorage = 1 THEN 'aucune'::VARCHAR(100)                 \
    WHEN installation_tank.id_firestorage = 2 THEN 'cuve 1 entiere'::VARCHAR(100)         \
    WHEN installation_tank.id_firestorage = 3 THEN 'cave 1 partielle'::VARCHAR(100)       \
    WHEN installation_tank.id_firestorage = 4 THEN 'cuve 2 entiere'::VARCHAR(100)         \
    WHEN installation_tank.id_firestorage = 5 THEN 'cave 2 partielle'::VARCHAR(100)       \
    WHEN installation_tank.id_firestorage = 6 THEN '2 cuves partielles'::VARCHAR(100)     \
    ELSE ''::VARCHAR(100)                                                                 \
END AS RES_INCENDIE,                                                                      \
installation_tank.storage_total        AS VOLUM_TOT      ,                               \
installation_tank.storage_supply       AS VOLUM_UTIL  ,                               \
installation_tank.storage_fire         AS VOLUM_INCE    ,                               \
installation_tank.altitude_overflow    AS ALT_TROPLEIN   ,                           \
installation_tank.altitude_apron       AS ALT_RADIER      ,                           \
installation_tank.height_max           AS HEIGHT_MAX          ,                           \
installation_tank.fire_valve           AS FIRE_VALVE          ,                           \
installation_tank.fire_remote          AS FIRE_REMOTE         ,                           \
installation_tank._litrepercm          AS LITREPERCM         ,                           \
installation_tank.cistern1_id_type     AS CUV1_TYPE    ,                           \
installation_tank.cistern1_dimension_1 AS CUV1_DIM1,                           \
installation_tank.cistern1_dimension_2 AS CUV1_DIM2,                           \
installation_tank.cistern1_storage     AS CUV1_VOLU    ,                           \
installation_tank._cistern1_litrepercm AS CUV1_LPCM,                           \
installation_tank.cistern2_id_type     AS CUV2_TYPE    ,                                             \
installation_tank.cistern2_dimension_1 AS CUV2_DIM1,                                                 \
installation_tank.cistern2_dimension_2 AS CUV2_DIM2,                                                 \
installation_tank.cistern2_storage     AS CUV2_VOLU    ,                                             \
installation_tank._cistern2_litrepercm AS CUV2_LPCM                                                 \
FROM distribution.installation_tank INNER JOIN distribution.installation ON installation_tank.id_installation = installation.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

#source
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_source -P db4wat$ -u sige sige "\
SELECT                                      \
 'SR_' || identification::varchar   AS ID,  \
 name,                                      \
 id_node AS NOEUD,                          \
 installation_source.geometry::geometry(Point,21781) AS geom,\
 installation_source.id_type    ,                     \
 CASE                                                 \
        WHEN id_quality = 1 THEN 'a'                  \
        WHEN id_quality = 2 THEN 'b'                  \
        WHEN id_quality = 3 THEN 'c'                  \
        ELSE ''                                       \
 END,                                                 \
 altitude       ,                                     \
 flow_lowest  AS ETIAGE,                              \
 flow_mean    AS Q_MOY,                               \
 flow_concession  AS Q_CONCESS,                       \
 contract_end     AS FIN_CONCES,                      \
 gathering_chamber AS CHB_RASSEMB,                    \
 installation.remarks || installation_source.remarks      AS REMARQUE  \
FROM distribution.installation_source INNER JOIN distribution.installation ON installation_source.id_installation = installation.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# traitement
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_traitement -P db4wat$ -u sige sige "\
SELECT                                      \
 'TR_' || identification::varchar   AS ID,  \
 name,                                      \
 id_node AS NOEUD,                          \
 installation_treatment.geometry::geometry(Point,21781) AS geom,\
altitude                                                       ,\
sanitization_uv     AS DESIN_UV                                ,\
sanitization_chlorine_liquid DESIN_CL_L                        ,\
sanitization_chlorine_gazeous DESIN_CL_G                       ,\
sanitization_ozone        DESIN_O3                             ,\
filtration_membrane          FILTR_MEM                         ,\
filtration_sandorgravel      FILTR_SABL                        ,\
flocculation                 FLOCULAT                          ,\
activatedcharcoal            CHARB_ACT                         ,\
settling                     DECANTAT                          ,\
treatment_capacity           TRAIT_CAPA                        ,\
 installation.remarks || installation_treatment.remarks        \
 FROM distribution.installation_treatment INNER JOIN distribution.installation ON installation_treatment.id_installation = installation.id\
 WHERE id_distributor=1 AND id_status = 1"
read -p "Press any key to continue..."

# pompage
pgsql2shp -h $db_address -g geom -f $shapeoutput/ouvrages_pompage -P db4wat$ -u sige sige "\
SELECT                                      \
 'PO_' || identification::varchar   AS ID,  \
 name,                                      \
 id_node AS NOEUD,                          \
 installation_pump.geometry::geometry(Point,21781) AS geom,\
 installation_pump.id_type          AS TYPE               ,\
 id_operating     AS FONCTION                             ,\
 altitude                                                 ,\
 nb_pump                                                  ,\
 rejected_flow    AS Q_REFOUL                             ,\
 manometric_height AS H_MANOMETR                          ,\
  installation.remarks || installation_pump.remarks       \
 FROM distribution.installation_pump INNER JOIN distribution.installation ON installation_pump.id_installation = installation.id\
 WHERE id_distributor=1 AND id_status = 1"
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
    SELECT id_node FROM distribution.valve_schema WHERE id_node IS NOT NULL AND ( closed IS TRUE OR _function = 'vanne de rÃ©gulation' ) \
  )
 "
read -p "Press any key to continue..."

# hydrante
# TODO: bouche arrosage, 8 Noville, retirer etrangers
pgsql2shp -h $db_address -g geom -f $shapeoutput/hydrantes -P db4wat$ -u sige sige "\
SELECT                                    \
 'HY_' || id::varchar   AS ID,               \
 _district_shortname || '_' || identification AS ID_SIGE,\
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
