CREATE TABLE qwat.od_crossing
(
  id serial NOT NULL,
  disabled boolean NOT NULL DEFAULT false,
  controled boolean NOT NULL DEFAULT false,
  hide_pipe smallint NOT NULL DEFAULT 1,
  _pipe1_id integer,
  _pipe2_id integer,
  _pipe1_angle double precision,
  _pipe2_angle double precision,
  CONSTRAINT od_crossing_pkey PRIMARY KEY (id),
  CONSTRAINT od_crossing_pipe1 FOREIGN KEY (_pipe1_id)
      REFERENCES qwat.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT od_crossing_pipe2 FOREIGN KEY (_pipe2_id)
      REFERENCES qwat.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

SELECT AddGeometryColumn('qwat','od_crossing', 'geometry', 21781, 'Point', 2);

CREATE OR REPLACE FUNCTION qwat.ft_controled_crossing()
RETURNS trigger AS
$BODY$
	BEGIN
		NEW.controled = true;
		RETURN NEW;
	END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER tr_controled_crossing
BEFORE UPDATE ON qwat.od_crossing
FOR EACH ROW
WHEN (NEW.hide_pipe != OLD.hide_pipe)
EXECUTE PROCEDURE qwat.ft_controled_crossing();

