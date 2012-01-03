/*
	qWat - QGIS Water Module
	
	SQL file :: database roles
*/
CREATE ROLE "viewer";
CREATE ROLE "user" IN ROLE "viewer";
CREATE ROLE "poweruser"  IN ROLE "user";
CREATE ROLE "admin" SUPERUSER;


ALTER DEFAULT PRIVILEGES IN SCHEMA distribution,public
    GRANT SELECT ON TABLES
    TO "viewer";
      
ALTER DEFAULT PRIVILEGES IN SCHEMA distribution
    GRANT INSERT, UPDATE, DELETE ON TABLES
    TO "poweruser";    
    
    
GRANT U
    



