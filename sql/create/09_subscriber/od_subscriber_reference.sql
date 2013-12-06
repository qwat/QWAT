/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/


DROP TABLE IF EXISTS distribution.od_subscriber_reference CASCADE;
CREATE TABLE distribution.od_subscriber_reference (id serial PRIMARY KEY);
COMMENT ON TABLE distribution.od_subscriber_reference IS 'Table for subscriber references. These are used to place references to subscribers if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE distribution.od_subscriber_reference ADD COLUMN id_subscriber integer ;
ALTER TABLE distribution.od_subscriber_reference ADD COLUMN reference varchar(30) ; /* TOBE DELETED */

/* GEOMETRY */
SELECT addGeometryColumn('distribution', 'od_subscriber_reference', 'geometry', 21781, 'POINT', 2);
CREATE INDEX od_subscriber_reference_geoidx_sch ON distribution.od_subscriber_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE distribution.od_subscriber_reference ADD CONSTRAINT subscriber_reference_id_subscriber FOREIGN KEY (id_subscriber) REFERENCES distribution.od_subscriber (id) MATCH FULL; CREATE INDEX fki_subscriber_reference_id_subscriber ON distribution.od_subscriber_reference(id_subscriber);

