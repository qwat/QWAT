
BEGIN;


SELECT topology.DropTopology('distrib_topo');


SELECT topology.CreateTopology('distrib_topo',21781);


SELECT topology.AddTopoGeometryColumn('distrib_topo','distribution','pipes','topogeom','LINE');


CREATE OR REPLACE FUNCTION distribution.pipes_topology() RETURNS VOID AS '
	DECLARE
		pi RECORD;
		layer integer;	
	BEGIN
		PERFORM topology.DropTopoGeometryColumn(''distribution'',''pipes'',''topogeom'');
		SELECT topology.AddTopoGeometryColumn(''distrib_topo'',''distribution'',''pipes'',''topogeom'',''LINE'') INTO layer;

		FOR pi in SELECT id FROM distribution.pipes_schema_viewableitems ORDER BY id LOOP
			UPDATE distribution.pipes SET topogeom = toTopoGeom(wkb_geometry, ''distrib_topo'', layer) WHERE id = pi.id;
		END LOOP;
		RETURN;
	EXCEPTION WHEN OTHERS THEN
		RAISE NOTICE ''%'' , pi.id;
	END;
' LANGUAGE plpgsql;


COMMIT; 
