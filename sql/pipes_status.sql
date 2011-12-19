DROP TABLE "distribution"."pipes_status" CASCADE;
BEGIN;
CREATE TABLE "distribution"."pipes_status" ( id SERIAL, CONSTRAINT "pipes_status_pk" PRIMARY KEY (id) );

ALTER TABLE "distribution"."pipes_status" ADD COLUMN "strid" VARCHAR;
ALTER TABLE "distribution"."pipes_status" ADD COLUMN "status" VARCHAR;
ALTER TABLE "distribution"."pipes_status" ADD COLUMN "active" BOOLEAN DEFAULT true;

ALTER TABLE distribution.pipes_status ADD CONSTRAINT status_name UNIQUE ("status");


INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('E','en service',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('EA','en attente',false);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('F','fictif',false);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('A','abandonnee',false);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('D','desaffectee',false);


/*
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('I','inconnu',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('HS','hors service',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('C','variante de calcul',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('PDDE','prevu PDDE',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('PR','projet',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('P','provisoire',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('CR','condamne/rempli',true);
INSERT INTO distribution.pipes_status (strid,status,active) VALUES ('PA','projet approuve',true);
*/


COMMIT;
