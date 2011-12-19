""
	qWat - QGIS Water Module
	
	SQL file :: pipes table and view
	
""

DROP TABLE IF EXISTS distribution.pipes CASCADE;
CREATE TABLE distribution.pipes (fid serial NOT NULL);

ALTER TABLE distribution.pipes ADD COLUMN   id_function integer;
ALTER TABLE distribution.pipes ADD COLUMN   year smallint; /* CHECK (year > 1800 AND year < 2100);*/
ALTER TABLE distribution.pipes ADD COLUMN   folder character(20);
ALTER TABLE distribution.pipes ADD COLUMN   schema_force_view smallint NOT NULL DEFAULT 0;

ALTER TABLE distribution.pipes ADD COLUMN   wkb_geometry geometry;



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

/*----------------!!!---!!!----------------*/
/* ADD CONSTRAINTS */
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
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'LINESTRING'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
/* GIST INDEX*/
CREATE INDEX geoidx ON distribution.pipes USING GIST ( wkb_geometry );


/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/* PIPES VIEW */
DROP VIEW IF EXISTS distribution.pipes_view CASCADE;
CREATE VIEW distribution.pipes_view AS 
	SELECT  pipes.*, 
		pipes_function.function    AS _function_name, 
		pipes_function.schema_view AS _function_schema_view,
		pipes_status.status        AS _status_name,
		pipes_status.active        AS _status_active,
		CASE 
			WHEN pipes.schema_force_view = 0 THEN pipes_function.schema_view
			WHEN pipes.schema_force_view = 1 THEN true
			ELSE false
		END AS _schema_view
		FROM distribution.pipes
		INNER JOIN distribution.pipes_function ON pipes_table.id_function = pipes_function.id
		INNER JOIN distribution.pipes_status   ON pipes_table.id_status   = pipes_status.id;
/*----------------!!!---!!!----------------*/
/* UPDATE RULE */
CREATE OR REPLACE RULE update_pipes AS
	ON UPDATE TO distribution.pipes_view DO INSTEAD
		UPDATE distribution.pipes SET 
			pressure_nominale = NEW.pressure_nominale,
			id_parent = NULLIF(NEW.id_parent,0)::integer,
			schema_force_view  = NEW.schema_force_view
		WHERE fid = NEW.fid;
/*----------------!!!---!!!----------------*/
/* Add view in geometry_columns */
DELETE FROM geometry_columns WHERE f_table_name = 'pipes_view';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	VALUES  ('' , 'distribution', 'pipes_view', 'wkb_geometry', 2, 21781, 'LINESTRING');

