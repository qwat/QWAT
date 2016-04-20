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

ft_element_hydrant_delete
-------------------------
* DELETE `hydrant`_
* DELETE `vw_node_element`_

ft_element_hydrant_insert
-------------------------
* INSERT `vw_node_element`_
* INSERT `hydrant`_

ft_element_hydrant_update
-------------------------
* UPDATE `vw_node_element`_
* UPDATE `hydrant`_

ft_element_installation_delete
------------------------------
* DELETE `vw_qwat_installation`_
* DELETE `vw_node_element`_

ft_element_installation_insert
------------------------------
* INSERT `vw_node_element`_
* INSERT `vw_qwat_installation`_

ft_element_installation_update
------------------------------
* UPDATE `vw_node_element`_
* UPDATE `vw_qwat_installation`_

ft_element_meter_delete
-----------------------
* DELETE `meter`_
* DELETE `vw_node_element`_

ft_element_meter_insert
-----------------------
* INSERT `vw_node_element`_
* INSERT `meter`_

ft_element_meter_update
-----------------------
* UPDATE `vw_node_element`_
* UPDATE `meter`_

ft_element_part_delete
----------------------
* DELETE `part`_
* DELETE `vw_node_element`_

ft_element_part_insert
----------------------
* INSERT `vw_node_element`_
* INSERT `part`_

ft_element_part_update
----------------------
* UPDATE `vw_node_element`_
* UPDATE `part`_

ft_element_samplingpoint_delete
-------------------------------
* DELETE `samplingpoint`_
* DELETE `vw_node_element`_

ft_element_samplingpoint_insert
-------------------------------
* INSERT `vw_node_element`_
* INSERT `samplingpoint`_

ft_element_samplingpoint_update
-------------------------------
* UPDATE `vw_node_element`_

ft_element_subscriber_delete
----------------------------
* DELETE `subscriber`_
* DELETE `vw_node_element`_

ft_element_subscriber_insert
----------------------------
* INSERT `vw_node_element`_
* INSERT `subscriber`_

ft_element_subscriber_update
----------------------------
* UPDATE `vw_node_element`_


ft_element_valve_delete
-----------------------
* DELETE `valve`_
* DELETE `vw_node_element`_

ft_element_valve_insert
-----------------------
* INSERT `vw_node_element`_
* INSERT `valve`_

ft_element_valve_update
-----------------------
* UPDATE `vw_node_element`_
* UPDATE `valve`_

ft_installation_chamber_delete
------------------------------
* DELETE `chamber`_
* DELETE `installation`_

ft_installation_chamber_insert
------------------------------
* INSERT `installation`_
* INSERT `chamber`_

ft_installation_chamber_update
------------------------------
* UPDATE `installation`_
* UPDATE `chamber`_

ft_installation_pressurecontrol_delete
--------------------------------------
* DELETE `pressurecontrol`_
* DELETE `installation`_

ft_installation_pressurecontrol_insert
--------------------------------------
* INSERT `installation`_
* INSERT `pressurecontrol`_

ft_installation_pressurecontrol_update
--------------------------------------
* UPDATE `installation`_
* UPDATE `pressurecontrol`_

ft_installation_pump_delete
---------------------------
* DELETE `pump`_
* DELETE `installation`_

ft_installation_pump_insert
---------------------------
* INSERT `installation`_
* INSERT `pump`_

ft_installation_pump_update
---------------------------
* UPDATE `installation`_
* UPDATE `pump`_

ft_installation_source_delete
-----------------------------
* DELETE `source`_
* DELETE `installation`_

ft_installation_source_insert
-----------------------------
* INSERT `installation`_
* INSERT `source`_

ft_installation_source_update
-----------------------------
* UPDATE `installation`_
* UPDATE `source`_

ft_installation_tank_delete
---------------------------
* DELETE `tank`_
* DELETE `installation`_

ft_installation_tank_insert
---------------------------
* INSERT `installation`_
* INSERT `tank`_

ft_installation_tank_update
---------------------------
* UPDATE `installation`_
* UPDATE `tank`_

ft_installation_treatment_delete
--------------------------------
* DELETE `treatment`_
* DELETE `installation`_

ft_installation_treatment_insert
--------------------------------
* INSERT `installation`_
* INSERT `treatment`_

ft_installation_treatment_update
--------------------------------
* UPDATE `installation`_
* UPDATE `treatment`_

ft_node_element_delete
----------------------
* DELETE `network_element`_
* `fn_node_set_type`_

ft_node_element_insert
----------------------
* Update table fields
* `fn_node_create`_
* INSERT `network_element`_

ft_node_element_update
----------------------
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_qwat_node_delete
----------------------
* DELETE `network_element`_
* `fn_node_set_type`_
 
ft_vw_qwat_node_insert
----------------------
* Update table fields
* `fn_node_create`_
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_qwat_node_update
----------------------
* Update table fields
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_qwat_installation_delete
------------------------------
* DELETE `source`_
* DELETE `pump`_
* DELETE `tank`_
* DELETE `treatment`_
* DELETE `chamber`_
* DELETE `pressurecontrol`_
* DELETE `installation`_

ft_vw_qwat_installation_insert
------------------------------
* INSERT `installation`_
* INSERT `source`_
* INSERT `pump`_
* INSERT `tank`_
* INSERT `treatment`_
* INSERT `chamber`_
* INSERT `pressurecontrol`_

