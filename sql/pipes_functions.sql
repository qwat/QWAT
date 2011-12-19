/*
	qWat - QGIS Water Module
	
	SQL file :: pipes_function table
*/

DROP TABLE IF EXISTS "distribution"."pipes_function" CASCADE;
CREATE TABLE "distribution"."pipes_function" ( id SERIAL, CONSTRAINT "pipes_function_pk" PRIMARY KEY (id) );

/* Columns*/
ALTER TABLE "distribution"."pipes_function" ADD COLUMN "function" VARCHAR;
ALTER TABLE "distribution"."pipes_function" ADD COLUMN "schema_view" BOOLEAN DEFAULT true;

/* Constratins*/
ALTER TABLE "distribution"."pipes_function" ADD CONSTRAINT function_name UNIQUE ("function");

/* Comment */
COMMENT ON TABLE distribution.pipes_function IS 'Function for pipes. Here is determined if pipes should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_view.';

/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de transport');
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Conduite d''hydrant',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Conduite de vidange',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Inconnu',false);
INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de distribution');
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Branchement commun',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('By-pass',false);
INSERT INTO "distribution"."pipes_function" ("function","schema_view") VALUES ('Branchement privé',false);
INSERT INTO "distribution"."pipes_function" ("function") VALUES ('Conduite de haute pression');




