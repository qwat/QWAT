
export db_address=172.24.171.203
export sqliteoutput=/home/denis/Documents/cartoriviera/sige_distribution.sqlite
export PGCLIENTENCODING=LATIN1;




########################################################################
# NODES
read -p "Generate nodes ID for schema? (y/n) " answ
if [ $answ = "y" ] 
then
  # save schema in a table
  psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp;"
  psql -h $db_address -U sige -c "CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_node;"
  read -p "Press any key to continue..."
fi

########################################################################
# TABLES AND VIEWS
# pipes
ogr2ogr -sql "SELECT * FROM distribution.pipe_view WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pipe -nlt LINESTRING -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# pipe schema
ogr2ogr -sql "SELECT * FROM distribution.pipe_schema WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pipe_schema -nlt LINESTRING -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# nodes
ogr2ogr -sql "SELECT * FROM distribution.node WHERE _status_active IS TRUE AND _type != 'one' "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln node -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# valves
ogr2ogr -sql "SELECT * FROM distribution.valve_view "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln valve -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# valves schema
ogr2ogr -sql "SELECT * FROM distribution.valve_schema "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln valve_schema -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# hydrantes
ogr2ogr -sql "SELECT * FROM distribution.hydrant_view WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln hydrant -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# installations
ogr2ogr -sql "SELECT * FROM distribution.installation_view WHERE _status_active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# pressure zones
ogr2ogr -sql "SELECT * FROM distribution.pressurezone" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pressurezone -nlt POLYGON -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# print maps
ogr2ogr -sql "SELECT * FROM distribution.printmap" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln printmap -nlt POLYGON -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# subscriber
ogr2ogr -sql "SELECT * FROM distribution.subscriber_view"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln subscriber -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

########################################################################
# FTP TRANSFER 
read -p "FTP transfer? (y/n) " answ
if [ $answ = "y" ] 
then
	ftp -n -v ftp.vevey.ch <<-EOF
	user carto_sige ca61sie 
	prompt
	binary
	cd Distribution
	put $sqliteoutput sige_distribution_v2.sqlite
	bye
	EOF
fi