ft_vw_qwat_installation_update
------------------------------
* UPDATE `installation`_
* UPDATE `source`_
* UPDATE `pump`_
* UPDATE `tank`_
* UPDATE `treatment`_
* UPDATE `chamber`_
* UPDATE `pressurecontrol`_

ft_vw_qwat_network_element_delete
---------------------------------
* DELETE `subscriber`_
* DELETE `part`_
* DELETE `vw_qwat_installation`_
* DELETE `hydrant`_
* DELETE `samplingpoint`_
* DELETE `valve`_
* DELETE `meter`_
* DELETE `vw_node_element`_

ft_vw_qwat_network_element_insert
---------------------------------
* INSERT `vw_node_element`_
* INSERT `subscriber`_
* INSERT `part`_
* INSERT `vw_qwat_installation`_
* INSERT `hydrant`_
* INSERT `samplingpoint`_
* INSERT `valve`_
* INSERT `meter`_

ft_vw_qwat_network_element_update
---------------------------------
* UPDATE `vw_node_element`_
* UPDATE `subscriber`_
* UPDATE `part`_
* UPDATE `vw_qwat_installation`_
* UPDATE `hydrant`_
* UPDATE `valve`_
* UPDATE `meter`_


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
* No triggers

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
* INSERT - `ft_element_hydrant_insert`_
* UPDATE - `ft_element_hydrant_update`_

vw_consumptionzone
------------------
* No triggers

vw_element_installation
-----------------------
* DELETE - `ft_element_installation_delete`_
* INSERT - `ft_element_installation_insert`_
* UPDATE - `ft_element_installation_update`_

vw_element_meter
----------------
* DELETE - `ft_element_meter_delete`_
* INSERT - `ft_element_meter_insert`_
* UPDATE - `ft_element_meter_update`_

vw_element_part
---------------
* DELETE - `ft_element_part_delete`_
* INSERT - `ft_element_part_insert`_
* UPDATE - `ft_element_part_update`_

vw_element_samplingpoint
------------------------
* DELETE - `ft_element_samplingpoint_delete`_
* INSERT - `ft_element_samplingpoint_insert`_
* UPDATE - `ft_element_samplingpoint_update`_

vw_element_subscriber
---------------------
* DELETE - `ft_element_subscriber_delete`_
* INSERT - `ft_element_subscriber_insert`_
* UPDATE - `ft_element_subscriber_update`_

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
* INSERT - `ft_element_valve_insert`_
* UPDATE - `ft_element_valve_update`_

vw_installation_chamber
-----------------------
* DELETE - `ft_installation_chamber_delete`_
* INSERT - `ft_installation_chamber_insert`_
* UPDATE - `ft_installation_chamber_update`_

vw_installation_pressurecontrol
-------------------------------
* DELETE - `ft_installation_pressurecontrol_delete`_
* INSERT - `ft_installation_pressurecontrol_insert`_
* UPDATE - `ft_installation_pressurecontrol_update`_

vw_installation_pump
--------------------
* DELETE - `ft_installation_pump_delete`_
* INSERT - `ft_installation_pump_insert`_
* UPDATE - `ft_installation_pump_update`_

vw_installation_source
----------------------
* DELETE - `ft_installation_source_delete`_
* INSERT - `ft_installation_source_insert`_
* UPDATE - `ft_installation_source_update`_

vw_installation_tank
--------------------
* DELETE - `ft_installation_tank_delete`_
* INSERT - `ft_installation_tank_insert`_
* UPDATE - `ft_installation_tank_update`_

vw_installation_treatment
-------------------------
* DELETE - `ft_installation_treatment_delete`_
* INSERT - `ft_installation_treatment_insert`_
* UPDATE - `ft_installation_treatment_update`_

vw_leak
-------
* No triggers

vw_node_element
---------------
* DELETE - `ft_node_element_delete`_
* INSERT - `ft_node_element_insert`_
* UPDATE - `ft_node_element_update`_

vw_pipe
-------
* No triggers

vw_pipe_child_parent
--------------------
* No triggers

vw_pipe_schema
--------------
* RULE - UPDATE `pipe`_

vw_pipe_schema_error
--------------------
* No triggers

vw_pipe_schema_merged
---------------------
* No triggers

vw_pipe_schema_visibleitems
---------------------------
* RULE - DELETE / UPDATE `pipe`_
* RULE - UPDATE / UPDATE `pipe`_

vw_printmap
-----------
* No triggers

vw_protectionzone
-----------------
* No triggers

vw_qwat_installation
--------------------
* DELETE - `ft_vw_qwat_installation_delete`_
* INSERT - `ft_vw_qwat_installation_insert`_
* UPDATE - `ft_vw_qwat_installation_update`_

vw_qwat_network_element
-----------------------
* DELETE - `ft_vw_qwat_network_element_delete`_
* INSERT - `ft_vw_qwat_network_element_insert`_
* UPDATE - `ft_vw_qwat_network_element_update`_

vw_qwat_node
------------
* DELETE - `ft_vw_qwat_node_delete`_
* INSERT - `ft_vw_qwat_node_insert`_
* UPDATE - `ft_vw_qwat_node_update`_

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
