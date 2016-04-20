********
Triggers
********

Most of the triggers are located in the qwat_od schema.

We can classify the triggers in 3 categories:

    #. specific behaviour triggers
    #. audit triggers
    #. redirection triggers (triggers on view)

.. note:: In the description below, triggers's name which are not prefixed with the schema name are contained in *qwat_od* schema.


Behaviour Trigger functions
============================

ft_geom3d_altitude
------------------
* UPDATE altitude

ft_controled_crossing
---------------------
* UPDATE controled

ft_leak_pipe
------------
* UPDATE fk_pipe = `fn_pipe_get_id`_

ft_leak_repaired
----------------
* UPDATE _repaired

ft_node_add_pipe_vertex
-----------------------
* UPDATE pipe (geometry)

ft_geometry_alternative_aux
---------------------------
* Update table fields

ft_geometry_alternative_main
----------------------------
* Update table fields

ft_node_geom
------------
* Update table fields

ft_pipe_node_moved
------------------
* UPDATE `pipe`_

ft_pipe_geom
------------
* Update table fields
* `fn_node_create`_

ft_pipe_node_type
-----------------
* Update table fields
* `fn_node_set_type`_

ft_pipe_tunnelbridge
--------------------
.. warning:: to be completed

ft_valve_pipe_update
--------------------
.. warning:: to be completed

ft_tank
-------
* Update table fields
* `fn_litres_per_cm`_

ft_valve_update
---------------
* `fn_pipe_update_valve`_
* UPDATE `pipe`_

ft_valve_handle_altitude
------------------------
* Update table fields

ft_valve_node_set_type
----------------------
* `fn_node_set_type`_

qwat_sys.if_modified_func
-------------------------
* Audit trigger


Redirection trigger functions
=============================


Functions
=========

fn_pipe_get_id
--------------
.. warning:: to be completed

fn_node_create
--------------
* INSERT into node

.. warning:: to be completed

fn_node_set_type
----------------
.. warning:: to be completed

fn_litres_per_cm
----------------
.. warning:: to be completed

fn_pipe_update_valve
--------------------
.. warning:: to be completed


Tables
======

chamber
-------

* `qwat_sys.if_modified_func`_

consumptionzone
---------------
No triggers

cover
-----
* BEFORE INSERT - `ft_geom3d_altitude`_
* BEFORE UPDATE altitude, geometry - `ft_geom3d_altitude`_

crossing
--------
* BEFORE UPDATE - `ft_controled_crossing`_


distributor
-----------
* `qwat_sys.if_modified_func`_

district
--------
* `qwat_sys.if_modified_func`_

folder
------
* No triggers

hydrant
-------
* `qwat_sys.if_modified_func`_

installation
------------
* `qwat_sys.if_modified_func`_

leak
----
* `qwat_sys.if_modified_func`_
* BEFORE INSERT - `ft_leak_pipe`_
* BEFORE INSERT OR UPDATE repair_date - `ft_leak_repaired`_

meter
-----
* `qwat_sys.if_modified_func`_

meter_reference
---------------
* No triggers

network_element
---------------
* No triggers

node
----
* AFTER INSERT - `ft_node_add_pipe_vertex`_
* AFTER UPDATE geometry - `ft_node_add_pipe_vertex`_
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_
* BEFORE INSERT - `ft_node_geom`_
* BEFORE UPDATE geometry - `ft_node_geom`_
* AFTER UPDATE geometry - `ft_pipe_node_moved`_

part
----
16.1 No triggers

pipe
----
* `qwat_sys.if_modified_func`_
* BEFORE UPDATE OF geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_
* BEFORE INSERT - `ft_pipe_geom`_
* BEFORE UPDATE geometry - `ft_pipe_geom`_
* AFTER INSERT OR DELETE - `ft_pipe_node_type`_
* AFTER UPDATE geometry - `ft_pipe_node_type`_
* BEFORE INSERT OR UPDATE tunnel_or_bridge - `ft_pipe_tunnelbridge`_
* AFTER DELETE - `ft_valve_pipe_update`_
* AFTER UPDATE geometry - `ft_valve_pipe_update`_

pressurecontrol
---------------
* `qwat_sys.if_modified_func`_

pressurezone
------------
* `qwat_sys.if_modified_func`_
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_

printmap
--------
* `qwat_sys.if_modified_func`_

protectionzone
--------------
* `qwat_sys.if_modified_func`_

pump
----
* `qwat_sys.if_modified_func`_

remote
------
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_

