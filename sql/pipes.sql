/*
	qWat - QGIS Water Module
	
	SQL file :: pipes table and view
*/
BEGIN;
DROP TABLE IF EXISTS distribution.pipes CASCADE;
CREATE TABLE distribution.pipes (id serial NOT NULL);
SELECT setval('distribution.pipes_id_seq', 35000, true);

ALTER TABLE distribution.pipes ADD COLUMN   id_parent integer;                                      /* id_parent         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_function integer;									/* id_function       FK */ 
ALTER TABLE distribution.pipes ADD COLUMN   id_install_method integer;                              /* id_install_method FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_material integer;                                    /* id_material       FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_owner integer;										/* id_owner          FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_precision integer;                                   /* id_precision      FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_protection integer;                                  /* id_protection     FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_status integer;                                      /* id_status         FK */
ALTER TABLE distribution.pipes ADD COLUMN   id_pressure_zone integer;								/* id_pressure_zone  FK */
ALTER TABLE distribution.pipes ADD COLUMN   schema_force_view  boolean DEFAULT NULL::boolean;       /* schema_force_view FK */
ALTER TABLE distribution.pipes ADD COLUMN   year smallint CHECK (year > 1800 AND year < 2100);      /* year                 */
ALTER TABLE distribution.pipes ADD COLUMN   tunnel_or_bridge boolean DEFAULT FALSE;                 /* tunnel_or_bridge     */
ALTER TABLE distribution.pipes ADD COLUMN   pressure_nominale smallint;                             /* pressure_nominale    */
ALTER TABLE distribution.pipes ADD COLUMN   folder varchar(20) DEFAULT '';                          /* folder               */
ALTER TABLE distribution.pipes ADD COLUMN   remarks text;                                           /* remarks              */
ALTER TABLE distribution.pipes ADD COLUMN   _length2d decimal(8,2);                                 /* _length2d            */
ALTER TABLE distribution.pipes ADD COLUMN   _length3d decimal(8,2);                                 /* _length3d            */
ALTER TABLE distribution.pipes ADD COLUMN   _length3d_uptodate boolean DEFAULT False;               /* _length3d_uptodate   */
ALTER TABLE distribution.pipes ADD COLUMN   _is_on_map varchar(80) DEFAULT '';                      /* _is_on_map           */
ALTER TABLE distribution.pipes ADD COLUMN   _is_on_district varchar(100) DEFAULT '';                /* _is_on_district      */
                                                                                                    /*                      */
ALTER TABLE distribution.pipes ADD COLUMN   wkb_geometry geometry;                                  /* wkb_geometry         */

ALTER TABLE distribution.pipes ADD COLUMN   material_int_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_nominal_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_internal_material_id character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_ext_diam character(20);
ALTER TABLE distribution.pipes ADD COLUMN   material_thickness character(20);
ALTER TABLE distribution.pipes ADD COLUMN   coating_external_material_id character(20);

