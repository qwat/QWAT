/*
	qWat - QGIS Water Module
	
	SQL file :: database roles
*/
BEGIN;
/* 
remove roles
*/
REVOKE ALL ON SCHEMA distribution,public FROM viewer;
REVOKE ALL ON DATABASE sige FROM viewer CASCADE;
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution,public
    REVOKE ALL ON TABLES
    FROM "poweruser","simpleuser","viewer";
DROP ROLE IF EXISTS "admin","poweruser","simpleuser","viewer";
/* 
Viewer role - can SELECT all the tables
*/
CREATE ROLE "viewer" LOGIN;
GRANT USAGE ON SCHEMA distribution,public TO GROUP viewer;
GRANT CONNECT, TEMPORARY ON DATABASE sige TO "viewer";
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution,public
    GRANT SELECT ON TABLES
    TO "viewer";
       
/* 
Simple user role - can update geometric objects except their geometries
*/   
CREATE ROLE "simpleuser" IN ROLE "viewer";
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution
    GRANT INSERT, UPDATE, DELETE ON TABLES
    TO "simpleuser"; 
REVOKE INSERT,DELETE ON distribution.pipes FROM simpleuser;
REVOKE UPDATE (wkb_geometry) ON distribution.pipes FROM simpleuser;

/* 
Power user role - can add/update/delete any object
*/ 
CREATE ROLE "poweruser"  IN ROLE "viewer";
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES
    TO "poweruser";    

/* 
Admin role
*/ 
CREATE ROLE "admin" SUPERUSER;

COMMIT;





      

    

    



