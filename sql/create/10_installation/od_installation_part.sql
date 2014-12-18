/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat.od_installationpart CASCADE;
CREATE TABLE qwat.od_installationpart (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_installationpart IS 'Table for subscriber meters.';

/* COLUMNS */

ALTER TABLE qwat.od_installationpart ADD COLUMN id_type int;
ALTER TABLE qwat.od_installationpart ADD COLUMN remark text default '';


/* GEOMETRY                           (table_name,            is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_installationpart', true,    false,        false,            true,       true,         true);

/* JOINS */
ALTER TABLE qwat.od_installationpart ADD CONSTRAINT installationpart_id_type FOREIGN KEY (id_type)  REFERENCES qwat.vl_installationpart_type(id) MATCH FULL; CREATE INDEX fki_installationpart_id_type ON qwat.od_installationpart(id_type) ;


/* add this to the node table */
INSERT INTO qwat.od_node_table (table_name,node_type,overwrite) VALUES ('od_installationpart','installationpart',true);

