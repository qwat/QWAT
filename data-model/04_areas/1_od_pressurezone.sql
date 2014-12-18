/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.od_pressurezone CASCADE;
CREATE TABLE qwat.od_pressurezone (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_pressurezone IS 'Pressure zones.';

/* COLUMNS */
ALTER TABLE qwat.od_pressurezone ADD COLUMN id_distributor  integer not null;
ALTER TABLE qwat.od_pressurezone ADD COLUMN name            varchar(50) default '';
ALTER TABLE qwat.od_pressurezone ADD COLUMN consumptionzone varchar(50) default '';
ALTER TABLE qwat.od_pressurezone ADD COLUMN colorcode       smallint;

/* GEOMETRY */
SELECT AddGeometryColumn('qwat', 'od_pressurezone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX pressurezone_geoidx ON qwat.od_pressurezone USING GIST ( geometry ); 

/* CONSTRAINT */
ALTER TABLE qwat.od_pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE qwat.od_pressurezone ADD CONSTRAINT pressurezone_id_distributor FOREIGN KEY (id_distributor) REFERENCES qwat.od_distributor(id) MATCH FULL; CREATE INDEX fki_pressurezone_id_distributor ON qwat.od_pressurezone(id_distributor) ;
            
      
/* TRIGGER FOR CONSUMPTION ZONE */
CREATE OR REPLACE FUNCTION qwat.ft_pressurezone_consumptionzone() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF NEW.consumptionzone = '' OR NEW.consumptionzone IS NULL THEN
			NEW.consumptionzone := NEW.name;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_pressurezone
	BEFORE INSERT OR UPDATE ON qwat.od_pressurezone 
	FOR EACH ROW
	EXECUTE PROCEDURE qwat.ft_pressurezone_consumptionzone();
