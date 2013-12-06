

BEGIN;


CREATE OR REPLACE FUNCTION distribution.getsubref(reference varchar, geom geometry) RETURNS integer AS
$BODY$
	DECLARE 
		idsub integer;
	BEGIN
		SELECT id INTO idsub FROM distribution.od_subscriber WHERE identification = reference ORDER BY ST_Distance(geom,geometry) ASC LIMIT 1;
		RETURN idsub;
	END
$BODY$
LANGUAGE plpgsql;

UPDATE distribution.od_subscriber_reference SET id_subscriber = distribution.getsubref(reference,geometry);

COMMIT;
