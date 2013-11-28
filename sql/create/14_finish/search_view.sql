


CREATE OR REPLACE VIEW distribution.vw_search_view AS
	/* ouvrages */
	SELECT
		'Ouvrages' as layer_name,
		'Réservoir ' || name as search_text,
		geometry
		FROM distribution.od_installation_tank 
		INNER JOIN distribution.vl_status ON od_installation_tank.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Pompage ' || name as search_text,
		geometry
		FROM distribution.od_installation_pump 
		INNER JOIN distribution.vl_status ON od_installation_pump.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Source ' || name as search_text,
		geometry
		FROM distribution.od_installation_source
		INNER JOIN distribution.vl_status ON od_installation_source.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Traitement ' || name as search_text,
		geometry
		FROM distribution.od_installation_treatment 
		INNER JOIN distribution.vl_status ON od_installation_treatment.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Régukation de pression ' || name as search_text,
		geometry
		FROM distribution.od_installation_pressurecontrol 
		INNER JOIN distribution.vl_status ON od_installation_pressurecontrol.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Chambre de vannes ' || name as search_text,
		geometry
		FROM distribution.od_installation_valvechamber
		INNER JOIN distribution.vl_status ON od_installation_valvechamber.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
		
	UNION SELECT
		'Hydrantes' as layer_name,
		_district || ' '|| identification as search_text,
		geometry
		FROM distribution.vw_hydrant WHERE _status_active IS TRUE
		
	UNION SELECT
		'Abonnés' as layer_name,
		_type || ' ' || _identification_full || ' ' || _district as search_text,
		geometry
		FROM distribution.vw_subscriber
		
	UNION SELECT
		'Compteur' as layer_name,
		_identification_full as search_text,
		geometry
		FROM distribution.od_meter
		
	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || identification as search_text,
		geometry
		FROM distribution.vw_valve WHERE identification IS NOT NULL;
