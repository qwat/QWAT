/*
	qWat - QGIS Water Module
	
	SQL file :: hydrants
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.hydrants CASCADE;
CREATE TABLE distribution.hydrants (id serial NOT NULL);
SELECT setval('distribution.hydrants_id_seq', 100, true);
COMMENT ON TABLE distribution.hydrants IS 'hydrants.';

/* columns */
ALTER TABLE distribution.hydrants ADD COLUMN  sige             integer     DEFAULT '' ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_type          integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_distributor   integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_status        integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_provider      integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_district      integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  id_pressurezone integer                 ;
ALTER TABLE distribution.hydrants ADD COLUMN  year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.hydrants ADD COLUMN  altitude         decimal(10,3)            ;
ALTER TABLE distribution.hydrants ADD COLUMN  model            varchar(30)              ;
ALTER TABLE distribution.hydrants ADD COLUMN  _is_on_map       varchar(30)              ;
ALTER TABLE distribution.hydrants ADD COLUMN  remarks          text                      ;

partie inferieure
sortie centrale checkbox
plaque montee cb
emplacement
precis alti
statut
troncons


/* geometry */
SELECT AddGeometryColumn('distribution', 'hydrants', 'geometry', 21781, 'POINT', 2);
CREATE INDEX hydrants_geoidx ON distribution.hydrants USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.hydrants ADD CONSTRAINT hydrants_pkey PRIMARY KEY (id);


/* Constraints */
/* id_type */
ALTER TABLE distribution.hydrants ADD CONSTRAINT hydrants_id_type   FOREIGN KEY (id_type)   REFERENCES distribution.hydrants_type(id)   MATCH FULL; CREATE INDEX fki_hydrants_id_type   ON distribution.hydrants(id_type)  ;
ALTER TABLE distribution.hydrants ADD CONSTRAINT hydrants_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)                MATCH FULL; CREATE INDEX fki_hydrants_id_distributor  ON distribution.hydrants(id_distributor) ;
ALTER TABLE distribution.hydrants ADD CONSTRAINT hydrants_id_status FOREIGN KEY (id_status) REFERENCES distribution.hydrants_status(id) MATCH FULL; CREATE INDEX fki_hydrants_id_status ON distribution.hydrants(id_status);



COMMIT;
