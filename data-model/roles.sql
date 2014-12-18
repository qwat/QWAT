
CREATE ROLE viewer
   VALID UNTIL 'infinity';

ALTER DEFAULT PRIVILEGES IN SCHEMA qwat
   GRANT SELECT ON TABLES TO viewer;
   
   

-- Table: test.temp

-- DROP TABLE test.temp;

CREATE TABLE test.temp
(
  id integer,
  h numeric(10,3)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE test.temp
  OWNER TO sige;
