/*
	qWat - QGIS Water Module
	
	SQL file :: valves table
*/
BEGIN;
DROP TABLE IF EXISTS distribution.valves CASCADE;
CREATE TABLE distribution.valves (id serial NOT NULL);
SELECT setval('distribution.valves_id_seq', 30000, true);

ALTER TABLE distribution.valves ADD COLUMN   _is_on_map varchar(80) DEFAULT '';                      /* _is_on_map           */
ALTER TABLE distribution.valves ADD COLUMN   _is_on_district varchar(100) DEFAULT '';                /* _is_on_district      */

ALTER TABLE distribution.valves ADD COLUMN   wkb_geometry geometry;                                  /* wkb_geometry         */




/*----------------!!!---!!!----------------*/
/* Add constraints */
/* primary key */
ALTER TABLE distribution.valves ADD CONSTRAINT valves_pkey PRIMARY KEY (id);
/* Geometry */
ALTER TABLE distribution.valves ADD CONSTRAINT enforce_dims_wkb_geometry CHECK (st_ndims(wkb_geometry) = 2);
ALTER TABLE distribution.valves ADD CONSTRAINT enforce_geotype_wkb_geometry CHECK (geometrytype(wkb_geometry) = 'POINT'::text OR wkb_geometry IS NULL);
ALTER TABLE distribution.valves ADD CONSTRAINT enforce_srid_wkb_geometry CHECK (st_srid(wkb_geometry) = 21781);
/* GIST index*/
CREATE INDEX valves_geoidx ON distribution.valves USING GIST ( wkb_geometry );

/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON TABLE distribution.valves IS 'Table for valves.';

/*----------------!!!---!!!----------------*/
/* Trigger for map and district update */
CREATE OR REPLACE FUNCTION distribution.valves_geom() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.valves SET 
			_is_on_map         = distribution.get_map(NEW.wkb_geometry),
			_is_on_district    = distribution.get_district(NEW.wkb_geometry)
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.valves_geom() IS 'Fcn/Trigger: updates auto fields of the valve after insert/update.';

CREATE TRIGGER valves_geom_trigger 
	AFTER INSERT OR UPDATE OF wkb_geometry ON distribution.valves
	FOR EACH ROW
	EXECUTE PROCEDURE distribution.valves_geom();
COMMENT ON TRIGGER valves_geom_trigger ON distribution.valves IS 'Trigger: updates auto fields of the valve after insert/update.';


COMMIT;

