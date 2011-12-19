DROP TABLE "distribution"."pipes_function" CASCADE;
BEGIN;
CREATE TABLE "distribution"."pipes_function" ( id SERIAL, CONSTRAINT "pipes_function_pk" PRIMARY KEY (id) );

ALTER TABLE "distribution"."pipes_function" ADD COLUMN "function" VARCHAR;
ALTER TABLE "distribution"."pipes_function" ADD COLUMN "schema_view" BOOLEAN DEFAULT true;

ALTER TABLE distribution.pipes_function ADD CONSTRAINT function_name UNIQUE ("function");


INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de transport');
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Conduite d''hydrant',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Conduite de vidange',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Inconnu',false);
INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de distribution');
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Branchement commun',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('By-pass',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Branchement privé',false);
INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de haute pression');
COMMIT;