samplingpoint
-------------
* `qwat_sys.if_modified_func`_

source
------
* `qwat_sys.if_modified_func`_

subscriber
----------
* `qwat_sys.if_modified_func`_

subscriber_reference
--------------------
* `qwat_sys.if_modified_func`_

surveypoint
-----------
* `qwat_sys.if_modified_func`_
* BEFORE INSERT - `ft_geom3d_altitude`_
* BEFORE UPDATE altitude, geometry - `ft_geom3d_altitude`_

tank
----
* `qwat_sys.if_modified_func`_
* BEFORE INSERT OR UPDATE cistern1_fk_type, cistern1_dimension_1, cistern1_dimension_2, cistern2_fk_type, cistern2_dimension_1, cistern2_dimension_2 - `ft_tank`_

treatment
---------
* `qwat_sys.if_modified_func`_

valve
-----
* `qwat_sys.if_modified_func`_
* AFTER UPDATE - `ft_valve_update`_
* BEFORE INSERT - `ft_valve_handle_altitude`_
* BEFORE UPDATE handle_altitude, handle_geometry - `ft_valve_handle_altitude`_
* AFTER INSERT - `ft_valve_node_set_type`_

worker
------
* No triggers



Views
=====

vw_element_hydrant
------------------
* DELETE - `ft_element_hydrant_delete`_
DELETE hydrant
DELETE vw_node_element
* INSERT - `ft_element_hydrant_insert`_
INSERT vw_node_element
INSERT hydrant
* UPDATE - `ft_element_hydrant_update`_
UPDATE vw_node_element
UPDATE hydrant

vw_consumptionzone
------------------
* No triggers

vw_element_installation
-----------------------
* DELETE - `ft_element_installation_delete`_
DELETE vw_qwat_installation
DELETE vw_node_element
* INSERT - `ft_element_installation_insert`_
INSERT vw_node_element
INSERT vw_qwat_installation
* UPDATE - `ft_element_installation_update`_
UPDATE vw_node_element
UPDATE vw_qwat_installation

vw_element_meter
----------------
* DELETE - `ft_element_meter_delete`_
DELETE meter
DELETE vw_node_element
* INSERT - `ft_element_meter_insert`_
INSERT vw_node_element
INSERT meter
* UPDATE - `ft_element_meter_update`_
UPDATE vw_node_element
UPDATE meter

vw_element_part
---------------
* DELETE - `ft_element_part_delete`_
DELETE part
DELETE vw_node_element
* INSERT - `ft_element_part_insert`_
INSERT vw_node_element
INSERT part
* UPDATE - `ft_element_part_update`_
UPDATE vw_node_element
UPDATE part

vw_element_samplingpoint
------------------------
* DELETE - `ft_element_samplingpoint_delete`_
DELETE samplingpoint
DELETE vw_node_element
* INSERT - `ft_element_samplingpoint_insert`_
INSERT vw_node_element
INSERT samplingpoint
* UPDATE - `ft_element_samplingpoint_update`_
UPDATE vw_node_element

vw_element_subscriber
---------------------
* DELETE - `ft_element_subscriber_delete`_
DELETE subscriber
DELETE vw_node_element
* INSERT - `ft_element_subscriber_insert`_
INSERT vw_node_element
INSERT subscriber
* UPDATE - `ft_element_subscriber_update`_
UPDATE vw_node_element
UPDATE subscriber

vw_export_hydrant
-----------------
* No triggers

vw_export_installation
----------------------
* No triggers

vw_export_meter
---------------
* No triggers

vw_export_part
--------------
* No triggers

vw_export_subscriber
--------------------
* No triggers

vw_export_valve
---------------
* No triggers

vw_element_valve
----------------
* DELETE - `ft_element_valve_delete`_
DELETE valve
DELETE vw_node_element
* INSERT - `ft_element_valve_insert`_
INSERT vw_node_element
INSERT valve
* UPDATE - `ft_element_valve_update`_
UPDATE vw_node_element
UPDATE valve

vw_installation_chamber
-----------------------
* DELETE - `ft_installation_chamber_delete`_
DELETE chamber
DELETE installation
* INSERT - `ft_installation_chamber_insert`_
INSERT installation
INSERT chamber
* UPDATE - `ft_installation_chamber_update`_
UPDATE installation
UPDATE chamber

