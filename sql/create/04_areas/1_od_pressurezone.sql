/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.od_pressurezone CASCADE;
CREATE TABLE distribution.od_pressurezone (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_pressurezone IS 'Pressure zones.';

/* COLUMNS */
ALTER TABLE distribution.od_pressurezone ADD COLUMN id_distributor  integer not null;
ALTER TABLE distribution.od_pressurezone ADD COLUMN name            varchar(50);
ALTER TABLE distribution.od_pressurezone ADD COLUMN consumptionzone varchar(50);
ALTER TABLE distribution.od_pressurezone ADD COLUMN colorcode       smallint;

/* GEOMETRY */
SELECT AddGeometryColumn('distribution', 'od_pressurezone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX pressurezone_geoidx ON distribution.od_pressurezone USING GIST ( geometry ); 

/* CONSTRAINT */
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE distribution.od_pressurezone ADD CONSTRAINT pressurezone_id_distributor FOREIGN KEY (id_distributor) REFERENCES distribution.od_distributor(id) MATCH FULL; CREATE INDEX fki_pressurezone_id_distributor ON distribution.od_pressurezone(id_distributor) ;
            
      
/* TRIGGER FOR CONSUMPTION ZONE */
CREATE OR REPLACE FUNCTION distribution.fn_pressurezone_consumptionzone() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF NEW.consumptionzone = '' OR NEW.consumptionzone IS NULL THEN
			NEW.consumptionzone := NEW.name;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER pressurezone_trigger 
	BEFORE INSERT OR UPDATE ON distribution.od_pressurezone 
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.fn_pressurezone_consumptionzone();
