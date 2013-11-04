/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_pipe_installmethod
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.vl_pipe_installmethod CASCADE;
CREATE TABLE distribution.vl_pipe_installmethod (id serial NOT NULL);
COMMENT ON TABLE distribution.vl_pipe_installmethod IS 'Installation methods.';

/* COLUMNS */
ALTER TABLE distribution.vl_pipe_installmethod ADD COLUMN value_en varchar(30) default '';
ALTER TABLE distribution.vl_pipe_installmethod ADD COLUMN value_fr varchar(30) default '';

/* ADD CONSTRAINTS */
ALTER TABLE distribution.vl_pipe_installmethod ADD CONSTRAINT vl_pipe_installmethod_pkey PRIMARY KEY (id);
ALTER TABLE distribution.vl_pipe_installmethod ADD CONSTRAINT vl_pipe_installmethod_name UNIQUE (name);

/* VALUES */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('En fouille');   /*TB: F   => 1 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Chemisé');      /*TB: CH  => 2 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Air libre');    /*TB: AL  => 3 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Sous pont');    /*TB: SP  => 4 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Protégé');      /*TB: PRO => 5 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Bétoné');       /*TB: B   => 6 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Galerie');      /*TB: G   => 7 */
INSERT INTO distribution.vl_pipe_installmethod (value_fr) VALUES ('Inconnu');      /*TB: I   => 8 */


