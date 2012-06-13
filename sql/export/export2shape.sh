export db_address=172.24.171.202


# vannes: prendre fermée + vanne régulation/secour (fct) 

# save schema in a table
psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.pipe_schema_temp; CREATE TABLE distribution.pipe_schema_temp AS SELECT * FROM distribution.pipe_schema_nodes;"

 # vannes
/usr/bin/pgsql2shp -h $db_address -g geom -f /home/denis/Documents/PPDE/out/vannes -P db4wat$ -u sige sige "\
SELECT \
	id ,                                        \
	sige,                                       \
	id_pipe,                                    \
	id_node,                                    \
	diameter_nominal,                           \
	year,                                       \
	closed,                                     \
	altitude_dtm,                               \
	altitude_real,                              \
	remarks,                                    \
	_is_on_map,                                 \
	_is_on_district,                            \
	geometry::geometry(Point,21781) AS geom,    \
	_function,                                  \
	_type,                                      \
	_label                                      \
 FROM distribution.valves_schema WHERE closed IS TRUE OR _function = 'vanne de régulation' " 

# zones
/usr/bin/pgsql2shp -h $db_address -g geom -f /home/denis/Documents/PPDE/out/zones -P db4wat$ -u sige sige "\
SELECT	                                         \
	id AS ID,                                    \
	name AS NOM,                                 \
	geometry::geometry(Polygon,21781) AS geom    \
FROM distribution.pressurezones"


# conduites
/usr/bin/pgsql2shp -h $db_address -g geom -f /home/denis/Documents/PPDE/out/conduites -P db4wat$ -u sige sige "\
SELECT                                                                             \
	pipe_schema.id AS ID,                                                         \
	geometry::geometry(LineString,21781) AS geom,                                                              \
	_length2d AS LONGU_2D,                                                         \
	CASE WHEN _length3d_uptodate IS TRUE                                           \
		THEN _length3d                                                             \
		ELSE NULL                                                                  \
	END AS LONGU_3D,                                                               \
	remarks AS REMARQUE,                                                           \
	_precision AS PRECISIO,                                                        \
	_distributor AS DISTRIBU,                                                            \
	_function_name AS FONCTION,                                                    \
	_material_longname AS MATERIAU,                                                \
	_material_diameter_internal AS DIAM_INT,                                       \
	year AS ANNEE,                                                                 \
	id_node_a AS NOEUD_A,                                                          \
	id_node_b AS NOEUD_B,                                                          \
	NULL::varchar(10) AS PRESSION,                                                 \
	NULL::varchar(10) AS RUGOSITE,                                                 \
	NULL::boolean AS CALC_HYD,                                                     \
	NULL::boolean AS A_DESAFE                                                      \
FROM distribution.pipe_schema_nodes WHERE id_distributor = 1 "

# ouvrages
/usr/bin/pgsql2shp -h $db_address -g geom -f /home/denis/Documents/PPDE/out/ouvrages -P db4wat$ -u sige sige "\
SELECT                                                                            \
	id AS ID,                                                                     \
	geometry::geometry(Point,21781) AS geom,                                                             \
	name AS NOM,                                                                  \
	_type_name AS TYPE                                                            \
FROM distribution.installations_view"

# noeuds
/usr/bin/pgsql2shp -h $db_address -g geom -f /home/denis/Documents/PPDE/out/noeuds -P db4wat$ -u sige sige "\
SELECT                                                                          \
	id AS ID,                                                                   \
	altitude_dtm AS ALTITUDE,                                                   \
	geometry::geometry(Point,21781) AS geom                                                            \
FROM distribution.nodes                                                         \
WHERE _schema_view IS TRUE                                                      \
  AND _status_Active IS TRUE                                                    \
  AND id IN (                                                                   \
	SELECT DISTINCT(id_node_a)                                                  \
	FROM distribution.pipe_schema_temp WHERE id_distributor = 1                           \
	UNION SELECT DISTINCT(id_node_b)                                            \
	FROM distribution.pipe_schema_temp WHERE id_distributor = 1 )"
