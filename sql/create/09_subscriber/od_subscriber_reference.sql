/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/


DROP TABLE IF EXISTS qwat.od_subscriber_reference CASCADE;
CREATE TABLE qwat.od_subscriber_reference (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_subscriber_reference IS 'Table for subscriber references. These are used to place references to subscribers if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE qwat.od_subscriber_reference ADD COLUMN id_subscriber integer ;

/* GEOMETRY */
SELECT addGeometryColumn('qwat', 'od_subscriber_reference', 'geometry', 21781, 'POINT', 2);
CREATE INDEX od_subscriber_reference_geoidx_sch ON qwat.od_subscriber_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE qwat.od_subscriber_reference ADD CONSTRAINT subscriber_reference_id_subscriber FOREIGN KEY (id_subscriber) REFERENCES qwat.od_subscriber (id) MATCH FULL; CREATE INDEX fki_subscriber_reference_id_subscriber ON qwat.od_subscriber_reference(id_subscriber);

