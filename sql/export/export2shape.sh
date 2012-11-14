#!/bin/sh

# to have ogr2ogr working with postgis 2.0
# psql -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql


export db_address=172.24.171.203
export shapeoutput=/home/sige/out
export sqliteoutput=/home/denis/Documents/cartoriviera/sige_distribution.sqlite
export PGCLIENTENCODING=LATIN1;


echo "Format?"
echo "1. SQLite (cartoriviera)"
echo "2. Shape "
read -p "? " outputformat
if [ $outputformat = "1" ] 
then
    rm $sqliteoutput
    export geomcol=geometry;
elif [ $outputformat = "2" ]
then
    export geomcol=geometry;
else
    exit
fi

########################################################################
# NODES
read -p "Generate nodes ID for schema? (y/n) " answ
if [ $answ = "y" ] 
then
  # save schema in a table
  psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
  read -p "Press any key to continue..."
fi

########################################################################
# PIPES VIEW
export sql="SELECT";
export sql="$sql id                                  "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql year                                "; if [ $outputformat = "2" ]; then export sql="$sql AS annee     ,";else export sql="$sql ,";fi
export sql="$sql tunnel_or_bridge                    "; if [ $outputformat = "2" ]; then export sql="$sql AS tunnel_pon,";else export sql="$sql ,";fi
export sql="$sql pressure_nominale                   "; if [ $outputformat = "2" ]; then export sql="$sql AS pres_nomin,";else export sql="$sql ,";fi
export sql="$sql folder                              "; if [ $outputformat = "2" ]; then export sql="$sql AS dossier   ,";else export sql="$sql ,";fi
export sql="$sql remarks                             "; if [ $outputformat = "2" ]; then export sql="$sql AS remarques ,";else export sql="$sql ,";fi
export sql="$sql _length2d                           "; if [ $outputformat = "2" ]; then export sql="$sql AS long_2d   ,";else export sql="$sql ,";fi
export sql="$sql _length3d                           "; if [ $outputformat = "2" ]; then export sql="$sql AS long_3d   ,";else export sql="$sql ,";fi
export sql="$sql _diff_elevation                     "; if [ $outputformat = "2" ]; then export sql="$sql AS dz        ,";else export sql="$sql ,";fi
export sql="$sql _slope                              "; if [ $outputformat = "2" ]; then export sql="$sql AS pente     ,";else export sql="$sql ,";fi
export sql="$sql _is_on_map                          "; if [ $outputformat = "2" ]; then export sql="$sql AS folio     ,";else export sql="$sql ,";fi
export sql="$sql _is_on_district                     "; if [ $outputformat = "2" ]; then export sql="$sql AS commune   ,";else export sql="$sql ,";fi
export sql="$sql geometry::geometry(LineString,21781)"; if [ $outputformat = "2" ]; then export sql="$sql AS geometry  ,";else export sql="$sql ,";fi
export sql="$sql _function_name                      "; if [ $outputformat = "2" ]; then export sql="$sql AS fonction  ,";else export sql="$sql ,";fi
export sql="$sql _install_method                     "; if [ $outputformat = "2" ]; then export sql="$sql AS mode_pose ,";else export sql="$sql ,";fi
export sql="$sql _material_name                      "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_court ,";else export sql="$sql ,";fi
export sql="$sql _material_longname                  "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_long  ,";else export sql="$sql ,";fi
export sql="$sql _material_diameter                  "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_diam  ,";else export sql="$sql ,";fi
export sql="$sql _material_diameter_internal         "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_diam_i,";else export sql="$sql ,";fi
export sql="$sql _distributor                        "; if [ $outputformat = "2" ]; then export sql="$sql AS distribut ,";else export sql="$sql ,";fi
export sql="$sql _precision                          "; if [ $outputformat = "2" ]; then export sql="$sql AS precision ,";else export sql="$sql ,";fi
export sql="$sql _protection                         "; if [ $outputformat = "2" ]; then export sql="$sql AS protection,";else export sql="$sql ,";fi
export sql="$sql _status_name                        "; if [ $outputformat = "2" ]; then export sql="$sql AS etat      ,";else export sql="$sql ,";fi
export sql="$sql _status_active                      "; if [ $outputformat = "2" ]; then export sql="$sql AS etat_actif,";else export sql="$sql ,";fi
export sql="$sql _pressurezone                       "; if [ $outputformat = "2" ]; then export sql="$sql AS zone_press,";else export sql="$sql ,";fi
export sql="$sql _schema_view                        "; if [ $outputformat = "2" ]; then export sql="$sql AS schema_vis";fi
export sql="$sql FROM distribution.pipe_view WHERE id_distributor = 1";
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe -nlt LINESTRING -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/pipes -P db4wat$ -u sige sige "$sql" 
fi

