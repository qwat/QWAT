/*
	qWat - QGIS Water Module
	
	SQL file :: pipes protection detail
*/
BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.pipes_protection CASCADE;
CREATE TABLE distribution.pipes_protection (id serial NOT NULL);

ALTER TABLE distribution.pipes_protection ADD COLUMN  name varchar(30);

/* ADD CONSTRAINTS */
/* primary key */
ALTER TABLE distribution.pipes_protection ADD CONSTRAINT pipes_protection_pkey PRIMARY KEY (id);
ALTER TABLE distribution.pipes_protection ADD CONSTRAINT pipes_protection_name UNIQUE (name);

/* Comment */
COMMENT ON TABLE distribution.pipes_protection IS 'Pipes prtoection details.';

INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. cond. ACG');      /* TB_id: 10 */
INSERT INTO distribution.pipes_protection (name) VALUES ('SOMO PVC');                 /* TB_id: 2  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. conduite F');     /* TB_id: 3  */
INSERT INTO distribution.pipes_protection (name) VALUES ('SOMO autre');               /* TB_id: 4  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. conduite TAC');   /* TB_id: 6  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. conduite AC');    /* TB_id: 5  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. conduite PE');    /* TB_id: 7  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans anc. conduite autre'); /* TB_id: 8  */
INSERT INTO distribution.pipes_protection (name) VALUES ('Dans tuyau ciment');        /* TB_id: 9  */
INSERT INTO distribution.pipes_protection (name) VALUES ('SOMO PE');                  /* TB_id: 11 */
INSERT INTO distribution.pipes_protection (name) VALUES ('Flexible');                 /* TB_id: 12 */

COMMIT;
