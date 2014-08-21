/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS distribution.od_installationpart CASCADE;
CREATE TABLE distribution.od_installationpart (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_installationpart IS 'Table for subscriber meters.';

/* COLUMNS */

ALTER TABLE distribution.od_installationpart ADD COLUMN id_type int;
ALTER TABLE distribution.od_installationpart ADD COLUMN remark text default '';


/* GEOMETRY                           (table_name,            is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT distribution.fn_geom_tool_point('od_installationpart', true,    false,        false,            true,       true,         true);

/* JOINS */
ALTER TABLE distribution.od_installationpart ADD CONSTRAINT installationpart_id_type FOREIGN KEY (id_type)  REFERENCES distribution.vl_installationpart_type(id) MATCH FULL; CREATE INDEX fki_installationpart_id_type ON distribution.od_installationpart(id_type) ;


/* add this to the node table */
INSERT INTO distribution.od_node_table (table_name,complement_column,node_type,overwrite) VALUES ('od_installationpart','id_type','installationpart',true);

