
export sqliteoutput=/home/denis/Documents/qgis/qwat/sql/export/planches.sqlite
export db_address=172.24.171.203


rm $sqliteoutput

 ogr2ogr -sql "SELECT name FROM distribution.distributor"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
   -progress -dsco SPATIALITE=yes \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -lco "SPATIAL_INDEX=yes FORMAT=wkb" -nln distributor -nlt NONE -gt 65536
  
  
  
 ogr2ogr -sql "SELECT name,shortname,zip,land_registry,geometry FROM distribution.district"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln district -nlt POLYGON -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
 ogr2ogr -sql "SELECT identification,id_type,id_distributor,id_status,id_provider,year,model,altitude_real,remarks,id_district,id_pressurezone,geometry FROM distribution.hydrant"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant -nlt POINT -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  
  ogr2ogr -sql "SELECT name FROM distribution.hydrant_provider"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant_provider -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  ogr2ogr -sql "SELECT name,shortname FROM distribution.hydrant_type"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant_type -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  ogr2ogr -sql "SELECT id_function,id_install_method,id_material,id_distributor,id_precision,id_protection,id_status,year,tunnel_or_bridge,pressure_nominal,folder,remarks,id_district,id_pressurezone,geometry FROM distribution.pipe"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe -nlt LINESTRING -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  
  
 ogr2ogr -sql "SELECT function FROM distribution.pipe_function"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_function -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536


 ogr2ogr -sql "SELECT name FROM distribution.pipe_install_method"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_install_method -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT shortname,name,diameter,diameter_internal,diameter_external,_fancy_name AS fancy_name FROM distribution.pipe_material"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_material -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name FROM distribution.pipe_protection"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_protection -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name FROM distribution.precision"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln precision -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT shortname,name,consummerzone,colorcode,geometry FROM distribution.pressurezone"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pressurezone -nlt POLYGON -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT status,active,sire,comment FROM distribution.status"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln status -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT identification,id_type,id_type,id_function,id_maintenance,diameter_nominal,year,closed,altitude_real,remarks,id_district,id_pressurezone,geometry FROM distribution.valve"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve -nlt POINT -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT function,shortname FROM distribution.valve_function"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_function -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name,priority,comment FROM distribution.valve_maintenance"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_maintenance -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT type FROM distribution.valve_type"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_type -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT id,name FROM distribution.visible"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln visible -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

