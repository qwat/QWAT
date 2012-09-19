#!/bin/sh

# to have ogr2ogr working with postgis 2.0
# psql -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql


export db_address=172.24.171.202
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


# read -p "Generate nodes ID for schema? (y/n) " answ
# if [ $answ = "y" ] 
# then
#   # save schema in a table
#   psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
#   read -p "Press any key to continue..."
# fi


# PIPES
export sql="SELECT                                                      \
		id				  ,                                         \
		year              ,                                         \
		tunnel_or_bridge  ,                                         \
		pressure_nominale ,                                         \
		folder            ,                                         \
		remarks           ,                                         \
		_length2d         ,                                         \
		_length3d         ,                                         \
		_length3d_uptodate,                                         \
		_is_on_map        ,                                         \
		_is_on_district   ,                                         \
		geometry::$geomcol(LineString,21781),                       \
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,\
		_function_name,                                             \
		_install_method,                                            \
		_material_name,                                             \
		_material_longname,                                         \
		_material_diameter,                                         \
		_material_diameter_internal,                                \
		_distributor,                                               \
		_precision,                                                 \
		_protection,                                                \
		_status_name,                                               \
		_status_active,                                             \
		_pressurezone,                                              \
		_schema_view                                                \
 FROM distribution.pipe_view WHERE id_distributor = 1" 
 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe -nlt LINESTRING -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi

# PIPES SCHEMA
export sql="SELECT                                                \
		id				  ,                                         \
		year              ,                                         \
		tunnel_or_bridge  ,                                         \
		pressure_nominale ,                                         \
		folder            ,                                         \
		remarks           ,                                         \
		_length2d         ,                                         \
		_length3d         ,                                         \
		_length3d_uptodate,                                         \
		_is_on_map        ,                                         \
		_is_on_district   ,                                         \
		geometry::$geomcol(LineString,21781),                       \
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,\
		_function_name,                                             \
		_install_method,                                            \
		_material_name,                                             \
		_material_longname,                                         \
		_material_diameter,                                         \
		_material_diameter_internal,                                \
		_distributor,                                               \
		_precision,                                                 \
		_protection,                                                \
		_status_name,                                               \
		_status_active,                                             \
		_pressurezone                                               \
 FROM distribution.pipe_schema WHERE id_distributor = 1" \
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_schema -nlt LINESTRING -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi

 

# NODES
export sql="SELECT * FROM distribution.node WHERE _status_active IS TRUE AND _type != 'one' " 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln node -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi
 
# VALVES
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
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi


 # VALVES SCHEMA
export sql="SELECT                            \
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
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_schema -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi


 
# INSTALLATIONS
export sql="SELECT * FROM distribution.installation_view WHERE _status_active IS TRUE" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln installation -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi

 
 # PRESSURE ZONES
export sql="SELECT * FROM distribution.pressurezone" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pressurezone -nlt POLYGON -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi
 
 # SUBSCRIBER
export sql="SELECT * FROM distribution.subscriber_view" 
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln subscriber -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi

# SAMPLING POINTS
export sql="SELECT * FROM distribution.samplingpoint"
if [ $outputformat = "1" ] 
then
  ogr2ogr -sql "$sql" \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln samplingpoint -nlt POINT -progress -preserve_fid \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
elif [ $outputformat = "2" ]
then
  /usr/lib/postgresql/9.1/bin/pgsql2shp -h $db_address -g $geomcol -f $shapeoutput/zones -P db4wat$ -u sige sige $sql
fi



