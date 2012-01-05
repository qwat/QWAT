/*
	qWat - QGIS Water Module
	
	SQL file :: pipes table and view
*/
BEGIN;
DROP TABLE IF EXISTS distribution.pipes CASCADE;
CREATE TABLE distribution.pipes (fid serial NOT NULL);

ALTER TABLE distribution.pipes ADD COLUMN   id_function integer;									/* id_function          */ 
ALTER TABLE distribution.pipes ADD COLUMN   id_material integer;                                    /* id_material          */
ALTER TABLE distribution.pipes ADD COLUMN   id_status integer;                                      /* id_status            */
ALTER TABLE distribution.pipes ADD COLUMN   id_parent integer;                                      /* id_parent            */
ALTER TABLE distribution.pipes ADD COLUMN   id_owner integer;										/* id_owner             */
ALTER TABLE distribution.pipes ADD COLUMN   year smallint CHECK (year > 1800 AND year < 2100);      /* year                 */
ALTER TABLE distribution.pipes ADD COLUMN   pressure_nominale smallint;                             /* pressure_nominale    */
ALTER TABLE distribution.pipes ADD COLUMN   _length2d decimal(8,2);                                 /* _length2d            */
ALTER TABLE distribution.pipes ADD COLUMN   _length3d decimal(8,2);                                 /* _length3d            */
ALTER TABLE distribution.pipes ADD COLUMN   schema_force_view  boolean DEFAULT NULL::boolean;       /* schema_force_view    */
ALTER TABLE distribution.pipes ADD COLUMN   folder varchar(20) DEFAULT '';                          /* folder               */
ALTER TABLE distribution.pipes ADD COLUMN   _is_on_map varchar(80) DEFAULT '';                      /* _is_on_map           */
ALTER TABLE distribution.pipes ADD COLUMN   remarks text;                                           /* remarks              */
                                                                                                    /*                      */
ALTER TABLE distribution.pipes ADD COLUMN   wkb_geometry geometry;                                  /* wkb_geometry         */

ALTER TABLE distribution.pipes ADD COLUMN   id_precision_2d character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_location character(20);
ALTER TABLE distribution.pipes ADD COLUMN   id_install_method character(20);


ALTER TABLE distribution.pipes ADD COLUMN   material_int_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   protection_coating_detail character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_nominal_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_internal_material_id character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_ext_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_thickness character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_external_material_id character(20);

ALTER TABLE distribution.pipes ADD COLUMN   z_folio character(20);
ALTER TABLE distribution.pipes ADD COLUMN   "z_deleted" character(20);



/*----------------!!!---!!!----------------*/
/* Add constraints */
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
/* material */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_material FOREIGN KEY (id_material) REFERENCES distribution.pipes_material(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_material ON distribution.pipes(id_material);
/* owner */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_owner FOREIGN KEY (id_owner) REFERENCES distribution.pipes_owner(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_owner ON distribution.pipes(id_owner);
/* owner */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_visible FOREIGN KEY (schema_force_view) REFERENCES distribution.visible("value") MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_visible ON distribution.pipes(schema_force_view);
/* Geometry */
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'LINESTRING'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
/* GIST index*/
CREATE INDEX geoidx ON distribution.pipes USING GIST ( wkb_geometry );

/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON TABLE distribution.pipes IS 'Table for pipes. This should not be used for vewing, as a more complete view (pipes_view) exists.';

/*----------------!!!---!!!----------------*/
/* Trigger fr 2d length */
CREATE OR REPLACE FUNCTION distribution.pipes_length2d() RETURNS trigger AS ' 
	BEGIN
		 UPDATE distribution.pipes SET _length2d = ST_Length(NEW.wkb_geometry) WHERE fid = NEW.fid ;
		 RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_length2d() IS 'Fcn/Trigger: updates the length of the pipe after insert/update.';

CREATE TRIGGER length2d_trigger 
	AFTER INSERT OR UPDATE OF wkb_geometry ON distribution.pipes
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipes_length2d();
COMMENT ON TRIGGER length2d_trigger ON distribution.pipes IS 'Trigger: updates the length of the pipe after insert/update.';


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
			WHEN pipes.schema_force_view IS NULL THEN pipes_function.schema_view
			ELSE pipes.schema_force_view
		END AS _schema_view
		FROM distribution.pipes
		INNER JOIN distribution.pipes_function ON pipes.id_function = pipes_function.id
		INNER JOIN distribution.pipes_status   ON pipes.id_status   = pipes_status.id;
/*----------------!!!---!!!----------------*/
/* Add view in geometry_columns */
DELETE FROM geometry_columns WHERE f_table_name = 'pipes_view';
INSERT INTO geometry_columns (f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	VALUES  ('' , 'distribution', 'pipes_view', 'wkb_geometry', 2, 21781, 'LINESTRING');
/*----------------!!!---!!!----------------*/
/* Comment */	
COMMENT ON VIEW distribution.pipes_view IS 'View for pipes. This view is editable (a rule exists to forwad changes to the table). 
		schema_view is a boolean to define if the pipes is visible in the schematic view. This field is usually determined by the pipe''s function attribute schema_view,
		but it can be overridden by the pipe''s attribute schema_force_view.';


/*----------------!!!---!!!----------------*/
/* INSERT,UPDATE,DELETE RULES */
CREATE OR REPLACE RULE pipes_update AS
	ON UPDATE TO distribution.pipes_view DO INSTEAD
		UPDATE distribution.pipes SET 
			id_function        = NEW.id_function        ,
			id_material        = NEW.id_material        ,
			id_status          = NEW.id_status          ,
			id_owner           = NEW.id_owner          ,
			year               = NEW.year               ,
			pressure_nominale  = NEW.pressure_nominale  ,
			_length2d          = NEW._length2d          ,
			_length3d          = NEW._length3d          ,
			schema_force_view  = NEW.schema_force_view  ,
			folder             = NEW.folder             ,
			_is_on_map         = NEW._is_on_map         ,
			remarks            = NEW.remarks            ,
			wkb_geometry       = NEW.wkb_geometry       ,
			id_parent          = NULLIF(NEW.id_parent,0)::integer	
		WHERE fid = NEW.fid;
CREATE OR REPLACE RULE pipes_insert AS
	ON INSERT TO distribution.pipes_view DO INSTEAD
		INSERT INTO distribution.pipes 
			(    id_function,    id_material,    id_status,    id_parent,    id_owner,    year,    pressure_nominale,    _length2d,    _length3d,    schema_force_view,    folder,    _is_on_map,    remarks,    wkb_geometry)     
		VALUES
			(NEW.id_function,NEW.id_material,NEW.id_status,NEW.id_parent,NEW.id_owner,NEW.year,NEW.pressure_nominale,NEW._length2d,NEW._length3d,NEW.schema_force_view,NEW.folder,NEW._is_on_map,NEW.remarks,NEW.wkb_geometry);
CREATE OR REPLACE RULE pipes_delete AS
	ON DELETE TO distribution.pipes_view DO INSTEAD
		DELETE FROM distribution.pipes WHERE fid = OLD.fid;
/* Comments */	
COMMENT ON RULE pipes_update IS 'Rule to forward changes for pipes_view to the table pipes.';
COMMENT ON RULE pipes_insert IS 'Rule to forward insert of pipes_view to the table pipes.';
COMMENT ON RULE pipes_delete IS 'Rule to forward deletion of pipes_view to the table pipes.';


COMMIT;

