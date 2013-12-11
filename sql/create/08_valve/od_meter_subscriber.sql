/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS distribution.od_meter_subscriber CASCADE;
CREATE TABLE distribution.od_meter_subscriber (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_meter_subscriber IS 'Table for subscriber meters.';

/* COLUMNS */

ALTER TABLE distribution.od_meter_subscriber ADD COLUMN remark text default '';

/* GEOMETRY                           (table_name,            is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_meter_subscriber', true,    false,        false,            true,       true,         true);


/* add this to the node table */
INSERT INTO distribution.od_node_table (table_name,node_type,overwrite) VALUES ('od_meter_subscriber','meter_subscriber',true);

