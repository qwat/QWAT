
/* isolated nodes */
SELECT id AS isolated_nodes FROM distribution.nodes WHERE nodes.id NOT IN (SELECT DISTINCT(id_node_a) FROM distribution.pipes) AND nodes.id NOT IN (SELECT DISTINCT(id_node_b) FROM distribution.pipes) ;

/* too close points */
SELECT DISTINCT(autocad_cercle) FROM (
SELECT a.id , b.id , ST_Distance(a.wkb_geometry,b.wkb_geometry)::decimal(6,4), 'cercle ' || ST_X(ST_AsText(a.wkb_geometry))::decimal(10,1)||','||ST_Y(ST_AsText(a.wkb_geometry))::decimal(10,1) AS autocad_cercle
	FROM distribution.nodes a, distribution.nodes b
	WHERE a.id != b.id 
	AND ST_DWithin(a.wkb_geometry,b.wkb_geometry,0.004)
) AS foo;

/* pipes with no point */
SELECT id AS pipe_with_no_node FROM distribution.pipes WHERE id_node_a IS NULL OR id_node_b IS NULL;



