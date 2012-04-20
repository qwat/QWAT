
# to have ogr2ogr working with postgis 2.0
# psql -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql



rm distribution.sqlite


# PIPES
ogr2ogr -sql "SELECT * FROM distribution.pipes_view" \
 -overwrite -a_srs EPSG:21781 -f SQLite distribution.sqlite \
 -nln pipes -nlt LINESTRING -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=yes -lco SPATIAL_INDEX=yes  -gt 65536

# PIPES SCHEMA
ogr2ogr -sql "SELECT * FROM distribution.pipes_schema" \
 -overwrite -a_srs EPSG:21781 -f SQLite distribution.sqlite \
 -nln pipes_schema -nlt LINESTRING -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=yes -lco SPATIAL_INDEX=yes  -gt 65536

# NODES
ogr2ogr -sql "SELECT * FROM distribution.nodes" \
 -overwrite -a_srs EPSG:21781 -f SQLite distribution.sqlite \
 -nln nodes -nlt POINT -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=yes -lco SPATIAL_INDEX=yes  -gt 65536
 
# INSTALLATIONS
ogr2ogr -sql "SELECT * FROM distribution.installations" \
 -overwrite -a_srs EPSG:21781 -f SQLite distribution.sqlite \
 -nln installations -nlt POINT -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=yes -lco SPATIAL_INDEX=yes  -gt 65536
