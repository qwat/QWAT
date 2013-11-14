/*
	qWat - QGIS Water Module
	
	SQL file :: vl_subscriber_type table
*/


/* CREATE */
DROP TABLE IF EXISTS distribution.vl_subscriber_type CASCADE;
CREATE TABLE distribution.vl_subscriber_type ( id integer not null, CONSTRAINT "vl_subscriber_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_subscriber_type IS 'type for subscriber.';

/* COLUMNS*/
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN value_fr VARCHAR(30);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN value_en VARCHAR(30);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN short_fr VARCHAR(6);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN short_en VARCHAR(6);

/* VALUES */
INSERT INTO distribution.vl_subscriber_type (id, value_fr,short_fr) VALUES (9401, 'Abonnement','abo');
INSERT INTO distribution.vl_subscriber_type (id, value_fr,short_fr) VALUES (9402, 'Arrosage'  ,'arr');
INSERT INTO distribution.vl_subscriber_type (id, value_fr,short_fr) VALUES (9403, 'Fontaine'  ,'font');
INSERT INTO distribution.vl_subscriber_type (id, value_fr,short_fr) VALUES (9404, 'WC'        ,'wc');
INSERT INTO distribution.vl_subscriber_type (id, value_fr,short_fr) VALUES (9405, 'Sprinkler' ,'spkr');