vw_installation_pressurecontrol
-------------------------------
* DELETE - `ft_installation_pressurecontrol_delete`_
DELETE pressurecontrol
DELETE installation
* INSERT - `ft_installation_pressurecontrol_insert`_
INSERT installation
INSERT pressurecontrol
* UPDATE - `ft_installation_pressurecontrol_update`_
UPDATE installation
UPDATE pressurecontrol

vw_installation_pump
--------------------
* DELETE - `ft_installation_pump_delete`_
DELETE pump
DELETE installation
* INSERT - `ft_installation_pump_insert`_
INSERT installation
INSERT pump
* UPDATE - `ft_installation_pump_update`_
UPDATE installation
UPDATE pump

vw_installation_source
----------------------
* DELETE - `ft_installation_source_delete`_
DELETE source
DELETE installation
* INSERT - `ft_installation_source_insert`_
INSERT installation
INSERT source
* UPDATE - `ft_installation_source_update`_
UPDATE installation
UPDATE source

vw_installation_tank
--------------------
* DELETE - `ft_installation_tank_delete`_
DELETE tank
DELETE installation
* INSERT - `ft_installation_tank_insert`_
INSERT installation
INSERT tank
* UPDATE - `ft_installation_tank_update`_
UPDATE installation
UPDATE tank

vw_installation_treatment
-------------------------
* DELETE - `ft_installation_treatment_delete`_
DELETE treatment
DELETE installation
* INSERT - `ft_installation_treatment_insert`_
INSERT installation
INSERT treatment
* UPDATE - `ft_installation_treatment_update`_
UPDATE installation
UPDATE treatment

vw_leak
-------
* No triggers

vw_node_element
---------------
* DELETE - `ft_node_element_delete`_
 DELETE network_element
 `fn_node_set_type`_
* INSERT - `ft_node_element_insert`_
 Update table fields
 `fn_node_create`_
 INSERT network_element
* UPDATE - `ft_node_element_update`_
 UPDATE node
 UPDATE network_element

vw_pipe
-------
* No triggers

vw_pipe_child_parent
--------------------
* No triggers

vw_pipe_schema
--------------
* RULE - update pipe

vw_pipe_schema_error
--------------------
* No triggers

vw_pipe_schema_merged
---------------------
* No triggers

vw_pipe_schema_visibleitems
---------------------------
* RULE - DELETE - UPDATE pipe
* RULE - UPDATE - UPDATE pipe

vw_printmap
-----------
* No triggers

vw_protectionzone
-----------------
* No triggers

vw_qwat_installation
--------------------
* DELETE - `ft_vw_qwat_installation_delete`_
 DELETE source
 DELETE pump
 DELETE tank
 DELETE treatment
 DELETE chamber
 DELETE pressurecontrol
 DELETE installation
* INSERT - `ft_vw_qwat_installation_insert`_
 INSERT installation
 INSERT source
 INSERT pump
 INSERT tank
 INSERT treatment
 INSERT chamber
 INSERT pressurecontrol
* UPDATE - `ft_vw_qwat_installation_update`_
 UPDATE installation
 UPDATE source
 UPDATE pump
 UPDATE tank
 UPDATE treatment
 UPDATE chamber
 UPDATE pressurecontrol

vw_qwat_network_element
-----------------------
* DELETE - `ft_vw_qwat_network_element_delete`_
 DELETE subscriber
 DELETE part
 DELETE vw_qwat_installation
 DELETE hydrant
 DELETE samplingpoint
 DELETE valve
 DELETE meter
 DELETE vw_node_element
* INSERT - `ft_vw_qwat_network_element_insert`_
 INSERT vw_node_element
 INSERT subscriber
 INSERT part
 INSERT vw_qwat_installation
 INSERT hydrant
 INSERT samplingpoint
 INSERT valve
 INSERT meter
* UPDATE - `ft_vw_qwat_network_element_update`_
 UPDATE vw_node_element
 UPDATE subscriber
 UPDATE part
 UPDATE vw_qwat_installation
 UPDATE hydrant
 UPDATE valve
 UPDATE meter

vw_qwat_node
------------
* DELETE - `ft_vw_qwat_node_delete`_
 DELETE network_element
 `fn_node_set_type`_
* INSERT - `ft_vw_qwat_node_insert`_
 Update table fields
 `fn_node_create`_
 UPDATE node
 UPDATE network_element
* UPDATE - `ft_vw_qwat_node_update`_
 Update table fields
 UPDATE node
 UPDATE network_element

vw_remote
---------
* No triggers

vw_search_view
--------------
* No triggers

vw_subscriber_pipe_relation
---------------------------
* No triggers

vw_valves_lines
---------------
* No triggers