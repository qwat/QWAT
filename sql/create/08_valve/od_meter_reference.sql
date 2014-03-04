/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/


DROP TABLE IF EXISTS distribution.od_meter_reference CASCADE;
CREATE TABLE distribution.od_meter_reference (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_meter_reference IS 'Table for meter references. These are used to place references to meters if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE distribution.od_meter_reference ADD COLUMN id_meter integer ;

/* GEOMETRY */
SELECT addGeometryColumn('distribution', 'od_meter_reference', 'geometry', 21781, 'POINT', 2);
CREATE INDEX od_meter_reference_geoidx_sch ON distribution.od_meter_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE distribution.od_meter_reference ADD CONSTRAINT meter_reference_id_meter FOREIGN KEY (id_meter) REFERENCES distribution.od_meter (id) MATCH FULL; CREATE INDEX fki_meter_reference_id_meter ON distribution.od_meter_reference(id_meter);

