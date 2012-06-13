/*
	qWat - QGIS Water Module
	
	SQL file :: pipe_function table
*/
BEGIN;
/* create */
DROP TABLE IF EXISTS distribution.pipe_function CASCADE;
CREATE TABLE distribution.pipe_function ( id SERIAL, CONSTRAINT "pipe_function_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.pipe_function IS 'Function for pipe. Here is determined if pipe should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_view.';

/* Columns*/
ALTER TABLE distribution.pipe_function ADD COLUMN "function" VARCHAR(30);
ALTER TABLE distribution.pipe_function ADD COLUMN "schema_view" BOOLEAN NOT NULL DEFAULT true;

/* Constraints*/
ALTER TABLE distribution.pipe_function ADD CONSTRAINT function_name UNIQUE ("function");

INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Conduite de transport'     ,true);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Conduite d''hydrant'       ,true);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Conduite de vidange'       ,false);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Inconnu'                   ,false);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Conduite de distribution'  ,true);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Branchement commun'        ,false);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('By-pass'                   ,false);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Branchement privé'         ,false);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Conduite de haute pression',true);
INSERT INTO distribution.pipe_function ("function","schema_view") VALUES ('Drain captant'             ,false);

COMMIT;

