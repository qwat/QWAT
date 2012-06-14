/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.status CASCADE;
CREATE TABLE distribution.status ( id SERIAL, CONSTRAINT status_pk PRIMARY KEY (id) );
COMMENT ON TABLE distribution.status IS 'Status table, with SIRE id.';

/* Columns */
ALTER TABLE distribution.status ADD COLUMN status    VARCHAR(30);
ALTER TABLE distribution.status ADD COLUMN active    BOOLEAN DEFAULT true;
ALTER TABLE distribution.status ADD COLUMN sire      SMALLINT DEFAULT NULL;
ALTER TABLE distribution.status ADD COLUMN comment   text;

/* Constraints */
ALTER TABLE distribution.status ADD CONSTRAINT status_name UNIQUE (status);


/* Predefined functions list */
/* This has to be filled by user to fullfile language preferences */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('en service'  , true , 1    , 'Contribue actuellement au réseau.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('hors service', false, NULL, 'Ne contribue actuellement pas au réseau, mais peut être remis en service sans opération spéciale. La mise hors service est considérée comme temporaire. Par exemple, une source mise hors service pour des problèmes de qualité.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('désaffecté'  , false, NULL, 'La mise hors service est quasi-définitive et une remise en service nécessiterai des opérations spéciales. Par exemple, une source non-captée est considérée comme désaffectée. Ou encore, une conduite n''étant plus raccordée maism étant toutefois dans état propre à son utilisation.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('abandonné'   , false, NULL, 'L''objet est inutilisable et sa mise hors service est strictement définitive. Par exemple, une conduite non raccordée et impropre au transport d''eau, mais pouvant éventuellement servir à passer des câbles. Ou encore une station de pompage sans pompe en état de fonctionner.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('détruit'     , false, NULL, 'L''objet a été partiellement ou complètement détruit.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('projet'      , false, 0    , 'L''objet est un projet validé en attente ou en cours de réalisation.');   /*  */
INSERT INTO distribution.status (status,active,sire,comment) VALUES ('fictif'      , false, 1    , 'L''objet n''existe pas mais est nécessaire à l''intégrité topologique.');   /*  */

COMMIT;