/*----------------!!!---!!!----------------*/
/* Add constraints */
/* primary key */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_pkey PRIMARY KEY (id);
/* id_parent */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_parent FOREIGN KEY (id_parent) REFERENCES distribution.pipes (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_parent ON distribution.pipes(id_parent);
/* function */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_function FOREIGN KEY (id_function) REFERENCES distribution.pipes_function(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_function ON distribution.pipes(id_function);
/* id_install_method */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_install_method FOREIGN KEY (id_install_method) REFERENCES distribution.pipes_install_method(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_install_method ON distribution.pipes(id_install_method);
/* id_material */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_material FOREIGN KEY (id_material) REFERENCES distribution.pipes_material(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_material ON distribution.pipes(id_material);
/* id_owner */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_owner FOREIGN KEY (id_owner) REFERENCES distribution.owner(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_owner ON distribution.pipes(id_owner);
/* id_precision */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_precision FOREIGN KEY (id_precision) REFERENCES distribution."precision"(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_precision ON distribution.pipes(id_precision);
/* id_protection */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_protection FOREIGN KEY (id_protection) REFERENCES distribution.pipes_protection(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_protection ON distribution.pipes(id_protection);
/* id_status */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_status FOREIGN KEY (id_status) REFERENCES distribution.pipes_status(id) MATCH FULL ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_status ON distribution.pipes(id_status);
/* id_pressure_zone */
ALTER TABLE distribution.pipes ADD CONSTRAINT pipes_id_pressure_zone FOREIGN KEY (id_pressure_zone) REFERENCES distribution.pressure_zones(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_id_pressure_zone ON distribution.pipes(id_pressure_zone);
/* Geometry */
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'LINESTRING'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.pipes ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
/* GIST index*/
CREATE INDEX pipes_geoidx ON distribution.pipes USING GIST ( wkb_geometry );

/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON TABLE distribution.pipes IS 'Table for pipes. This should not be used for editing/viewing, as a more complete view (pipes_view) exists.';

/*----------------!!!---!!!----------------*/
/* Trigger for 2d length, map and district update */
CREATE OR REPLACE FUNCTION distribution.pipes_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipes SET 
			_length2d          = ST_Length(NEW.wkb_geometry),
			_length3d_uptodate = False,
			_is_on_map         = distribution.get_map(NEW.wkb_geometry),
			_is_on_district    = distribution.get_district(NEW.wkb_geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipes_geom() IS 'Fcn/Trigger: updates the length and other fields of the pipe after insert/update.';

CREATE TRIGGER pipes_geom_trigger 
	AFTER INSERT OR UPDATE OF wkb_geometry ON distribution.pipes
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipes_geom();
COMMENT ON TRIGGER pipes_geom_trigger ON distribution.pipes IS 'Trigger: updates the length and other fields of the pipe after insert/update.';

CREATE OR REPLACE RULE pipes_tunnelbridge AS
	ON UPDATE TO distribution.pipes WHERE NEW.tunnel_or_bridge != OLD.tunnel_or_bridge
	DO ALSO UPDATE distribution.pipes SET _length3d_uptodate = FALSE WHERE id = NEW.id ;
COMMENT ON RULE pipes_tunnelbridge IS 'As for tunnel and bridges, 3d length is the 2d length, set _length3d_uptodate to false to recalculate it later.';


/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/*----------------!!!---!!!----------------*//*----------------!!!---!!!----------------*/
/* PIPES VIEW */
DROP VIEW IF EXISTS distribution.pipes_view CASCADE;
CREATE VIEW distribution.pipes_view AS 
	SELECT  
		pipes.id				,
		pipes.id_parent         ,
		pipes.id_function       ,
		pipes.id_install_method ,
		pipes.id_material       ,
		pipes.id_owner          ,
		pipes.id_precision      ,
		pipes.id_protection     ,
		pipes.id_status         ,
		pipes.id_pressure_zone  ,
		pipes.schema_force_view ,
		pipes.year              ,
		pipes.tunnel_or_bridge  ,
		pipes.pressure_nominale ,
		pipes.folder            ,
		pipes.remarks           , 
		pipes._length2d         ,
		pipes._length3d         ,
		pipes._length3d_uptodate,
		pipes._is_on_map        ,
		pipes._is_on_district   ,
		pipes.wkb_geometry::geometry(LineString,21781),
		sqrt(pow(_length3d,2)-pow(_length2d,2))/_length2d AS _slope,
		pipes_function.function             AS _function_name, 
		pipes_install_method.name           AS _install_method,
		pipes_material._fancy_name          AS _material_name,
		pipes_material.diameter             AS _material_diameter,
		pipes_material.diameter_internal    AS _material_diameter_internal,
		pipes_material.diameter_external    AS _material_diameter_external,
		owner.name                          AS _owner,
		"precision".name                    AS _precision,
		pipes_protection.name               AS _protection,
		pipes_status.status                 AS _status_name,
		pipes_status.active                 AS _status_active,
		pressure_zones.name                 AS _pressure_zone,
		CASE 
			WHEN pipes.schema_force_view IS NULL THEN pipes_function.schema_view
			ELSE pipes.schema_force_view
		END AS _schema_view
		FROM distribution.pipes
		INNER JOIN distribution.pipes_function         ON pipes.id_function       = pipes_function.id
		INNER JOIN distribution.pipes_install_method   ON pipes.id_install_method = pipes_install_method.id
		INNER JOIN distribution.pipes_material         ON pipes.id_material       = pipes_material.id
		LEFT OUTER JOIN  distribution.owner            ON pipes.id_owner          = owner.id
		INNER JOIN distribution."precision"            ON pipes.id_precision      = "precision".id
		LEFT OUTER JOIN  distribution.pipes_protection ON pipes.id_protection     = pipes_protection.id
		INNER JOIN distribution.pipes_status           ON pipes.id_status         = pipes_status.id
		LEFT OUTER JOIN  distribution.pressure_zones   ON pipes.id_pressure_zone  = pressure_zones.id;
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
			id_owner           = NEW.id_owner           ,
			id_pressure_zone   = NEW.id_pressure_zone   ,
			id_precision       = NEW.id_precision       ,
			id_protection      = NEW.id_protection      ,
			id_install_method  = NEW.id_install_method  ,
			year               = NEW.year               ,
			tunnel_or_bridge   = NEW.tunnel_or_bridge   ,
			pressure_nominale  = NEW.pressure_nominale  ,
			schema_force_view  = NEW.schema_force_view  ,
			folder             = NEW.folder             ,
			remarks            = NEW.remarks            ,
			wkb_geometry       = NEW.wkb_geometry       ,
			id_parent          = NULLIF(NEW.id_parent,0)::integer	
		WHERE id = NEW.id;
CREATE OR REPLACE RULE pipes_insert AS
	ON INSERT TO distribution.pipes_view DO INSTEAD
		INSERT INTO distribution.pipes 
			(    id_function,    id_material,    id_status,    id_parent,    id_owner,    id_pressure_zone,    id_precision,    id_protection,    id_install_method,    year,    tunnel_or_bridge,    pressure_nominale,    schema_force_view,    folder,    remarks,    wkb_geometry)     
		VALUES
			(NEW.id_function,NEW.id_material,NEW.id_status,NEW.id_parent,NEW.id_owner,NEW.id_pressure_zone,NEW.id_precision,NEW.id_protection,NEW.id_install_method,NEW.year,NEW.tunnel_or_bridge,NEW.pressure_nominale,NEW.schema_force_view,NEW.folder,NEW.remarks,NEW.wkb_geometry);
CREATE OR REPLACE RULE pipes_delete AS
	ON DELETE TO distribution.pipes_view DO INSTEAD
		DELETE FROM distribution.pipes WHERE id = OLD.id;
/* Comments */	
COMMENT ON RULE pipes_update IS 'Rule to forward changes for pipes_view to the table pipes.';
COMMENT ON RULE pipes_insert IS 'Rule to forward insert of pipes_view to the table pipes.';
COMMENT ON RULE pipes_delete IS 'Rule to forward deletion of pipes_view to the table pipes.';

COMMIT;
