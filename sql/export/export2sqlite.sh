
# to have ogr2ogr working with postgis 2.0
# psql -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql

export ogr2ogrpath=/usr/local/bin/ogr2ogr
export ogr2ogrpath=ogr2ogr


rm sige_distribution.sqlite


# PIPES
$ogr2ogrpath -sql "SELECT                                           \
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
		geometry::geometry(LineString,21781),                       \
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,\
		_function_name,                                             \
		_install_method,                                            \
		_material_name,                                             \
		_material_longname,                                         \
		_material_diameter,                                         \
		_material_diameter_internal,                                \
		_owner,                                                     \
		_precision,                                                 \
		_protection,                                                \
		_status_name,                                               \
		_status_active,                                             \
		_pressure_zone                                              \
		_schema_view                                                \
 FROM distribution.pipes_view WHERE id_owner = 1" \
 -overwrite -a_srs EPSG:21781 -f SQLite sige_distribution.sqlite \
 -nln pipes -nlt LINESTRING -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# PIPES SCHEMA
$ogr2ogrpath -sql "SELECT                                            \
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
		geometry::geometry(LineString,21781),                       \
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,\
		_function_name,                                             \
		_install_method,                                            \
		_material_name,                                             \
		_material_longname,                                         \
		_material_diameter,                                         \
		_material_diameter_internal,                                \
		_owner,                                                     \
		_precision,                                                 \
		_protection,                                                \
		_status_name,                                               \
		_status_active,                                             \
		_pressure_zone                                              \
 FROM distribution.pipes_schema WHERE id_owner = 1" \
 -overwrite -a_srs EPSG:21781 -f SQLite sige_distribution.sqlite \
 -nln pipes_schema -nlt LINESTRING -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

# NODES
$ogr2ogrpath -sql "SELECT * FROM distribution.nodes WHERE _status_active IS TRUE" \
 -overwrite -a_srs EPSG:21781 -f SQLite sige_distribution.sqlite \
 -nln nodes -nlt POINT -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
 
# INSTALLATIONS
$ogr2ogrpath -sql "SELECT * FROM distribution.installations_view" \
 -overwrite -a_srs EPSG:21781 -f SQLite sige_distribution.sqlite \
 -nln installations -nlt POINT -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
 
 
 # PRESSURE ZONES
$ogr2ogrpath -sql "SELECT * FROM distribution.pressure_zones" \
 -overwrite -a_srs EPSG:21781 -f SQLite sige_distribution.sqlite \
 -nln pressure_zones -nlt POLYGON -progress \
 PG:"dbname='sige' host='172.24.171.202' port='5432' user='sige' password='db4wat$'" \
 -dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
