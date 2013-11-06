/*
	qWat - QGIS Water Module
	
	SQL file :: pipe protection detail
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS distribution.vl_pipe_protection CASCADE;
CREATE TABLE distribution.vl_pipe_protection (id serial NOT NULL);
COMMENT ON TABLE distribution.vl_pipe_protection IS 'Pipe prtoection details.';
ALTER TABLE distribution.vl_pipe_protection ADD CONSTRAINT vl_pipe_protection_pkey PRIMARY KEY (id);

ALTER TABLE distribution.vl_pipe_protection ADD COLUMN value_en varchar(30) default '';
ALTER TABLE distribution.vl_pipe_protection ADD COLUMN value_fr varchar(30) default '';

/* VALUES */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. cond. ACG');      /* TB_id: 10 */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('SOMO PVC');                 /* TB_id: 2  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. conduite F');     /* TB_id: 3  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('SOMO autre');               /* TB_id: 4  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. conduite TAC');   /* TB_id: 6  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. conduite AC');    /* TB_id: 5  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. conduite PE');    /* TB_id: 7  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans anc. conduite autre'); /* TB_id: 8  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Dans tuyau ciment');        /* TB_id: 9  */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('SOMO PE');                  /* TB_id: 11 */
INSERT INTO distribution.vl_pipe_protection (value_fr) VALUES ('Flexible');                 /* TB_id: 12 */


