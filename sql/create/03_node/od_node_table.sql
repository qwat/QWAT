/*
	qWat - QGIS Water Module
	
	SQL file :: node tables
	
	it is used to know which elements might be on a node
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_node_table CASCADE;
CREATE TABLE qwat.od_node_table (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_node IS' Node tables. it is used to know which elements might be on a node';

/* columns */
ALTER TABLE qwat.od_node_table ADD COLUMN table_name varchar(60);
ALTER TABLE qwat.od_node_table ADD COLUMN complement_column  varchar(60);
ALTER TABLE qwat.od_node_table ADD COLUMN node_type  varchar(60);
ALTER TABLE qwat.od_node_table ADD COLUMN overwrite  boolean default false not null; COMMENT ON COLUMN qwat.od_node_table.overwrite IS 'if true, the type will be affected to the node even if two pipes are on it. e.g. useful for meters (node should be meter and not a two_XXXX).';

/* fill */
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_building'       , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_pressurecontrol', 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_pump'           , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_source'         , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_tank'           , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_treatment'      , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_installation_valvechamber'   , 'installation');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_wateringoutput', 'wateringoutput');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_valve'  , 'valve');
INSERT INTO qwat.od_node_table (table_name,node_type) VALUES ('od_hydrant', 'hydrant');


