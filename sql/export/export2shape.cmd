
/usr/lib/postgresql/9.1/bin/pgsql2shp -h 172.24.171.202 -g geom -f conduites -P db4wat$ -u sige sige "SELECT pipes_schema.id AS ID,geometry AS geom,_length2d AS LONGU_2D,CASE WHEN _length3d_uptodate IS TRUE THEN _length3d ELSE NULL END AS LONGU_3D,remarks AS REMARQUE,_precision AS PRECISIO,_owner AS DISTRIBU,_function_name AS FONCTION,_material_longname AS MATERIAU,_material_diameter_internal AS DIAM_INT,year AS ANNEE,id_node_a AS NOEUD_A,id_node_b AS NOEUD_B,NULL::varchar(10) AS PRESSION,NULL::varchar(10) AS RUGOSITE,NULL::boolean AS CALC_HYD,NULL::boolean AS A_DESAFE FROM distribution.pipes_schema"

/usr/lib/postgresql/9.1/bin/pgsql2shp -h 172.24.171.202 -g geom -f zones -P db4wat$ -u sige sige "SELECT id,name AS NOM, geometry AS geom FROM distribution.pressure_zones"

/usr/lib/postgresql/9.1/bin/pgsql2shp -h 172.24.171.202 -g geom -f noeuds -P db4wat$ -u sige sige "SELECT id,altitude_dtm AS ALTITUDE, geometry AS geom FROM distribution.nodes"
