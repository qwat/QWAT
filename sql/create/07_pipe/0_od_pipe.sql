/*
 qWat - QGIS Water Module
 
 SQL file :: pipe table
*/

/* create */
DROP TABLE IF EXISTS qwat.od_pipe CASCADE;
CREATE TABLE qwat.od_pipe (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_pipe IS 'Table for pipe. This should not be used for editing/viewing, as a more complete view (pipe_view) exists.';


/* columns */                                                                          
ALTER TABLE qwat.od_pipe ADD COLUMN id_parent              integer;                                      /* id_parent            FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_function            integer not null;                             /* id_function          FK */ 
ALTER TABLE qwat.od_pipe ADD COLUMN id_installmethod       integer not null;                             /* id_installmethod     FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_material            integer not null;                             /* id_material          FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_distributor         integer not null;                             /* id_distributor       FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_precision           integer not null;                             /* id_precision         FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_protection          integer;                                      /* id_protection        FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_status              integer not null;                             /* id_status            FK */
ALTER TABLE qwat.od_pipe ADD COLUMN id_watertype           integer not null;                             /* id_watertype         FK */
ALTER TABLE qwat.od_pipe ADD COLUMN labelremark            varchar(150) default '';                      /* labelemark              */
ALTER TABLE qwat.od_pipe ADD COLUMN year                   smallint CHECK ((year > 1800 AND year < 2100) or year is null); /* year  */
ALTER TABLE qwat.od_pipe ADD COLUMN tunnel_or_bridge       boolean default false;                        /* tunnel_or_bridge        */
ALTER TABLE qwat.od_pipe ADD COLUMN pressure_nominal       smallint default 16;                          /* pressure_nominale       */
ALTER TABLE qwat.od_pipe ADD COLUMN folder                 varchar(20) default '';                       /* folder                  */
ALTER TABLE qwat.od_pipe ADD COLUMN remark                 text        default '' ;                      /* remark                  */
ALTER TABLE qwat.od_pipe ADD COLUMN _valve_count           smallint default NULL;                        /* _valve_count            */
ALTER TABLE qwat.od_pipe ADD COLUMN _valve_closed          boolean default NULL;                         /* _valve_closed           */
ALTER TABLE qwat.od_pipe ADD COLUMN label_visible_1         smallint default 1;                           /* label_view 0: hide, 1: show, 2: always show */
ALTER TABLE qwat.od_pipe ADD COLUMN label_visible_2         smallint default 1;                           /* label_view 0: hide, 1: show, 2: always show */


/* schema view */
SELECT qwat.fn_enable_schemaview( 'od_pipe', 'vl_pipe_function', 'id_function' );


/* old columns */
ALTER TABLE qwat.od_pipe ADD COLUMN coating_internal_material_id character(20);
ALTER TABLE qwat.od_pipe ADD COLUMN coating_external_material_id character(20);

/* Constraints */
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_parent         FOREIGN KEY (id_parent)         REFERENCES qwat.od_pipe (id)              MATCH SIMPLE ; CREATE INDEX fki_pipe_id_parent        ON qwat.od_pipe(id_parent);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_function       FOREIGN KEY (id_function)       REFERENCES qwat.vl_pipe_function(id)      MATCH FULL   ; CREATE INDEX fki_pipe_id_function      ON qwat.od_pipe(id_function);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_installmethod  FOREIGN KEY (id_installmethod)  REFERENCES qwat.vl_pipe_installmethod(id) MATCH FULL   ; CREATE INDEX fki_pipe_id_installmethod ON qwat.od_pipe(id_installmethod);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_material       FOREIGN KEY (id_material)       REFERENCES qwat.vl_pipe_material(id)      MATCH FULL   ; CREATE INDEX fki_pipe_id_material      ON qwat.od_pipe(id_material);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_distributor    FOREIGN KEY (id_distributor)    REFERENCES qwat.od_distributor(id)        MATCH FULL   ; CREATE INDEX fki_pipe_id_distributor   ON qwat.od_pipe(id_distributor);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_precision      FOREIGN KEY (id_precision)      REFERENCES qwat.vl_precision(id)          MATCH FULL   ; CREATE INDEX fki_pipe_id_precision     ON qwat.od_pipe(id_precision);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_protection     FOREIGN KEY (id_protection)     REFERENCES qwat.vl_pipe_protection(id)    MATCH SIMPLE ; CREATE INDEX fki_pipe_id_protection    ON qwat.od_pipe(id_protection);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_status         FOREIGN KEY (id_status)         REFERENCES qwat.vl_status(id)             MATCH FULL   ; CREATE INDEX fki_pipe_id_status        ON qwat.od_pipe(id_status);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_id_watertype      FOREIGN KEY (id_watertype)      REFERENCES qwat.vl_watertype(id)          MATCH FULL   ; CREATE INDEX fki_pipe_id_watertype     ON qwat.od_pipe(id_watertype);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_label_visible_1    FOREIGN KEY (label_visible_1)    REFERENCES qwat.vl_visible(vl_code_int)   MATCH FULL   ; CREATE INDEX fki_pipe_label_visible_1   ON qwat.od_pipe(label_visible_1);
ALTER TABLE qwat.od_pipe ADD CONSTRAINT pipe_label_visible_2    FOREIGN KEY (label_visible_2)    REFERENCES qwat.vl_visible(vl_code_int)   MATCH FULL   ; CREATE INDEX fki_pipe_label_visible_2   ON qwat.od_pipe(label_visible_2);


/*----------------!!!---!!!----------------*/
/* Trigger for tunnel_or_bridge */
CREATE OR REPLACE FUNCTION qwat.ft_pipe_tunnelbridge() RETURNS trigger AS
$BODY$ 
 BEGIN
  NEW._length3d := NULL;
  NEW._diff_elevation := NULL;
  RETURN NEW;
 END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER tr_pipe_tunnelbridge
 BEFORE INSERT OR UPDATE OF tunnel_or_bridge ON qwat.od_pipe
 FOR EACH ROW EXECUTE PROCEDURE qwat.ft_pipe_tunnelbridge();
COMMENT ON TRIGGER tr_pipe_tunnelbridge ON qwat.od_pipe IS 'For tunnel and bridges, 3d length is the 2d length (i.e. pipes are considered as horinzontal).';








