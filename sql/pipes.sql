
DROP TABLE IF EXISTS distribution.pipes CASCADE;



CREATE TABLE distribution.pipes (fid serial NOT NULL);



ALTER TABLE distribution.pipes ADD COLUMN   id_function integer;
ALTER TABLE distribution.pipes ADD COLUMN   year smallint; /* CHECK (year > 1800 AND year < 2100);*/
SELECT AddGeometryColumn('distribution', 'pipes', 'wkb_geometry', 21781, 'LINESTRING', 2);
/*ALTER TABLE distribution.pipes ADD COLUMN   wkb_geometry geometry;*/
ALTER TABLE distribution.pipes ADD COLUMN   folder character(20);
ALTER TABLE distribution.pipes ADD COLUMN   schema_force_view smallint NOT NULL DEFAULT 0;


ALTER TABLE distribution.pipes ADD COLUMN   linestring text;

ALTER TABLE distribution.pipes ADD COLUMN   pressure_nominale character(20);
ALTER TABLE distribution.pipes ADD COLUMN   folio character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_precision_2d character(20);

ALTER TABLE distribution.pipes ADD COLUMN   length_real character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_int_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_owner character(20);
ALTER TABLE distribution.pipes ADD COLUMN   protection_coating_detail character(20);

ALTER TABLE distribution.pipes ADD COLUMN   id_material character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_nominal_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   "deleted" character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_parent integer;
ALTER TABLE distribution.pipes ADD COLUMN   remarks character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_internal_material_id character(20);

ALTER TABLE distribution.pipes ADD COLUMN   material_ext_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_external_material_id character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_status integer;
ALTER TABLE distribution.pipes ADD COLUMN   id_location character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_install_method character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_thickness character(20);





/* Ajout des contraintes */
/* primary key */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_pkey PRIMARY KEY (fid);
/* id_parent */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_parent FOREIGN KEY (id_parent) REFERENCES distribution.pipes (fid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_parent ON distribution.pipes(id_parent);
/* function */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_function FOREIGN KEY (id_function) REFERENCES distribution.pipes_function(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_function ON distribution.pipes(id_function);
/* status */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_status FOREIGN KEY (id_status) REFERENCES distribution.pipes_status(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_status ON distribution.pipes(id_status);

/* Geometry */
/*
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'LINESTRING'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
*/

/* Index GIST */
CREATE INDEX geoidx ON distribution.pipes USING GIST ( wkb_geometry );


/* Mise à jour geometry_columns */
/*
DELETE FROM geometry_columns WHERE f_table_name = 'pipes';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	VALUES  ('' , 'distribution', 'pipes', 'wkb_geometry', 2, 21781, 'LINESTRING');
*/
