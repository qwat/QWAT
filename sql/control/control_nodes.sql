CREATE OR REPLACE VIEW distribution.node_control AS 
	/* nodes with undefined types */
	SELECT 'nodes with undefined types' AS problem, id, 'node id' AS comment 
		FROM distribution.nodes 
		WHERE _type IS NULL 
	UNION
	/* Nodes with unreferenced pipes */
	SELECT 'Nodes with unreferenced pipes' AS problem, id, 'node id' AS comment 
		FROM distribution.nodes 
		WHERE nodes.id NOT IN (SELECT DISTINCT(id_node_a) FROM distribution.pipes) 
		AND   nodes.id NOT IN (SELECT DISTINCT(id_node_b) FROM distribution.pipes)
	UNION
	/* Pipes with unreferenced nodes*/
	SELECT 'Pipes with unreferenced nodes' AS problem, id, 'pipe id' AS comment
		FROM distribution.pipes 
		WHERE id_node_a NOT IN (SELECT id FROM distribution.nodes) 
		AND   id_node_b NOT IN (SELECT id FROM distribution.nodes)
	UNION
	/* Nodes which are too close */
	SELECT 'Too close nodes' AS problem, a.id, 'Distance: ' || ST_Distance(a.geometry,b.geometry)::decimal(6,4) || 'Position: ' || ST_X(a.geometry) || ' ' || ST_Y(a.geometry) AS comment
		FROM distribution.nodes a, distribution.nodes b
		WHERE a.id != b.id 
		AND ST_DWithin(a.geometry,b.geometry,0.004)
	UNION
	/* Pipes without node(s) */
	SELECT 'Pipes without node(s)' AS problem, id, 'pipe id' AS comment
		FROM distribution.pipes 
		WHERE id_node_a IS NULL 
		OR    id_node_b IS NULL
	/* */
	;




