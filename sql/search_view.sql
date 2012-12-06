
BEGIN;

CREATE OR REPLACE VIEW distribution.search_view AS
	SELECT 
		'Ouvrage' as layer_name,
		_type || ' ' || name as search_text,
		geometry
		FROM distribution.installation_view WhERE _status_active IS TRUE
	UNION SELECT
		'Hydrantes' as layer_name,
		_district || ' '|| sige as search_text,
		geometry
		FROM distribution.hydrant_view WhERE _status_active IS TRUE
	UNION SELECT
		'Abonnés' as layer_name,
		_type || ' ' || id_client_full as search_text,
		geometry
		FROM distribution.subscriber_view
	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || sige as search_text,
		geometry
		FROM distribution.valve_view WHERE sige IS NOT NULL;
COMMIT;

