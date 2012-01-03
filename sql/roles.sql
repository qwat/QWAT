/*
	qWat - QGIS Water Module
	
	SQL file :: database roles
*/
BEGIN;
/* 
Viewer role - can SELECT all the tables
*/
CREATE ROLE "viewer";
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





      

    

    



