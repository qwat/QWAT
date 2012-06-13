/*
	qWat - QGIS Water Module
	
	SQL file :: pressure pipe_install_method
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.pipe_install_method CASCADE;
CREATE TABLE distribution.pipe_install_method (id serial NOT NULL);

ALTER TABLE distribution.pipe_install_method ADD COLUMN  name       varchar(30);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.pipe_install_method ADD CONSTRAINT pipe_install_method_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pipe_install_method ADD CONSTRAINT pipe_install_method_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.pipe_install_method IS 'Installation methods.';


INSERT INTO distribution.pipe_install_method (name) VALUES ('En fouille');   /*TB: F   => 1 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Chemisé');      /*TB: CH  => 2 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Air libre');    /*TB: AL  => 3 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Sous pont');    /*TB: SP  => 4 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Protégé');      /*TB: PRO => 5 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Bétoné');       /*TB: B   => 6 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Galerie');      /*TB: G   => 7 */
INSERT INTO distribution.pipe_install_method (name) VALUES ('Inconnu');      /*TB: I   => 8 */

COMMIT;
