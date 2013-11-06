

/*
CREATE OR REPLACE VIEW distribution.search_view AS
	SELECT 
		'Ouvrage' as layer_name,
		_type || ' ' || name as search_text,
		geometry
		FROM distribution.installation_view WhERE _status_active IS TRUE
	UNION SELECT
		'Hydrantes' as layer_name,
		_district || ' '|| identification as search_text,
		geometry
		FROM distribution.hydrant_view WhERE _status_active IS TRUE
	UNION SELECT
		'Abonnés' as layer_name,
		_type || ' ' || _client_identification_full as search_text,
		geometry
		FROM distribution.subscriber_view
	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || identification as search_text,
		geometry
		FROM distribution.valve_view WHERE identification IS NOT NULL;


*/
