/*
	qWat - QGIS Water Module
	
	SQL file :: vl_subscriber_type table
*/


/* CREATE */
DROP TABLE IF EXISTS distribution.vl_subscriber_type CASCADE;
CREATE TABLE distribution.vl_subscriber_type ( id SERIAL, CONSTRAINT "vl_subscriber_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_subscriber_type IS 'type for subscriber.';

/* COLUMNS*/
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN value_fr VARCHAR(30);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN value_en VARCHAR(30);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN short_fr VARCHAR(30);
ALTER TABLE distribution.vl_subscriber_type ADD COLUMN short_en VARCHAR(30);

/* VALUES */
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('Abonnement','abo');
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('Arrosage','arr');
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('Fontaine','font');
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('WC','wc');
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('Sprinkler','spkr');
INSERT INTO distribution.vl_subscriber_type (value_fr,short_fr) VALUES ('Compteur réseau','rés');



