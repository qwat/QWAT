BEGIN;

/* Audit */
SELECT distribution.audit_table('distribution.distributor');
SELECT distribution.audit_table('distribution.district');
SELECT distribution.audit_table('distribution.hydrant');
SELECT distribution.audit_table('distribution.hydrant_provider');
SELECT distribution.audit_table('distribution.hydrant_type');
SELECT distribution.audit_table('distribution.installation');
SELECT distribution.audit_table('distribution.installation_type');
SELECT distribution.audit_table('distribution.installation_tank');
SELECT distribution.audit_table('distribution.installation_tank_overflowtype');
SELECT distribution.audit_table('distribution.installation_tank_firestoragetype');
SELECT distribution.audit_table('distribution.pipe');
SELECT distribution.audit_table('distribution.pipe_install_method');
SELECT distribution.audit_table('distribution.pipe_material');
SELECT distribution.audit_table('distribution.pipe_protection');
SELECT distribution.audit_table('distribution.precision');
SELECT distribution.audit_table('distribution.pressurezone');
SELECT distribution.audit_table('distribution.printmap');
SELECT distribution.audit_table('distribution.protectionzone');
SELECT distribution.audit_table('distribution.protectionzone_type');
SELECT distribution.audit_table('distribution.remote_type');
SELECT distribution.audit_table('distribution.samplingpoint');
/*SELECT distribution.audit_table('distribution.sprinklinghydrant');*/
SELECT distribution.audit_table('distribution.subscriber');
SELECT distribution.audit_table('distribution.subscriber_type');
SELECT distribution.audit_table('distribution.valve_function');
SELECT distribution.audit_table('distribution.valve_maintenance');
SELECT distribution.audit_table('distribution.valve_type');

COMMIT;