########################################################################
# PIPES SCHEMA
export sql="SELECT ";
export sql="$sql id                                  "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql year                                "; if [ $outputformat = "2" ]; then export sql="$sql AS annee     ,";else export sql="$sql ,";fi
export sql="$sql tunnel_or_bridge                    "; if [ $outputformat = "2" ]; then export sql="$sql AS tunnel_pon,";else export sql="$sql ,";fi
export sql="$sql pressure_nominale                   "; if [ $outputformat = "2" ]; then export sql="$sql AS pres_nomin,";else export sql="$sql ,";fi
export sql="$sql folder                              "; if [ $outputformat = "2" ]; then export sql="$sql AS dossier   ,";else export sql="$sql ,";fi
export sql="$sql remarks                             "; if [ $outputformat = "2" ]; then export sql="$sql AS remarques ,";else export sql="$sql ,";fi
export sql="$sql _length2d                           "; if [ $outputformat = "2" ]; then export sql="$sql AS long_2d   ,";else export sql="$sql ,";fi
export sql="$sql _length3d                           "; if [ $outputformat = "2" ]; then export sql="$sql AS long_3d   ,";else export sql="$sql ,";fi
export sql="$sql _diff_elevation                     "; if [ $outputformat = "2" ]; then export sql="$sql AS dz        ,";else export sql="$sql ,";fi
export sql="$sql _slope                              "; if [ $outputformat = "2" ]; then export sql="$sql AS pente     ,";else export sql="$sql ,";fi
export sql="$sql _is_on_map                          "; if [ $outputformat = "2" ]; then export sql="$sql AS folio     ,";else export sql="$sql ,";fi
export sql="$sql _is_on_district                     "; if [ $outputformat = "2" ]; then export sql="$sql AS commune   ,";else export sql="$sql ,";fi
export sql="$sql geometry::geometry(LineString,21781)"; if [ $outputformat = "2" ]; then export sql="$sql AS geometry  ,";else export sql="$sql ,";fi
export sql="$sql _function_name                      "; if [ $outputformat = "2" ]; then export sql="$sql AS fonction  ,";else export sql="$sql ,";fi
export sql="$sql _install_method                     "; if [ $outputformat = "2" ]; then export sql="$sql AS mode_pose ,";else export sql="$sql ,";fi
export sql="$sql _material_name                      "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_court ,";else export sql="$sql ,";fi
export sql="$sql _material_longname                  "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_long  ,";else export sql="$sql ,";fi
export sql="$sql _material_diameter                  "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_diam  ,";else export sql="$sql ,";fi
export sql="$sql _material_diameter_internal         "; if [ $outputformat = "2" ]; then export sql="$sql AS mat_diam_i,";else export sql="$sql ,";fi
export sql="$sql _distributor                        "; if [ $outputformat = "2" ]; then export sql="$sql AS distribu  ,";else export sql="$sql ,";fi
export sql="$sql _precision                          "; if [ $outputformat = "2" ]; then export sql="$sql AS precision ,";else export sql="$sql ,";fi
export sql="$sql _protection                         "; if [ $outputformat = "2" ]; then export sql="$sql AS protection,";else export sql="$sql ,";fi
export sql="$sql _status_name                        "; if [ $outputformat = "2" ]; then export sql="$sql AS etat      ,";else export sql="$sql ,";fi
export sql="$sql _status_active                      "; if [ $outputformat = "2" ]; then export sql="$sql AS etat_actif,";else export sql="$sql ,";fi
export sql="$sql _pressurezone                       "; if [ $outputformat = "2" ]; then export sql="$sql AS zone_press";fi
export sql="$sql FROM distribution.pipe_schema_temp WHERE id_distributor = 1"
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_schema -nlt LINESTRING -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/pipes_schema -P db4wat$ -u sige sige "$sql" 
fi

 
########################################################################
# NODES
export sql="SELECT ";
export sql="$sql id            "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql altitude_dtm  "; if [ $outputformat = "2" ]; then export sql="$sql AS alti_mnt  ,";else export sql="$sql ,";fi
export sql="$sql _type         "; if [ $outputformat = "2" ]; then export sql="$sql AS type      ,";else export sql="$sql ,";fi
export sql="$sql _orientation  "; if [ $outputformat = "2" ]; then export sql="$sql AS orientatio,";else export sql="$sql ,";fi
export sql="$sql _schema_view  "; if [ $outputformat = "2" ]; then export sql="$sql AS schema    ,";else export sql="$sql ,";fi
export sql="$sql _status_active"; if [ $outputformat = "2" ]; then export sql="$sql AS actif     ,";else export sql="$sql ,";fi
export sql="$sql geometry      "; if [ $outputformat = "2" ]; then export sql="$sql AS geometry  ";fi
export sql="$sql FROM distribution.node WHERE _status_active IS TRUE AND _type != 'one' " 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln node -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/nodes -P db4wat$ -u sige sige "$sql" 
fi
 
