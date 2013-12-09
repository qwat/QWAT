/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/

/* CREATE */
DROP TABLE IF EXISTS distribution.vl_status CASCADE;
CREATE TABLE distribution.vl_status ( id integer not null, CONSTRAINT status_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.vl_status IS 'Status table, with SIRE id.';

/* COLUMNS */
ALTER TABLE distribution.vl_status ADD COLUMN vl_active boolean default true;
ALTER TABLE distribution.vl_status ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE distribution.vl_status ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE distribution.vl_status ADD COLUMN active    boolean default true;
ALTER TABLE distribution.vl_status ADD COLUMN sire      smallint default null;
ALTER TABLE distribution.vl_status ADD COLUMN helper_en text default '';
ALTER TABLE distribution.vl_status ADD COLUMN helper_fr text default '';

/* VALUES */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1301,'', 'en service'  , true , 1    , '', 'Contribue actuellement au réseau.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1302,'', 'hors service', false, NULL , '', 'Ne contribue actuellement pas au réseau, mais peut être remis en service sans opération spéciale. La mise hors service est considérée comme temporaire. Par exemple, une source mise hors service pour des problèmes de qualité.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1303,'', 'désaffecté'  , false, NULL , '', 'La mise hors service est quasi-définitive et une remise en service nécessiterai des opérations spéciales. Par exemple, une source non-captée est considérée comme désaffectée. Ou encore, une conduite n''étant plus raccordée maism étant toutefois dans état propre à son utilisation.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1304,'', 'abandonné'   , false, NULL , '', 'L''objet est inutilisable et sa mise hors service est strictement définitive. Par exemple, une conduite non raccordée et impropre au transport d''eau, mais pouvant éventuellement servir à passer des câbles. Ou encore une station de pompage sans pompe en état de fonctionner.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1305,'', 'détruit'     , false, NULL , '', 'L''objet a été partiellement ou complètement détruit.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1306,'', 'projet'      , false, 0    , '', 'L''objet est un projet validé en attente ou en cours de réalisation.');   /*  */
INSERT INTO distribution.vl_status (id,value_en,value_fr,active,sire,helper_en,helper_fr) VALUES (1307,'', 'fictif'      , true , 1    , '', 'L''objet n''existe pas mais est nécessaire à l''intégrité topologique.');   /*  */


