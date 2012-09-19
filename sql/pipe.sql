/*
	qWat - QGIS Water Module
	
	SQL file :: pipe table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.pipe CASCADE;
CREATE TABLE distribution.pipe (id serial NOT NULL);
COMMENT ON TABLE distribution.pipe IS 'Table for pipe. This should not be used for editing/viewing, as a more complete view (pipe_view) exists.';
SELECT setval('distribution.pipe_id_seq', 35000, true);

/* columns */
ALTER TABLE distribution.pipe ADD COLUMN id_parent integer;                                    /* id_parent         FK */
ALTER TABLE distribution.pipe ADD COLUMN id_function integer;								   /* id_function       FK */ 
ALTER TABLE distribution.pipe ADD COLUMN id_install_method integer;                            /* id_install_method FK */
ALTER TABLE distribution.pipe ADD COLUMN id_material integer;                                  /* id_material       FK */
ALTER TABLE distribution.pipe ADD COLUMN id_distributor integer;							   /* id_distributor    FK */
ALTER TABLE distribution.pipe ADD COLUMN id_precision integer;                                 /* id_precision      FK */
ALTER TABLE distribution.pipe ADD COLUMN id_protection integer;                                /* id_protection     FK */
ALTER TABLE distribution.pipe ADD COLUMN id_status integer;                                    /* id_status         FK */
ALTER TABLE distribution.pipe ADD COLUMN id_node_a integer;			          				   /* id_node_a         FK */
ALTER TABLE distribution.pipe ADD COLUMN id_node_b integer;			          				   /* id_node_b         FK */
ALTER TABLE distribution.pipe ADD COLUMN id_pressurezone integer;							   /* id_pressurezone   FK */
ALTER TABLE distribution.pipe ADD COLUMN schema_force_view  boolean DEFAULT NULL::boolean;     /* schema_force_view FK */
ALTER TABLE distribution.pipe ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);    /* year                 */
ALTER TABLE distribution.pipe ADD COLUMN tunnel_or_bridge boolean DEFAULT false;               /* tunnel_or_bridge     */
ALTER TABLE distribution.pipe ADD COLUMN pressure_nominale smallint;                           /* pressure_nominale    */
ALTER TABLE distribution.pipe ADD COLUMN folder varchar(20) DEFAULT '';                        /* folder               */
ALTER TABLE distribution.pipe ADD COLUMN remarks text;                                         /* remarks              */
ALTER TABLE distribution.pipe ADD COLUMN _length2d decimal(8,2);                               /* _length2d            */
ALTER TABLE distribution.pipe ADD COLUMN _length3d decimal(8,2) DEFAULT NULL;                  /* _length3d            */
ALTER TABLE distribution.pipe ADD COLUMN _is_on_map varchar(80) DEFAULT '';                    /* _is_on_map           */
ALTER TABLE distribution.pipe ADD COLUMN _is_on_district varchar(100) DEFAULT '';              /* _is_on_district      */

/* geometry */
SELECT addGeometryColumn('distribution', 'pipe', 'geometry', 21781, 'LINESTRING', 2);
SELECT addGeometryColumn('distribution', 'pipe', 'geometry_schematic', 21781, 'LINESTRING', 2);
CREATE INDEX pipe_geoidx     ON distribution.pipe USING GIST ( geometry );
CREATE INDEX pipe_geoidx_alt ON distribution.pipe USING GIST ( geometry_schematic );

/* old columns */
ALTER TABLE distribution.pipe ADD COLUMN   coating_internal_material_id character(20);
ALTER TABLE distribution.pipe ADD COLUMN   coating_external_material_id character(20);

/* Constraints */
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_parent         FOREIGN KEY (id_parent)         REFERENCES distribution.pipe (id)               MATCH SIMPLE ; CREATE INDEX fki_pipe_id_parent         ON distribution.pipe(id_parent);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_function       FOREIGN KEY (id_function)       REFERENCES distribution.pipe_function(id)       MATCH FULL   ; CREATE INDEX fki_pipe_id_function       ON distribution.pipe(id_function);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_install_method FOREIGN KEY (id_install_method) REFERENCES distribution.pipe_install_method(id) MATCH FULL   ; CREATE INDEX fki_pipe_id_install_method ON distribution.pipe(id_install_method);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_material       FOREIGN KEY (id_material)       REFERENCES distribution.pipe_material(id)       MATCH FULL   ; CREATE INDEX fki_pipe_id_material       ON distribution.pipe(id_material);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_distributor    FOREIGN KEY (id_distributor)    REFERENCES distribution.distributor(id)         MATCH FULL   ; CREATE INDEX fki_pipe_id_distributor    ON distribution.pipe(id_distributor);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_precision      FOREIGN KEY (id_precision)      REFERENCES distribution."precision"(id)         MATCH FULL   ; CREATE INDEX fki_pipe_id_precision      ON distribution.pipe(id_precision);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_protection     FOREIGN KEY (id_protection)     REFERENCES distribution.pipe_protection(id)     MATCH SIMPLE ; CREATE INDEX fki_pipe_id_protection     ON distribution.pipe(id_protection);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_status         FOREIGN KEY (id_status)         REFERENCES distribution.status(id)              MATCH FULL   ; CREATE INDEX fki_pipe_id_status         ON distribution.pipe(id_status);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_node_a         FOREIGN KEY (id_node_a)         REFERENCES distribution.node(id)                MATCH SIMPLE ; CREATE INDEX fki_pipe_id_node_a         ON distribution.pipe(id_node_a);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_node_b         FOREIGN KEY (id_node_b)         REFERENCES distribution.node(id)                MATCH SIMPLE ; CREATE INDEX fki_pipe_id_node_b         ON distribution.pipe(id_node_b);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_id_pressurezone   FOREIGN KEY (id_pressurezone)   REFERENCES distribution.pressurezone(id)        MATCH SIMPLE ; CREATE INDEX fki_pipe_id_pressurezone   ON distribution.pipe(id_pressurezone);

/*----------------!!!---!!!----------------*/
/* Trigger for 2d length, map and district update */
CREATE OR REPLACE FUNCTION distribution.pipe_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipe SET
			id_node_a            = distribution.node_get_id(ST_StartPoint(NEW.geometry),true),
			id_node_b            = distribution.node_get_id(ST_EndPoint(  NEW.geometry),true),
			id_pressurezone      = distribution.get_pressurezone_id(NEW.geometry),
			_length2d            = ST_Length(NEW.geometry),
			_length3d            = NULL,
			_is_on_map           = distribution.get_map(NEW.geometry),
			_is_on_district      = distribution.get_district(NEW.geometry),
			geometry_schematic   = NEW.geometry
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.pipe_geom() IS 'Fcn/Trigger: updates the length and other fields of the pipe after insert/update.';

CREATE TRIGGER pipe_geom_trigger_insert
	AFTER INSERT ON distribution.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.pipe_geom();
COMMENT ON TRIGGER pipe_geom_trigger_insert ON distribution.pipe IS 'Trigger: updates auto fields of the pipe after insert.';

CREATE TRIGGER pipe_geom_trigger_update
	AFTER UPDATE OF geometry ON distribution.pipe 
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE distribution.pipe_geom();
COMMENT ON TRIGGER pipe_geom_trigger_update ON distribution.pipe IS 'Trigger: updates auto fields of the pipe after geometry update.';

COMMIT;
