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
-- TOC entry 4101 (class 0 OID 141342)
-- Dependencies: 497
-- Data for Name: installation_source; Type: TABLE DATA; Schema: distribution; Owner: sige
--

INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (101, 117, 2, NULL, 660.050, NULL, NULL, NULL, NULL, true, '', '0101000020155500003FE65E2D9400214147DB42B93F4D0241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (102, 120, 2, 2, 846.762, 1.000, 120.000, NULL, NULL, false, '', '01010000201555000085EB51B8D415214100000000829F0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (103, 121, 2, 2, 743.718, 475.000, 1110.000, NULL, NULL, false, '', '010100002015550000FAE837829E252141E3A51F455E930141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (104, 122, 2, 3, 1396.379, 135.000, 650.000, NULL, NULL, true, 'Valeurs valables pour le groupe des Verraux sans les Pontets. Pour la répartition, voir données de jaugeage par source.', '0101000020155500005F14772B373521413BC88877C1D70141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (105, 126, 2, NULL, 654.024, NULL, NULL, NULL, NULL, true, 'Très souvent HS', '010100002015550000DEC388B16BFF20419D63402E60430241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (106, 127, 2, NULL, 646.827, NULL, NULL, NULL, NULL, true, 'HS', '0101000020155500008FC2F52873FD20410AD7A37026370241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (107, 130, 2, 3, 1415.891, 135.000, 650.000, NULL, NULL, true, 'Valeurs valables pour le groupe des Verraux sans les Pontets. Pour la répartition, voir données de jaugeage par source.', '01010000201555000094767A282C362141A8D90B9E06D40141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (108, 137, 2, 3, 1562.966, 292.000, 1314.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '01010000201555000033333333B43E21419A999999458F0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (109, 138, 2, 3, 1563.553, 292.000, 1314.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '010100002015550000666666669C3E214100000000188F0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (110, 139, 2, 3, 1567.706, 292.000, 1314.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '01010000201555000066666666763E21419A999999C18E0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (111, 133, 2, 3, 732.592, 15.000, 95.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '010100002015550000799728E605DC2041EB1D2CE3FA090241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (112, 134, 2, 3, 726.061, 15.000, 95.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '01010000201555000028C1349F42DC20419AB147F4EA090241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (113, 135, 2, 3, 713.557, 15.000, 95.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Pas de jaugeage par source.', '010100002015550000EC51B8DE1ADC20415C8FC2F534080241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (114, 118, 2, NULL, 1035.109, NULL, NULL, NULL, NULL, true, 'Comptabilisée avec la Gde source des Avants', '010100002015550000E5601561B62921416D55549D07AC0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (115, 125, 2, 3, 1007.931, 30.000, 260.000, NULL, NULL, false, '', '01010000201555000048E17A94472B2141295C8FC2C65E0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (116, 154, 2, 3, 1317.826, 10.000, 170.000, NULL, NULL, false, '', '010100002015550000A84BCE443B2C2141C58723791FBF0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (117, 158, 2, 3, 1386.132, 135.000, 650.000, NULL, NULL, true, 'Valeurs valables pour le groupe des Verraux sans les Pontets. Pour la répartition, voir données de jaugeage par source.', '010100002015550000A6F5D08DD1362141830BA2C3FDC80141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (118, 161, 2, 3, 541.238, 120.000, 2580.000, NULL, NULL, false, 'Très souvent HS', '01010000201555000045B291EDBE20214160AE241DD91E0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (119, 163, 2, 3, 1470.479, 15.000, 105.000, NULL, NULL, false, '', '010100002015550000E2964DEC083621414B764BFE0BE70141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (120, 165, 2, 3, 1490.727, 10.000, 55.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '010100002015550000333333F3B236214114AE47E195820141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (121, 166, 2, 3, 1486.613, 10.000, 55.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '0101000020155500000C2E0C03AC362141A204A2BCF2820141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (122, 167, 2, 3, 1478.016, 10.000, 55.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '01010000201555000072265CB6933621419678A32B0D830141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (123, 169, 2, NULL, 1025.799, NULL, NULL, NULL, NULL, false, 'N''alimente qu''une fontaine', '010100002015550000448F10B0582A214124956B1ADCAB0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (124, 101, 2, 2, 1054.738, 3610.000, 9970.000, NULL, NULL, true, 'Comprend la S. Carrière', '0101000020155500004B5F63C6642921418F2861446CAD0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (125, 102, 2, 2, 1028.891, 75.000, 110.000, NULL, NULL, false, '', '010100002015550000F6690DB80D292141E70B106B9AAD0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (126, 119, 2, 2, 1529.549, 15.000, 100.000, NULL, NULL, false, '', '010100002015550000893BA44516362141023917658F6A0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (127, 153, 2, 2, 1381.716, 10.000, 20.000, NULL, NULL, false, '', '0101000020155500004767CBA7E12A2141B21E4AB6FFDF0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (128, 128, 2, 3, 1376.156, 135.000, 650.000, NULL, NULL, true, 'Valeurs valables pour le groupe des Verraux sans les Pontets. Pour la répartition, voir données de jaugeage par source.', '01010000201555000025BFD14EFD352141415A4A0366D10141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (129, 132, 2, 2, 750.308, 150.000, 215.000, NULL, NULL, false, '', '0101000020155500008C399DD48E1F2141B3F98F2727540141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (130, 136, 2, 3, 1553.934, 0.000, 40.000, NULL, NULL, false, '', '010100002015550000420A7DC2D2362141319D1009117F0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (131, 144, 2, 3, 928.280, 45.000, 120.000, NULL, NULL, false, '', '010100002015550000B00A8ABB412921419A6D1BD49D590141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (132, 157, 2, 3, 1262.936, 60.000, 175.000, NULL, NULL, false, '', '010100002015550000CE2A5C841A3421417AAABF7D67970141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (133, 164, 2, 2, 1263.423, 3.000, 25.000, NULL, NULL, false, '', '0101000020155500000954BDB01E292141F8D4DA01DA2A0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (134, 168, 2, 3, 1464.962, 10.000, 55.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '0101000020155500000AD7A3F06D362141295C8FC256830141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (135, 155, 2, 2, 1316.075, 195.000, 410.000, NULL, NULL, false, '', '0101000020155500004E5F113C38312141C0D595B2B2D60141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (136, 159, 2, 2, 1401.987, 20.000, 75.000, NULL, NULL, false, '', '010100002015550000EC51B89EEB3621418FC2F52804A00141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (137, 115, 2, 1, 490.438, 650.000, 1060.000, NULL, NULL, false, '', '010100002015550000453F224FCCED204115BDBEA4A1A90041');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (138, 116, 2, 1, 518.734, 2240.000, 5770.000, NULL, NULL, false, '', '01010000201555000093F139670AED20418CA92EF79BA70041');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (139, 124, 2, 3, 638.175, 3100.000, 7900.000, NULL, NULL, false, '', '0101000020155500008F6B64B7BC21214135D3392E49190141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (140, 162, 2, NULL, 674.558, NULL, NULL, NULL, NULL, true, '', '010100002015550000FF729020A9012141336A63D9A0510241');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (141, 170, 2, 2, 582.680, 710.000, 1020.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '01010000201555000039371A5E661E2141D74FBD85D8490141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (142, 171, 2, 2, 618.173, 710.000, 1020.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '010100002015550000DAFEB65D4C1E2141CF5D3B5E314C0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (143, 172, 2, 2, 630.655, 710.000, 1020.000, NULL, NULL, true, 'Valeurs valables pour le groupe des sources. Jaugeage par source?', '0101000020155500008BF65F5E3D1E2141BCC2ABF2484D0141');
INSERT INTO distribution.installation_source (id, id_installation, id_type, id_quality, altitude, flow_lowest, flow_mean, flow_concession, contract_end, gathering_chamber, remarks, geometry) VALUES (144, 303, 1, 3, 393.414, NULL, NULL, 20000.00, NULL, NULL, 'Attention: concession à augmenter suite aux travaux des Gonelles (OP au courant) de plus, elle s''éteint en 20xx… et la capacité est de 30''000. C''est le canton qui a dicté la procédure, oublie...', '010100002015550000D6AFAE9B80D920418FD7AC4814EC0141');


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 496
-- Name: installation_source_id_seq; Type: SEQUENCE SET; Schema: distribution; Owner: sige
--

SELECT pg_catalog.setval('installation_source_id_seq', 144, true);


-- Completed on 2013-08-22 14:24:49 CEST

--
-- PostgreSQL database dump complete
--

