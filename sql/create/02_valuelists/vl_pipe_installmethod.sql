/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_pipe_installmethod
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.vl_pipe_installmethod CASCADE;
CREATE TABLE qwat.vl_pipe_installmethod (id integer not null, CONSTRAINT "vl_pipe_installmethod_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_pipe_installmethod IS 'Installation methods.';

/* COLUMNS */
ALTER TABLE qwat.vl_pipe_installmethod ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_pipe_installmethod ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat.vl_pipe_installmethod ADD COLUMN value_fr varchar(30) default '';

/* VALUES */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4201,'En fouille');   /*TB: F   => 1 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4202,'Chemisé');      /*TB: CH  => 2 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4203,'Air libre');    /*TB: AL  => 3 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4204,'Sous pont');    /*TB: SP  => 4 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4205,'Protégé');      /*TB: PRO => 5 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4206,'Bétoné');       /*TB: B   => 6 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4207,'Galerie');      /*TB: G   => 7 */
INSERT INTO qwat.vl_pipe_installmethod (id,value_fr) VALUES (4208,'Inconnu');      /*TB: I   => 8 */


