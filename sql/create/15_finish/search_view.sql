


CREATE OR REPLACE VIEW qwat.vw_search_view AS
	/* ouvrages */
	SELECT
		'Ouvrages' as layer_name,
		'Réservoir ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_tank 
		INNER JOIN qwat.vl_status ON od_installation_tank.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Pompage ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_pump 
		INNER JOIN qwat.vl_status ON od_installation_pump.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Source ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_source
		INNER JOIN qwat.vl_status ON od_installation_source.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Traitement ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_treatment 
		INNER JOIN qwat.vl_status ON od_installation_treatment.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Régulation de pression ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_pressurecontrol 
		INNER JOIN qwat.vl_status ON od_installation_pressurecontrol.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Chambre de vannes ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat.od_installation_valvechamber
		INNER JOIN qwat.vl_status ON od_installation_valvechamber.id_status = vl_status.id
		WHERE vl_status.active IS TRUE
		
	UNION SELECT
		'Hydrantes' as layer_name,
		_district || ' '|| identification as search_text,
		geometry
		FROM qwat.vw_hydrant WHERE _status_active IS TRUE
		
	UNION SELECT
		'Abonnés' as layer_name,
		_type || ' ' || _identification_full || ' ' || _district as search_text,
		geometry
		FROM qwat.vw_subscriber
		
	UNION SELECT
		'Compteur' as layer_name,
		_identification_full as search_text,
		geometry
		FROM qwat.od_meter
		
	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || identification || ' ' || _district as search_text,
		geometry
		FROM qwat.vw_valve WHERE identification IS NOT NULL;
