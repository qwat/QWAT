/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.hydrant CASCADE;
CREATE TABLE distribution.hydrant (id serial NOT NULL);
SELECT setval('distribution.hydrant_id_seq', 100, true);
COMMENT ON TABLE distribution.hydrant IS 'hydrant.';

/* columns */
ALTER TABLE distribution.hydrant ADD COLUMN  sige             integer     DEFAULT '' ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_type          integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_distributor   integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_status        integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_provider      integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_district      integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  id_pressurezone integer                 ;
ALTER TABLE distribution.hydrant ADD COLUMN  year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.hydrant ADD COLUMN  altitude         decimal(10,3)            ;
ALTER TABLE distribution.hydrant ADD COLUMN  model            varchar(30)              ;
ALTER TABLE distribution.hydrant ADD COLUMN  _is_on_map       varchar(30)              ;
ALTER TABLE distribution.hydrant ADD COLUMN  remarks          text                      ;

partie inferieure
sortie centrale checkbox
plaque montee cb
emplacement
precis alti
statut
troncons


/* geometry */
SELECT AddGeometryColumn('distribution', 'hydrant', 'geometry', 21781, 'POINT', 2);
CREATE INDEX hydrant_geoidx ON distribution.hydrant USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_type   FOREIGN KEY (id_type)   REFERENCES distribution.hydrant_type(id)   MATCH FULL; CREATE INDEX fki_hydrant_id_type   ON distribution.hydrant(id_type)  ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)                MATCH FULL; CREATE INDEX fki_hydrant_id_distributor  ON distribution.hydrant(id_distributor) ;
ALTER TABLE distribution.hydrant ADD CONSTRAINT hydrant_id_status FOREIGN KEY (id_status) REFERENCES distribution.hydrant_status(id) MATCH FULL; CREATE INDEX fki_hydrant_id_status ON distribution.hydrant(id_status);



COMMIT;
