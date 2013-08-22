--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.2.4
-- Started on 2013-08-22 14:24:49 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = distribution, pg_catalog;

--
-- TOC entry 4099 (class 0 OID 141294)
-- Dependencies: 491
-- Data for Name: installation_pump; Type: TABLE DATA; Schema: distribution; Owner: sige
--

INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (122, 530, 2, NULL, 811.330, 1, 340.00, 105.00, 'HMT estimée selon alt. Carcatéristiques pompe Q-HMT: 1070-60', '010100002015550000D52F85A5A409214157ECCC80B6910241');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (123, 301, 1, 2, 590.346, 3, 1200.00, 250.00, 'max 2 pompes en parallèle, 1 pompe = 990 l/minHMT estimée selon alt.', '0101000020155500000ADB0D6EFBEA2041A0F5D778820A0241');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (124, 304, 1, 1, 1038.186, 2, 820.00, 165.00, 'HMT estimée selon alt.
Carcatéristiques pompe Q-HMT: 900-160', '0101000020155500002D68EF7CBF2521417307B994F6B80141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (125, 305, 2, NULL, 470.270, 1, 3200.00, 39.00, 'HMT donnée par LH', '010100002015550000F9E2A47124072141DF1C095F51AC0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (126, 303, 1, 2, 393.414, 6, 26550.00, 82.00, 'Q-HMT selon essais réalisés', '010100002015550000D6AFAE9B80D920418FD7AC4814EC0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (127, 303, 1, 2, 393.414, 2, 3400.00, 145.00, 'Q-HMT selon essais réalisés', '010100002015550000D6AFAE9B80D920418FD7AC4814EC0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (128, 302, 1, 1, 1357.890, 2, 155.00, 140.00, 'HMT estimée selon alt.', '010100002015550000C498D385C625214113AF576D98E20141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (129, 446, 2, 1, 531.174, 2, 1400.00, 65.00, '1 pompe max selon LH -> si panne alim. Es, Toulayes?', '010100002015550000E99515D59BF520413B36C04C9A100241');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (131, 562, 1, 2, 500.420, 2, 7500.00, 229.00, '', '010100002015550000F6F553BCDAEB20410C925F33DDFB0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (132, 13, 1, 2, 950.519, 2, 1150.00, 130.00, '1 pompe = 970 l/minHMT estimée altitudes et selon caractéristiques pompes Q-HMT: 900-142', '010100002015550000594B2215DCE22041321EC6E8791F0241');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (135, 410, 2, 1, 860.383, 2, 420.00, 60.00, 'HMT estimée car pression dispo à l''amont variable: HMT max', '0101000020155500002183CBE1E201214125C5F09E0F720241');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (136, 17, 1, 1, 1257.999, 2, 250.00, 125.00, 'P1: 120 l/min, P2: 250 l/minHMT estimée, données de pompes pas dispo.', '010100002015550000EA49D38DAB26214107580E1954C90141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (137, 402, 1, NULL, 1032.491, 1, 600.00, 80.00, 'HMT estimée, données de pompes pas dispo.', '010100002015550000C6F321AB9C292141E677DC20A5AB0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (138, 31, 1, NULL, 480.973, 1, 2500.00, 25.00, 'HMT estimée, données de pompes pas dispo.', '010100002015550000C1A101FA55142141FEDDD0DEC3790141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (139, 3, 1, NULL, 1182.742, 1, 180.00, 105.00, 'HMT estimée, données de pompes pas dispo.', '010100002015550000C99FDA52E9282141CBC39DDE506B0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (140, 525, 1, NULL, 1284.665, 1, 90.00, 245.00, 'HMT estimée, données de pompes pas dispo.', '010100002015550000FA882D9F442D21411CDBDF4F886D0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (141, 29, 2, NULL, 450.070, 1, 420.00, 30.00, 'pompe de forçage circulationHMT estimée, données de pompes pas dispo.', '010100002015550000283B47280C0A2141D1EDA1849F9F0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (142, 10, 1, NULL, 767.644, 1, 150.00, 415.00, 'HMT estimée, données de pompes pas dispo.', '0101000020155500002B18F0FFEB1C2141FB7035BF43640141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (130, 562, 1, 2, 500.420, 2, 1800.00, 75.00, '2 pompes max -> 2 pompes max à Fenil, dimensionnement prévu comme ça', '010100002015550000F6F553BCDAEB20410C925F33DDFB0141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (134, 7, 1, 2, 449.866, 3, 10090.00, 55.00, 'P1: 5000 l/min, P4: 7700 l/min, P5: 6000 l/minQmax issu des volumes journaliers Projet: 2x 10000 l/min', '01010000201555000039DD47F28DEC2041FF38692B49F10141');
INSERT INTO distribution.installation_pump (id, id_installation, id_type, id_operating, altitude, nb_pump, rejected_flow, manometric_height, remarks, geometry) VALUES (133, 19, 1, 1, 704.234, 2, 900.00, 135.00, 'Q moyen = 600 l/min ou 480 l/min Attention Q à vérifier 3 valeurs différentes. Q-HMT pompe: 600-165 Pompage contre réseau: enclenchement à 4 bar, déclenchement à 7 bar', '010100002015550000F70890E038EC20413B7B5FD3EC190241');


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 490
-- Name: installation_pump_id_seq; Type: SEQUENCE SET; Schema: distribution; Owner: sige
--

SELECT pg_catalog.setval('installation_pump_id_seq', 142, true);


-- Completed on 2013-08-22 14:24:49 CEST

--
-- PostgreSQL database dump complete
--

