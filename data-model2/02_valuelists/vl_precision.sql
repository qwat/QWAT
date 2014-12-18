/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_precision
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.vl_precision CASCADE;
CREATE TABLE qwat.vl_precision (id integer not null, CONSTRAINT "precision_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_precision IS 'pressure vl_precision.';

/* COLUMNS */
ALTER TABLE qwat.vl_precision ADD COLUMN vl_active      boolean default true;
ALTER TABLE qwat.vl_precision ADD COLUMN value_en       varchar(30) default '';
ALTER TABLE qwat.vl_precision ADD COLUMN value_fr       varchar(30) default '';
ALTER TABLE qwat.vl_precision ADD COLUMN description_en varchar(30) default '';
ALTER TABLE qwat.vl_precision ADD COLUMN description_fr varchar(30) default '';
ALTER TABLE qwat.vl_precision ADD COLUMN code_sire      smallint ;

/* VALUES */
INSERT INTO qwat.vl_precision (id,code_sire,value_en,value_fr) VALUES (1101,1, 'Unprecised',  'Imprécis');    /*TB: IP => 1 */
INSERT INTO qwat.vl_precision (id,code_sire,value_en,value_fr) VALUES (1102,0, 'Precised',    'Précis');      /*TB: P  => 2 */
INSERT INTO qwat.vl_precision (id,code_sire,value_en,value_fr) VALUES (1103,1, 'Localized',   'Localisé');    /*TB: L  => 3 */
INSERT INTO qwat.vl_precision (id,code_sire,value_en,value_fr) VALUES (1104,1, 'Digitalized', 'Digitalisé');  /*TB: D  => 4 */
INSERT INTO qwat.vl_precision (id,code_sire,value_en,value_fr) VALUES (1105,1, 'Unknown',     'Inconnu');     /*TB: I  => 5 */


