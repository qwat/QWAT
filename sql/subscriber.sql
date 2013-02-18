/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber table
*/
BEGIN;

DROP TABLE IF EXISTS distribution.subscriber CASCADE;
CREATE TABLE distribution.subscriber (id serial NOT NULL);
COMMENT ON TABLE distribution.subscriber IS 'Table for subscriber. This should not be used for editing/viewing, as a more complete view (subscriber_view) exists.';

SELECT setval('distribution.subscriber_id_seq', 8000, true);

ALTER TABLE distribution.subscriber ADD COLUMN   id_type integer;                                   /* id_type       FK FULL */
ALTER TABLE distribution.subscriber ADD COLUMN   id_pipe integer;									/* id_pipe       FK SIMPLE*/ 
ALTER TABLE distribution.subscriber ADD COLUMN   id_client character varying (12);                  /* id_client */
ALTER TABLE distribution.subscriber ADD COLUMN   parcel character varying (12) ;                    /*  */

/* geometry */
SELECT distribution.geom_tool_point('subscriber',false,false,false,false);

/*----------------!!!---!!!----------------*/
/* Add constraints */
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_pkey PRIMARY KEY (id); 
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_type         FOREIGN KEY (id_type)         REFERENCES distribution.subscriber_type (id) MATCH FULL  ; CREATE INDEX fki_id_type         ON distribution.subscriber(id_type)        ;
ALTER TABLE distribution.subscriber ADD CONSTRAINT subscriber_id_pipe         FOREIGN KEY (id_pipe)         REFERENCES distribution.pipe (id)            MATCH SIMPLE; CREATE INDEX fki_id_pipe         ON distribution.subscriber(id_pipe)        ;

COMMIT;

