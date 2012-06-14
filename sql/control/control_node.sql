CREATE OR REPLACE VIEW distribution.node_control AS 
	/* Nodes with undefined types */
	SELECT 'Nodes with undefined type' AS problem, id, 'node id' AS comment 
		FROM distribution.node 
		WHERE _type IS NULL 
	UNION
	/* Nodes with no pipe connected */
	SELECT 'Nodes with no pipe connected' AS problem, id, 'node id' AS comment 
		FROM distribution.node 
		WHERE node.id NOT IN (SELECT DISTINCT(id_node_a) FROM distribution.pipe) 
		AND   node.id NOT IN (SELECT DISTINCT(id_node_b) FROM distribution.pipe)
	UNION
	/* Pipes with unreferenced node*/
	SELECT 'Pipes with unreferenced node' AS problem, id, 'pipe id' AS comment
		FROM distribution.pipe 
		WHERE id_node_a NOT IN (SELECT id FROM distribution.node) 
		AND   id_node_b NOT IN (SELECT id FROM distribution.node)
	UNION
	/* Nodes which are too close */
	SELECT 'Too close node' AS problem, a.id, 'Distance: ' || ST_Distance(a.geometry,b.geometry)::decimal(6,4) || 'Position: ' || ST_X(a.geometry) || ' ' || ST_Y(a.geometry) AS comment
		FROM distribution.node a, distribution.node b
		WHERE a.id != b.id 
		AND ST_DWithin(a.geometry,b.geometry,0.004)
	UNION
	/* Pipes without node(s) */
	SELECT 'Pipes without node(s)' AS problem, id, 'pipe id' AS comment
		FROM distribution.pipe 
		WHERE id_node_a IS NULL 
		OR    id_node_b IS NULL
	UNION
	/* Non up-to-date geometries */
	SELECT 'Non up-to-date altitudes' AS problem, NULL AS id, 'number of node' AS comment
	/* */
	ORDER BY problem
	;




