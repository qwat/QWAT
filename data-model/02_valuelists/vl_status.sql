/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_status CASCADE;
CREATE TABLE qwat.vl_status ( id integer not null, CONSTRAINT status_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_status IS 'Status table, with SIRE id.';

/* COLUMNS */
ALTER TABLE qwat.vl_status ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_status ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE qwat.vl_status ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE qwat.vl_status ADD COLUMN value_ro  varchar(30) default '';
ALTER TABLE qwat.vl_status ADD COLUMN active    boolean default true;
ALTER TABLE qwat.vl_status ADD COLUMN sire      smallint default null;
ALTER TABLE qwat.vl_status ADD COLUMN helper_en text default '';
ALTER TABLE qwat.vl_status ADD COLUMN helper_fr text default '';
ALTER TABLE qwat.vl_status ADD COLUMN helper_ro text default '';

/* VALUES */

INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1307, '', 'fictif', 'Fictiv', true, 1, '', 'L''objet n''existe pas mais est nécessaire à l''intégrité topologique.', 'Obiectul este fictiv dar este necesar pentru integritatea topologică.');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1303, '', 'désaffecté', 'Dezafectat', false, NULL, '', 'La mise hors service est quasi-définitive et une remise en service nécessiterai des opérations spéciales. Par exemple, une source non-captée est considérée comme désaffectée. Ou encore, une conduite n''étant plus raccordée maism étant toutefois dans état propre à son utilisation.', 'Punerea în stare dezafectată este semi definitivă iar repunerea în stare funcţională ar necesita operaţiuni speciale. Spre exemplu, o sursa necaptată este considerată ca dezafectată. Sau mai mult, o conductă care nu este racordată dar a carei stare e utilizabilă.');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1305, '', 'détruit', 'Distrus', false, NULL, '', 'L''objet a été partiellement ou complètement détruit.', 'Obiectul este distrus complet sau partial');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1302, '', 'hors service', 'Nefunctional', false, NULL, '', 'Ne contribue actuellement pas au réseau, mais peut être remis en service sans opération spéciale. La mise hors service est considérée comme temporaire. Par exemple, une source mise hors service pour des problèmes de qualité.', 'Nu contribuie efectiv la reţea, dar poate fi repusă în stare funcţională fară operaţiuni speciale. Starea nefuncţională este considerată ca una temporară. De exemplu, putem avea o sursă care a fost pusă în stare nefuncţională datorită unor probleme de calitate.');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1301, '', 'en service', 'Functional', true, 1, '', 'Contribue actuellement au réseau.', 'Contribuie efectiv la reţea.');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1304, '', 'abandonné', 'Abandonat', false, NULL, '', 'L''objet est inutilisable et sa mise hors service est strictement définitive. Par exemple, une conduite non raccordée et impropre au transport d''eau, mais pouvant éventuellement servir à passer des câbles. Ou encore une station de pompage sans pompe en état de fonctionner.', 'Obiectul este abandonat iar scoaterea din funcţiune este strict definitivă. Spre exemplu, putem avea o conductă neracordată și improprie transportului de apă dar care poate fi eventual folosită ca mediu protector pentru alte cabluri. Alt exemplu este o statie de pompare fară nici o pompă  în stare funcţională.');    /*  */
INSERT INTO qwat.vl_status (id, value_en, value_fr, value_ro, active, sire, helper_en, helper_fr, helper_ro) VALUES (1306, '', 'projet', 'Proiect', false, 0, '', 'L''objet est un projet validé en attente ou en cours de réalisation.', 'Obiectul face parte dintr-un proiect care se va face sau în curs de realizare. ');    /*  */
