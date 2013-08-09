/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber_type table
*/


/* create */
DROP TABLE IF EXISTS distribution.subscriber_type CASCADE;
CREATE TABLE distribution.subscriber_type ( id SERIAL, CONSTRAINT "subscriber_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.subscriber_type IS 'type for subscriber.';

/* Columns*/
ALTER TABLE distribution.subscriber_type ADD COLUMN "name" VARCHAR(30);
ALTER TABLE distribution.subscriber_type ADD COLUMN "shortname" VARCHAR(30);

/* Constraints*/
ALTER TABLE distribution.subscriber_type ADD CONSTRAINT name UNIQUE ("name");
ALTER TABLE distribution.subscriber_type ADD CONSTRAINT shortname UNIQUE ("shortname");


/* Predefined types list */
/* This has to be filled by user to fullfil language preferences */
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('Abonnement','abo');
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('Arrosage','arr');
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('Fontaine','font');
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('WC','wc');
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('Sprinkler','spkr');
INSERT INTO distribution.subscriber_type ("name","shortname") VALUES ('Compteur réseau','rés');



