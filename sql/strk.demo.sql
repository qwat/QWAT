BEGIN;
/*schema*/
!!!DROP SCHEMA IF EXISTS test CASCADE ;
CREATE SCHEMA test;
/* table pipe */
DROP TABLE IF EXISTS test.pipes;
CREATE TABLE test.pipes (id serial);
SELECT AddGeometryColumn('test','pipes','wkb_geometry',21781,'LINESTRING',2);

INSERT INTO test.pipes (wkb_geometry) VALUES (ST_GeomFromText('LINESTRING(556267.56295432 144887.06663814,556267.56675006 144887.41418974,556267.51749438 144888.36625986)',21781));
INSERT INTO test.pipes (wkb_geometry) VALUES (ST_GeomFromText('LINESTRING(556235.24690964 144885.29802057,556235.67308329 144885.29937174,556254.67 144886.62,556267.66 144887.07,556310.04 144888.17,556317.28 144888.99,556328.49 144888.8,556329.96432976 144889.10462973,556336.04 144890.36,556354.07460537 144896.28743348,556362.83 144899.28)',21781));
/* topology */
SELECT topology.DropTopology('test_topo');
SELECT topology.CreateTopology('test_topo',21781);
SELECT topology.AddTopoGeometryColumn('test_topo','test','pipes','topogeom','LINE');

UPDATE test.pipes SET topogeom = toTopoGeom(wkb_geometry, 'test_topo', 1) WHERE id=1;
UPDATE test.pipes SET topogeom = toTopoGeom(wkb_geometry, 'test_topo', 1) WHERE id=2;

COMMIT; 
