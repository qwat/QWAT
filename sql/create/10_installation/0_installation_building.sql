/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation_building CASCADE;
CREATE TABLE distribution.installation_building (id serial NOT NULL);
COMMENT ON TABLE distribution.installation_building IS 'This table is used to define the buildings of installation.';
ALTER TABLE distribution.installation_building ADD CONSTRAINT print_pkey PRIMARY KEY (id);

/* columns */
ALTER TABLE distribution.installation_building ADD COLUMN name            varchar(50);
ALTER TABLE distribution.installation_building ADD COLUMN id_type         smallint;
ALTER TABLE distribution.installation_building ADD COLUMN _displayname_en varchar(50);
ALTER TABLE distribution.installation_building ADD COLUMN _displayname_fr varchar(50);

/* geometry */
SELECT AddGeometryColumn('distribution', 'installation_building', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX installation_building_geoidx ON distribution.installation_building USING GIST ( geometry ); 

/* Constraints */
ALTER TABLE distribution.installation_building ADD CONSTRAINT installation_id_type FOREIGN KEY (id_type) REFERENCES distribution.vl_installation_type(id) MATCH FULL; CREATE INDEX fki_installation_id_type ON distribution.installation_building(id_type)        ;


/* TRIGGERS */
CREATE OR REPLACE FUNCTION distribution.installation_building_trigger_fcn() RETURNS trigger AS ' 
        BEGIN
                 UPDATE distribution.installation_building
                        SET 
							_displayname_en = vl_installation_type.short_en||'' ''||NEW.name,
							_displayname_fr = vl_installation_type.short_fr||'' ''||NEW.name
                        FROM distribution.vl_installation_type 
                        WHERE installation.id = NEW.id
                        AND installation.id_type = vl_installation_type.id;
                 RETURN NEW;
        END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER installation_building_trigger 
        AFTER INSERT OR UPDATE OF id_type ON distribution.installation_building 
        FOR EACH ROW
        EXECUTE PROCEDURE distribution.installation_building_trigger_fcn();
