DROP TABLE IF EXISTS distribution.od_crossing;
CREATE TABLE distribution.od_crossing
(
  id serial NOT NULL,
  disabled boolean NOT NULL DEFAULT false,
  controled boolean NOT NULL DEFAULT false,
  use_pipe smallint NOT NULL DEFAULT 1,
  _pipe1_id integer,
  _pipe2_id integer,
  _pipe1_angle double precision,
  _pipe2_angle double precision,
  CONSTRAINT od_crossing_pkey PRIMARY KEY (id),
  CONSTRAINT od_crossing_pipe1 FOREIGN KEY (_pipe1_id)
      REFERENCES distribution.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT od_crossing_pipe2 FOREIGN KEY (_pipe2_id)
      REFERENCES distribution.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

SELECT AddGeometryColumn('distribution','od_crossing', 'geometry', 21781, 'Point', 2);

CREATE OR REPLACE FUNCTION distribution.controled_crossing()
RETURNS trigger AS
$BODY$
	BEGIN
		NEW.controled = true;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER controled_crossing_trigger 
BEFORE UPDATE ON distribution.od_crossing
FOR EACH ROW
WHEN (NEW.use_pipe != OLD.use_pipe)
EXECUTE PROCEDURE distribution.controled_crossing();

