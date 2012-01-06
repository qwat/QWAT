/*
	qWat - QGIS Water Module
	
	SQL file :: pressure "precision"
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution."precision" CASCADE;
CREATE TABLE distribution."precision" (id serial NOT NULL);

ALTER TABLE distribution."precision" ADD COLUMN  name       varchar(30);
ALTER TABLE distribution."precision" ADD COLUMN  lbl_x double precision;
ALTER TABLE distribution."precision" ADD COLUMN  lbl_y double precision;
ALTER TABLE distribution."precision" ADD COLUMN  lbl_a double precision;

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution."precision" ADD CONSTRAINT precision_pkey PRIMARY KEY (id);
ALTER TABLE distribution."precision" ADD CONSTRAINT precision_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution."precision" IS 'pressure "precision".';


INSERT INTO distribution."precision" (name) VALUES ('imprécis');    /*TB: IP => 1 */
INSERT INTO distribution."precision" (name) VALUES ('précis');      /*TB: P  => 2 */
INSERT INTO distribution."precision" (name) VALUES ('localisé');    /*TB: L  => 3 */
INSERT INTO distribution."precision" (name) VALUES ('digitalisé');  /*TB: D  => 4 */
INSERT INTO distribution."precision" (name) VALUES ('inconnu');     /*TB: I  => 5 */

COMMIT;
