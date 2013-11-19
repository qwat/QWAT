#!/bin/sh

# to have ogr2ogr working with postgis 2.0
# psql -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql


export db_address=172.24.171.203
export shapeoutput=/home/sige/out
export sqliteoutput=/home/denis/Documents/qgis/qwat/sql/export/planches.sqlite
export PGCLIENTENCODING=LATIN1


ok pour export qgis server

-overwrite -a_srs EPSG:21781 -f SQLite $outputpath \
 -nln pipe -nlt LINESTRING -progress -preserve_fid \
 PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=yes -lco SPATIAL_INDEX=yes  -gt 65536


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
  psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.vw_pipe_schema_temp; CREATE TABLE distribution.vw_pipe_schema_temp AS SELECT * FROM distribution.vw_pipe_schema_node;"
  read -p "Press any key to continue..."
fi

########################################################################
# PIPES VIEW
export sql="SELECT";
export sql="$sql id                                  ,";
export sql="$sql year                                ,";
export sql="$sql tunnel_or_bridge                    ,";
export sql="$sql pressure_nominale                   ,";
export sql="$sql folder                              ,";
export sql="$sql remark                              ,";
export sql="$sql _length2d                           ,";
export sql="$sql _length3d                           ,";
export sql="$sql _diff_elevation                     ,";
export sql="$sql _slope                              ,";
export sql="$sql _is_on_map                          ,";
export sql="$sql _is_on_district                     ,";
export sql="$sql geometry::geometry(LineString,21781),";
export sql="$sql _function_name                      ,";
export sql="$sql _installmethod                     ,";
export sql="$sql _material_name                      ,";
export sql="$sql _material_longname                  ,";
export sql="$sql _material_diameter                  ,";
export sql="$sql _material_diameter_internal         ,";
export sql="$sql _distributor                        ,";
export sql="$sql _precision                          ,";
export sql="$sql _protection                         ,";
export sql="$sql _status_name                        ,";
export sql="$sql _status_active                      ,";
export sql="$sql _pressurezone                       ,";
export sql="$sql _schema_visible                         ";
export sql="$sql FROM distribution.vw_pipe WHERE id_distributor = 1";
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
export sql="$sql id                                  ,";
export sql="$sql year                                ,";
export sql="$sql tunnel_or_bridge                    ,";
export sql="$sql pressure_nominale                   ,";
export sql="$sql folder                              ,";
export sql="$sql remark                              ,";
export sql="$sql _length2d                           ,";
export sql="$sql _length3d                           ,";
export sql="$sql _diff_elevation                     ,";
export sql="$sql _slope                              ,";
export sql="$sql _is_on_map                          ,";
export sql="$sql _is_on_district                     ,";
export sql="$sql geometry::geometry(LineString,21781),";
export sql="$sql _function_name                      ,";
export sql="$sql _installmethod                     ,";
export sql="$sql _material_name                      ,";
export sql="$sql _material_longname                  ,";
export sql="$sql _material_diameter                  ,";
export sql="$sql _material_diameter_internal         ,";
export sql="$sql _distributor                        ,";
export sql="$sql _precision                          ,";
export sql="$sql _protection                         ,";
export sql="$sql _status_name                        ,";
export sql="$sql _status_active                      ,";
export sql="$sql _pressurezone                       "; 
export sql="$sql FROM distribution.vw_pipe_schema_temp WHERE id_distributor = 1"
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
export sql="$sql _schema_visible  "; if [ $outputformat = "2" ]; then export sql="$sql AS schema    ,";else export sql="$sql ,";fi
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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

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
    remark ,                                    \
    _is_on_map,                                 \
    _district,                                  \
    geometry::$geomcol(Point,21781),            \
    _function,                                  \
    _type,                                      \
    _label                                      \
 FROM distribution.vw_valve" 
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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

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
    remark ,                                    \
    _is_on_map,                                 \
    _district,                                  \
    geometry::$geomcol(Point,21781),            \
    _function,                                  \
    _type,                                      \
    _label                                      \
FROM distribution.od_valve_schema" 
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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.od_pressurezone" 
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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.vw_subscriber" 
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
export sql="$sql FROM distribution.vw_pipe_schema WHERE id_distributor = 1" 

export sql="SELECT * FROM distribution.od_samplingpoint"
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



