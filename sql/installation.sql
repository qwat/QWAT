/*
	qWat - QGIS Water Module
	
	SQL file :: installation
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.installation CASCADE;
CREATE TABLE distribution.installation (id serial NOT NULL);
SELECT setval('distribution.installation_id_seq', 100, true);
COMMENT ON TABLE distribution.installation IS 'installation.';

/* columns */
ALTER TABLE distribution.installation ADD COLUMN  name               varchar(40) DEFAULT '' ;
ALTER TABLE distribution.installation ADD COLUMN  identification     integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_remote         integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_status          integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_distributor     integer                ;
ALTER TABLE distribution.installation ADD COLUMN  id_type            integer                ;
ALTER TABLE distribution.installation ADD COLUMN  remarks            text                   ;
ALTER TABLE distribution.installation ADD COLUMN  links              text                   ;
ALTER TABLE distribution.installation ADD COLUMN  year smallint CHECK (year > 1800 AND year < 2100);
ALTER TABLE distribution.installation ADD COLUMN  schema_force_view  boolean DEFAULT NULL::boolean;
ALTER TABLE distribution.installation ADD COLUMN  altitude_real      decimal(10,3)          ;
ALTER TABLE distribution.installation ADD COLUMN  open_water_surface boolean DEFAULT False  ;
ALTER TABLE distribution.installation ADD COLUMN  parcel             varchar(30)            ;
ALTER TABLE distribution.installation ADD COLUMN  eca                varchar(30)            ;
ALTER TABLE distribution.installation ADD COLUMN  _complete_name     varchar(50)            ;

/* geometry */
SELECT distribution.geom_tool_point('installation',true,true,true,false);

/* primary key */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_pkey PRIMARY KEY (id);

/* Constraints */
/* id_type */
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES distribution.distributor(id)       MATCH FULL; CREATE INDEX fki_installation_id_distributor    ON distribution.installation(id_distributor) ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_status       FOREIGN KEY (id_status)       REFERENCES distribution.status(id)            MATCH FULL; CREATE INDEX fki_installation_id_status         ON distribution.installation(id_status)      ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_remote       FOREIGN KEY (id_remote)       REFERENCES distribution.remote_type(id)       MATCH SIMPLE; CREATE INDEX fki_installation_id_remote_type  ON distribution.installation(id_remote)      ;
ALTER TABLE distribution.installation ADD CONSTRAINT installation_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.installation_type(id) MATCH FULL; CREATE INDEX fki_installation_id_type           ON distribution.installation(id_type)        ;




/* Triggers */

CREATE OR REPLACE FUNCTION distribution.installation_trigger_fcn() RETURNS trigger AS ' 
	BEGIN
		 UPDATE distribution.installation 
			SET _complete_name = installation_type.shortname||'' ''||NEW.name
			FROM distribution.installation_type 
			WHERE installation.id = NEW.id
			AND installation.id_type = installation_type.id;
		 RETURN NEW;
	END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER installation_trigger 
	AFTER INSERT OR UPDATE OF id_type ON distribution.installation 
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.installation_trigger_fcn();









COMMIT;
