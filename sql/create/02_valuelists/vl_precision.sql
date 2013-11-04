/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_precision
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.vl_precision CASCADE;
CREATE TABLE distribution.vl_precision (id serial NOT NULL);
COMMENT ON TABLE distribution.vl_precision IS 'pressure vl_precision.';

/* COLUMNS */
ALTER TABLE distribution.vl_precision ADD COLUMN vl_code   char(3);
ALTER TABLE distribution.vl_precision ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE distribution.vl_precision ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE distribution.vl_precision ADD COLUMN code_sire smallint ;

/* ADD CONSTRAINTS */
ALTER TABLE distribution.vl_precision ADD CONSTRAINT precision_pkey PRIMARY KEY (id);
ALTER TABLE distribution.vl_precision ADD CONSTRAINT precision_vl_code UNIQUE (vl_code);

/* VALUES */
INSERT INTO distribution.vl_precision (code_sire,value_en,value_fr) VALUES (1, 'Unprecised',  'Imprécis');    /*TB: IP => 1 */
INSERT INTO distribution.vl_precision (code_sire,value_en,value_fr) VALUES (0, 'Precised',    'Précis');      /*TB: P  => 2 */
INSERT INTO distribution.vl_precision (code_sire,value_en,value_fr) VALUES (1, 'Localized',   'Localisé');    /*TB: L  => 3 */
INSERT INTO distribution.vl_precision (code_sire,value_en,value_fr) VALUES (1, 'Digitalized', 'Digitalisé');  /*TB: D  => 4 */
INSERT INTO distribution.vl_precision (code_sire,value_en,value_fr) VALUES (1, 'Unknown',     'Inconnu');     /*TB: I  => 5 */