########################################################################
# VALVES
export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT                              \
    id ,                                        \
    sige,                                       \
    id_pipe,                                    \
    id_node,                                    \
    diameter_nominal,                           \
    year,                                       \
    closed,                                     \
    _altitude_dtm,                              \
    altitude_real,                              \
    remarks,                                    \
    _is_on_map,                                 \
    _district,                                  \
    geometry::$geomcol(Point,21781),            \
    _function,                                  \
    _type,                                      \
    _label                                      \
 FROM distribution.valve_view" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/valves -P db4wat$ -u sige sige "$sql" 
fi

########################################################################
 # VALVES SCHEMA
 export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT                              \
    id ,                                        \
    sige,                                       \
    id_pipe,                                    \
    id_node,                                    \
    diameter_nominal,                           \
    year,                                       \
    closed,                                     \
    _altitude_dtm,                              \
    altitude_real,                              \
    remarks,                                    \
    _is_on_map,                                 \
    _district,                                  \
    geometry::$geomcol(Point,21781),            \
    _function,                                  \
    _type,                                      \
    _label                                      \
FROM distribution.valve_schema" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_schema -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/valves_schema -P db4wat$ -u sige sige "$sql" 
fi


 ########################################################################
# INSTALLATIONS
export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.installation_view WHERE _status_active IS TRUE" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln installation -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/installations -P db4wat$ -u sige sige "$sql" 
fi

######################################################################## 
 # PRESSURE ZONES
 export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.pressurezone" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pressurezone -nlt POLYGON -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/pressurezones -P db4wat$ -u sige sige "$sql" 
fi

######################################################################## 
 # SUBSCRIBER
 export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.subscriber_view" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln subscriber -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/subscriber -P db4wat$ -u sige sige "$sql" 
fi

########################################################################
# SAMPLING POINT
export sql="SELECT ";
export sql="$sql id          "; if [ $outputformat = "2" ]; then export sql="$sql AS id        ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql             "; if [ $outputformat = "2" ]; then export sql="$sql AS           ,";else export sql="$sql ,";fi
export sql="$sql FROM distribution.pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.samplingpoint"
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln samplingpoint -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/samplingpoint -P db4wat$ -u sige sige "$sql" 
fi



