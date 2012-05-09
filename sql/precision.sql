/*
	qWat - QGIS Water Module
	
	SQL file :: pressure "precision"
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution."precision" CASCADE;
CREATE TABLE distribution."precision" (id serial NOT NULL);

ALTER TABLE distribution."precision" ADD COLUMN  name       varchar(30);


/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution."precision" ADD CONSTRAINT precision_pkey PRIMARY KEY (id);
ALTER TABLE distribution."precision" ADD CONSTRAINT precision_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution."precision" IS 'pressure "precision".';


INSERT INTO distribution."precision" (name) VALUES ('Imprécis');    /*TB: IP => 1 */
INSERT INTO distribution."precision" (name) VALUES ('Précis');      /*TB: P  => 2 */
INSERT INTO distribution."precision" (name) VALUES ('Localisé');    /*TB: L  => 3 */
INSERT INTO distribution."precision" (name) VALUES ('Digitalisé');  /*TB: D  => 4 */
INSERT INTO distribution."precision" (name) VALUES ('Inconnu');     /*TB: I  => 5 */

COMMIT;
