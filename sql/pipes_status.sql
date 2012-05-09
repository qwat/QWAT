/*
	qWat - QGIS Water Module
	
	SQL file :: pipes_status table
*/
BEGIN;

DROP TABLE IF EXISTS "distribution"."pipes_status" CASCADE;
CREATE TABLE "distribution"."pipes_status" ( id SERIAL, CONSTRAINT "pipes_status_pk" PRIMARY KEY (id) );

/* Columns */
ALTER TABLE "distribution"."pipes_status" ADD COLUMN "status" VARCHAR(30);
ALTER TABLE "distribution"."pipes_status" ADD COLUMN "active" BOOLEAN DEFAULT true;

/* Constraints */
ALTER TABLE distribution.pipes_status ADD CONSTRAINT status_name UNIQUE ("status");

/* Comment */
COMMENT ON TABLE distribution.pipes_status IS 'Status for pipes. Here is determined if the pipe is active or not. By nature, only one satus is active.';


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.pipes_status (status,active) VALUES ('en service',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('en attente',false);
INSERT INTO distribution.pipes_status (status,active) VALUES ('fictif',false);
INSERT INTO distribution.pipes_status (status,active) VALUES ('abandonnee',false);
INSERT INTO distribution.pipes_status (status,active) VALUES ('desaffectee',false);
/*
Unused status from TB 2.
INSERT INTO distribution.pipes_status (status,active) VALUES ('I','inconnu',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('HS','hors service',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('C','variante de calcul',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('PDDE','prevu PDDE',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('PR','projet',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('P','provisoire',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('CR','condamne/rempli',true);
INSERT INTO distribution.pipes_status (status,active) VALUES ('PA','projet approuve',true);
*/

COMMIT;
