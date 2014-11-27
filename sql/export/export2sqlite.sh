
export sqliteoutput=/home/denis/Documents/qgis/qwat/sql/export/planches.sqlite
export db_address=172.24.171.203


rm $sqliteoutput

 ogr2ogr -sql "SELECT name FROM qwat.od_distributor"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
   -progress -dsco SPATIALITE=yes \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -lco "SPATIAL_INDEX=yes FORMAT=wkb" -nln distributor -nlt NONE -gt 65536
  
  
  
 ogr2ogr -sql "SELECT name,shortname,zip,land_registry,geometry FROM qwat.od_district"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln district -nlt POLYGON -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
 ogr2ogr -sql "SELECT identification,id_type,id_distributor,vl_status,id_provider,year,model,altitude_real,remark ,id_district,id_pressurezone,geometry FROM qwat.od_hydrant"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant -nlt POINT -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  
  ogr2ogr -sql "SELECT name FROM qwat.vl_hydrant_provider"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant_provider -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  ogr2ogr -sql "SELECT name,shortname FROM qwat.od_hydrant_type"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln hydrant_type -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  ogr2ogr -sql "SELECT id_function,id_installmethod,id_material,id_distributor,id_precision,id_protection,vl_status,year,tunnel_or_bridge,pressure_nominal,folder,remark ,id_district,id_pressurezone,geometry FROM qwat.od_pipe"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe -nlt LINESTRING -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536
  
  
  
 ogr2ogr -sql "SELECT function FROM qwat.od_pipe_function"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_function -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536


 ogr2ogr -sql "SELECT name FROM qwat.od_pipe_installmethod"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_installmethod -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT shortname,name,diameter,diameter_internal,diameter_external,_fancyname AS fancy_name FROM qwat.od_pipe_material"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_material -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name FROM qwat.od_pipe_protection"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pipe_protection -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name FROM qwat.precision"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln precision -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT shortname,name,consummerzone,colorcode,geometry FROM qwat.od_pressurezone"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln pressurezone -nlt POLYGON -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT status,active,sire,comment FROM qwat.vl_status"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln status -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT identification,id_type,id_type,id_function,id_maintenance,diameter_nominal,year,closed,altitude_real,remark ,id_district,id_pressurezone,geometry FROM qwat.od_valve"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve -nlt POINT -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT function,shortname FROM qwat.od_valve_function"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_function -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT name,priority,comment FROM qwat.od_valve_maintenance"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_maintenance -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT type FROM qwat.od_valve_type"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln valve_type -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

 ogr2ogr -sql "SELECT id,name FROM qwat.vl_visible"  \
  -overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
  -nln vl_visible -nlt NONE -progress \
  PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
  -dsco SPATIALITE=yes -lco "SPATIAL_INDEX=yes FORMAT=wkb" -gt 65536

