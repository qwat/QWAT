/*
	qWat - QGIS Water Module
	
	SQL file :: pipe table
*/

/* create */
DROP TABLE IF EXISTS distribution.pipe CASCADE;
CREATE TABLE distribution.pipe (id serial NOT NULL);
COMMENT ON TABLE distribution.pipe IS 'Table for pipe. This should not be used for editing/viewing, as a more complete view (pipe_view) exists.';
SELECT setval('distribution.pipe_id_seq', 35000, true);

/* columns */
ALTER TABLE distribution.pipe ADD COLUMN id_parent integer;                                    /* id_parent            FK */
ALTER TABLE distribution.pipe ADD COLUMN id_function integer;								   /* id_function          FK */ 
ALTER TABLE distribution.pipe ADD COLUMN id_install_method integer;                            /* id_install_method    FK */
ALTER TABLE distribution.pipe ADD COLUMN id_material integer;                                  /* id_material          FK */
ALTER TABLE distribution.pipe ADD COLUMN id_distributor integer;							   /* id_distributor       FK */
ALTER TABLE distribution.pipe ADD COLUMN id_precision integer;                                 /* id_precision         FK */
ALTER TABLE distribution.pipe ADD COLUMN id_protection integer;                                /* id_protection        FK */
ALTER TABLE distribution.pipe ADD COLUMN id_status integer;                                    /* id_status            FK */
ALTER TABLE distribution.pipe ADD COLUMN labelview integer default 2;                          /* label_view           FK */
ALTER TABLE distribution.pipe ADD COLUMN labelview_schema integer default 2;                   /* label_view_schema    FK */
ALTER TABLE distribution.pipe ADD COLUMN labeladdremark boolean default false;                 /* labeladdremark          */
ALTER TABLE distribution.pipe ADD COLUMN labeladdremark_schema boolean default false;          /* labeladdremark_schema   */
ALTER TABLE distribution.pipe ADD COLUMN year smallint CHECK (year > 1800 AND year < 2100);    /* year                    */
ALTER TABLE distribution.pipe ADD COLUMN tunnel_or_bridge boolean default false;               /* tunnel_or_bridge        */
ALTER TABLE distribution.pipe ADD COLUMN pressure_nominal smallint default 16;                 /* pressure_nominale       */
ALTER TABLE distribution.pipe ADD COLUMN folder varchar(20) default '';                        /* folder                  */
ALTER TABLE distribution.pipe ADD COLUMN remarks text;                                         /* remarks                 */
ALTER TABLE distribution.pipe ADD COLUMN _valve_count  smallint default NULL;                  /* _valve_count            */
ALTER TABLE distribution.pipe ADD COLUMN _valve_closed boolean default NULL;                   /* _valve_closed           */

/* schema view */
SELECT distribution.enable_schemaview('pipe','function');

/* geometry */
SELECT distribution.geom_tool_line('pipe');

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
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_labelview         FOREIGN KEY (labelview)         REFERENCES distribution.labelview(id)           MATCH FULL   ; CREATE INDEX fki_pipe_labelview         ON distribution.pipe(labelview);
ALTER TABLE distribution.pipe ADD CONSTRAINT pipe_labelview_schema  FOREIGN KEY (labelview_schema)  REFERENCES distribution.labelview(id)           MATCH FULL   ; CREATE INDEX fki_pipe_labelview_schema  ON distribution.pipe(labelview_schema);


/*----------------!!!---!!!----------------*/
/* Trigger for tunnel_or_bridge */
CREATE OR REPLACE FUNCTION distribution.pipe_tunnelbridge() RETURNS trigger AS
$BODY$ 
	BEGIN
		UPDATE distribution.pipe SET _length3d = NULL, _diff_elevation = NULL WHERE id = NEW.id;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER pipe_tunnelbridge_trigger
	AFTER INSERT OR UPDATE OF tunnel_or_bridge ON distribution.pipe
	FOR EACH ROW EXECUTE PROCEDURE distribution.pipe_tunnelbridge();
COMMENT ON TRIGGER pipe_tunnelbridge_trigger ON distribution.pipe IS 'For tunnel and bridges, 3d length is the 2d length (i.e. pipes are considered as horinzontal).';








