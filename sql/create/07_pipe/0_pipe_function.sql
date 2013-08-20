/*
	qWat - QGIS Water Module
	
	SQL file :: pipe_function table
*/

/* create */
DROP TABLE IF EXISTS distribution.pipe_function CASCADE;
CREATE TABLE distribution.pipe_function ( id SERIAL, CONSTRAINT "pipe_function_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.pipe_function IS 'Function for pipe. Here is determined if pipe should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_view.';

/* Columns*/
ALTER TABLE distribution.pipe_function ADD COLUMN "function" varchar(30);
ALTER TABLE distribution.pipe_function ADD COLUMN "schema_view" boolean not null default true;
ALTER TABLE distribution.pipe_function ADD COLUMN "code_sire" smallint;

/* Constraints*/
ALTER TABLE distribution.pipe_function ADD CONSTRAINT function_name UNIQUE ("function");

INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Conduite de transport'     ,true , 2);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Conduite d''hydrant'       ,true , 0);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Conduite de vidange'       ,false, 4);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Inconnu'                   ,false, 4);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Conduite de distribution'  ,true , 2);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Branchement commun'        ,false, 3);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('By-pass'                   ,false, 2);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Branchement privé'         ,false, 3);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Conduite de haute pression',true , 2);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Drain captant'             ,false, 1);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Trop plein'                ,true , 4);
INSERT INTO distribution.pipe_function ("function","schema_view","code_sire") VALUES ('Ventilation'               ,false, 4);



