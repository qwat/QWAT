/*
	qWat - QGIS Water Module
	
	SQL file :: installation <- treatment
*/




/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_treatment CASCADE;
CREATE TABLE distribution.installation_treatment (id serial NOT NULL);
SELECT setval('distribution.installation_treatment_id_seq', 100, true);
COMMENT ON TABLE distribution.installation_treatment IS 'storage treatments. These are related to installations and are made of cisterns';

/* columns */
ALTER TABLE distribution.installation_treatment ADD COLUMN id_installation               integer      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN sanitization_uv               boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN sanitization_chlorine_liquid  boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN sanitization_chlorine_gazeous boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN sanitization_ozone            boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN filtration_membrane           boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN filtration_sandorgravel       boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN flocculation                  boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN activatedcharcoal             boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN settling                      boolean      ;
ALTER TABLE distribution.installation_treatment ADD COLUMN treatment_capacity            decimal(10,2);
ALTER TABLE distribution.installation_treatment ADD COLUMN remarks                       text         ;

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_treatment', 'geometry', 21781, 'POINT', 2);
CREATE INDEX installation_treatment_geoidx ON distribution.installation_treatment USING GIST ( geometry );

/* primary key */
ALTER TABLE distribution.installation_treatment ADD CONSTRAINT installation_treatment_pkey PRIMARY KEY (id);

/* Constraints */
ALTER TABLE distribution.installation_treatment 
	ADD CONSTRAINT installation_treatment_id_installation
	FOREIGN KEY (id_installation) 
	REFERENCES distribution.installation(id) 
	MATCH FULL;
CREATE INDEX fki_installation_treatment_id_installation ON distribution.installation_treatment(id_installation);



