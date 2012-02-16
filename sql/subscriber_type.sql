/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber_type table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.subscriber_type CASCADE;
CREATE TABLE distribution.subscriber_type ( id SERIAL, CONSTRAINT "subscriber_type_pk" PRIMARY KEY (id) );

/* Columns*/
ALTER TABLE distribution.subscriber_type ADD COLUMN "name" VARCHAR(30);
ALTER TABLE distribution.subscriber_type ADD COLUMN "short_name" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.subscriber_type ADD CONSTRAINT name UNIQUE ("name");
ALTER TABLE distribution.subscriber_type ADD CONSTRAINT short_name UNIQUE ("short_name");

/* Comment */
COMMENT ON TABLE distribution.subscriber_type IS 'type for subscriber.';

/* Predefined types list */
/* This has to be filled by user to fullfil language preferences */
INSERT INTO distribution.subscriber_type ("name","short_name") VALUES ('Arrosage','arr');
INSERT INTO distribution.subscriber_type ("name","short_name") VALUES ('Fontaine','font');
INSERT INTO distribution.subscriber_type ("name","short_name") VALUES ('WC','wc');
INSERT INTO distribution.subscriber_type ("name","short_name") VALUES ('Sprinkler','spkr');
INSERT INTO distribution.subscriber_type ("name","short_name") VALUES ('Compteur réseau','rés');

COMMIT;

