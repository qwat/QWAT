/*
	qWat - QGIS Water Module
	
	SQL file :: sprinklinghydrant
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.sprinklinghydrant CASCADE;
CREATE TABLE distribution.sprinklinghydrant (id serial NOT NULL);
SELECT setval('distribution.sprinklinghydrant_id_seq', 100, true);
COMMENT ON TABLE distribution.sprinklinghydrant IS 'sprinklinghydrant.';

/* columns */
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  identification             character varying (15)  ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  id_type          integer                 ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  id_distributor   integer                 ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  id_status        integer                 ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  id_provider      integer                 ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  id_district      integer                 ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  year smallint    CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  model            varchar(30)             ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  altitude_real    decimal(10,3)           ;
ALTER TABLE distribution.sprinklinghydrant ADD COLUMN  remarks          text                    ;



/* geometry */
SELECT distribution.geom_tool_point('sprinklinghydrant',true,false,false,false,true);

/* primary key */
ALTER TABLE distribution.sprinklinghydrant ADD CONSTRAINT sprinklinghydrant_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.sprinklinghydrant ADD CONSTRAINT sprinklinghydrant_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.sprinklinghydrant_type(id)     MATCH FULL  ; CREATE INDEX fki_sprinklinghydrant_id_type         ON distribution.sprinklinghydrant(id_type)        ;
ALTER TABLE distribution.sprinklinghydrant ADD CONSTRAINT sprinklinghydrant_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)      MATCH FULL  ; CREATE INDEX fki_sprinklinghydrant_id_distributor  ON distribution.sprinklinghydrant(id_distributor) ;
ALTER TABLE distribution.sprinklinghydrant ADD CONSTRAINT sprinklinghydrant_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)           MATCH FULL  ; CREATE INDEX fki_sprinklinghydrant_id_status       ON distribution.sprinklinghydrant(id_status)      ;
ALTER TABLE distribution.sprinklinghydrant ADD CONSTRAINT sprinklinghydrant_id_provider     FOREIGN KEY (id_provider)     REFERENCES distribution.sprinklinghydrant_provider(id) MATCH SIMPLE; CREATE INDEX fki_sprinklinghydrant_id_provider     ON distribution.sprinklinghydrant(id_provider)    ;



COMMIT;
