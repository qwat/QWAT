/*
	qWat - QGIS Water Module
	
	SQL file :: pipe_function table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_pipe_function CASCADE;
CREATE TABLE qwat.vl_pipe_function ( id integer not null, CONSTRAINT "pipe_function_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_pipe_function IS 'Function for pipe. Here is determined if pipe should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_view.';

/* COLUMNS*/
ALTER TABLE qwat.vl_pipe_function ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_pipe_function ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat.vl_pipe_function ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat.vl_pipe_function ADD COLUMN schema_visible boolean not null default true;
ALTER TABLE qwat.vl_pipe_function ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4101, 'Conduite de transport'     ,true , 2);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4102, 'Conduite d''hydrant'       ,true , 0);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4103, 'Conduite de vidange'       ,false, 4);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4104, 'Inconnu'                   ,false, 4);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4105, 'Conduite de distribution'  ,true , 2);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4106, 'Branchement commun'        ,false, 3);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4107, 'By-pass'                   ,false, 2);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4108, 'Branchement privé'         ,false, 3);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4109, 'Conduite de haute pression',true , 2);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4110, 'Drain captant'             ,false, 1);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4111, 'Trop plein'                ,true , 4);
INSERT INTO qwat.vl_pipe_function (id,value_fr,schema_visible,code_sire) VALUES (4112, 'Ventilation'               ,false, 4);



