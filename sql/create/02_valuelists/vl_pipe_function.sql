/*
	qWat - QGIS Water Module
	
	SQL file :: pipe_function table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_pipe_function CASCADE;
CREATE TABLE distribution.vl_pipe_function ( id SERIAL, CONSTRAINT "pipe_function_pk" PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_pipe_function IS 'Function for pipe. Here is determined if pipe should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_view.';

/* COLUMNS*/
ALTER TABLE distribution.vl_pipe_function ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE distribution.vl_pipe_function ADD COLUMN value_en varchar(30) default '';
ALTER TABLE distribution.vl_pipe_function ADD COLUMN schema_view boolean not null default true;
ALTER TABLE distribution.vl_pipe_function ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 1, 'Conduite de transport'     ,true , 2);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 2, 'Conduite d''hydrant'       ,true , 0);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 3, 'Conduite de vidange'       ,false, 4);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 4, 'Inconnu'                   ,false, 4);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 5, 'Conduite de distribution'  ,true , 2);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 6, 'Branchement commun'        ,false, 3);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 7, 'By-pass'                   ,false, 2);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 8, 'Branchement privé'         ,false, 3);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES ( 9, 'Conduite de haute pression',true , 2);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES (10, 'Drain captant'             ,false, 1);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES (11, 'Trop plein'                ,true , 4);
INSERT INTO distribution.vl_pipe_function (id,value_fr,schema_view,code_sire) VALUES (12, 'Ventilation'               ,false, 4);



