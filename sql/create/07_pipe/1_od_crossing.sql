CREATE TABLE distribution.od_crossing
(
  id serial NOT NULL,
  used boolean NOT NULL DEFAULT true,
  controled boolean NOT NULL DEFAULT false,
  use_pipe smallint NOT NULL DEFAULT 1,
  pipe1_id integer,
  pipe2_id integer,
  pipe1_angle double precision,
  pipe2_angle double precision,
  CONSTRAINT od_crossing_pkey PRIMARY KEY (id),
  CONSTRAINT od_crossing_pipe1 FOREIGN KEY (pipe1_id)
      REFERENCES distribution.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT od_crossing_pipe2 FOREIGN KEY (pipe2_id)
      REFERENCES distribution.od_pipe (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
