Triggers
========

Most of the triggers are located in the qwat_od schema.

We can classify the triggers in 3 categories:

    #. specific behaviour triggers
    #. audit triggers
    #. redirection triggers (triggers on view)

.. note:: In the description below, triggers's name which are not prefixed with the schema name are contained in *qwat_od* schema.


Behaviour Trigger functions
----------------------------

ft_geom3d_altitude
^^^^^^^^^^^^^^^^^^
* UPDATE altitude
* UPDATE geometry

Altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)

ft_controled_crossing
^^^^^^^^^^^^^^^^^^^^^
* UPDATE controled = True

ft_leak_pipe
^^^^^^^^^^^^
* UPDATE fk_pipe = `fn_pipe_get_id`_

ft_leak_repaired
^^^^^^^^^^^^^^^^
* UPDATE _repaired

ft_node_add_pipe_vertex
^^^^^^^^^^^^^^^^^^^^^^^
Add a vertex to the corresponding pipe if it intersects.
When the node is close enough to the pipe (< 1 micrometer) the node is considered to intersect the pipe
It allows to deal with intersections that cannot be represented by floating point numbers

* UPDATE pipe (geometry) using St_Snap

ft_geometry_alternative_aux
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Update table fields

ft_geometry_alternative_main
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Update table fields

ft_node_geom
^^^^^^^^^^^^
* Update table fields
* `fn_get_district`_
* `fn_get_pressurezone`_
* `fn_get_printmap_id`_
* `fn_get_printmaps`_

ft_pipe_node_moved
^^^^^^^^^^^^^^^^^^
Update pipe's nodes extremities by creating new nodes, or taking existing ones.

* UPDATE `pipe`_ (fk_node_a, fk_node_b) using `fn_node_create`_



ft_pipe_geom
^^^^^^^^^^^^
* Update table fields
* `fn_node_create`_

ft_pipe_node_type
^^^^^^^^^^^^^^^^^
* Update table fields
* `fn_node_set_type`_

ft_pipe_tunnelbridge
^^^^^^^^^^^^^^^^^^^^
.. warning:: to be completed

ft_valve_pipe_update
^^^^^^^^^^^^^^^^^^^^
.. warning:: to be completed

ft_tank
^^^^^^^
* Update table fields
* `fn_litres_per_cm`_

ft_valve_update
^^^^^^^^^^^^^^^
* `fn_pipe_update_valve`_
* UPDATE `pipe`_

ft_valve_handle_altitude
^^^^^^^^^^^^^^^^^^^^^^^^
* Update table fields

ft_valve_node_set_type
^^^^^^^^^^^^^^^^^^^^^^
* `fn_node_set_type`_

qwat_sys.if_modified_func
^^^^^^^^^^^^^^^^^^^^^^^^^
* Audit trigger

Add a new record in *qwat_sys.logged_actions* (schema, table, user, time...).

Redirection trigger functions
-----------------------------

ft_element_hydrant_delete
^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `hydrant`_
* DELETE `vw_node_element`_

ft_element_hydrant_insert
^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `hydrant`_

ft_element_hydrant_update
^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `hydrant`_

ft_element_installation_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `vw_qwat_installation`_
* DELETE `vw_node_element`_

ft_element_installation_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `vw_qwat_installation`_

ft_element_installation_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `vw_qwat_installation`_

ft_element_meter_delete
^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `meter`_
* DELETE `vw_node_element`_

ft_element_meter_insert
^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `meter`_

ft_element_meter_update
^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `meter`_

ft_element_part_delete
^^^^^^^^^^^^^^^^^^^^^^
* DELETE `part`_
* DELETE `vw_node_element`_

ft_element_part_insert
^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `part`_

ft_element_part_update
^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `part`_

ft_element_samplingpoint_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `samplingpoint`_
* DELETE `vw_node_element`_

ft_element_samplingpoint_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `samplingpoint`_

ft_element_samplingpoint_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_

ft_element_subscriber_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `subscriber`_
* DELETE `vw_node_element`_

ft_element_subscriber_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `subscriber`_

ft_element_subscriber_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_


ft_element_valve_delete
^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `valve`_
* DELETE `vw_node_element`_

ft_element_valve_insert
^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `valve`_

ft_element_valve_update
^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `valve`_

ft_installation_chamber_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `chamber`_
* DELETE `installation`_

ft_installation_chamber_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `chamber`_

ft_installation_chamber_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `chamber`_

ft_installation_pressurecontrol_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `pressurecontrol`_
* DELETE `installation`_

ft_installation_pressurecontrol_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `pressurecontrol`_

ft_installation_pressurecontrol_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `pressurecontrol`_

ft_installation_pump_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `pump`_
* DELETE `installation`_

ft_installation_pump_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `pump`_

ft_installation_pump_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `pump`_

ft_installation_source_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `source`_
* DELETE `installation`_

ft_installation_source_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `source`_

ft_installation_source_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `source`_

ft_installation_tank_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `tank`_
* DELETE `installation`_

ft_installation_tank_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `tank`_

ft_installation_tank_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `tank`_

ft_installation_treatment_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `treatment`_
* DELETE `installation`_

ft_installation_treatment_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `treatment`_

ft_installation_treatment_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `treatment`_

ft_node_element_delete
^^^^^^^^^^^^^^^^^^^^^^
* DELETE `network_element`_
* `fn_node_set_type`_

ft_node_element_insert
^^^^^^^^^^^^^^^^^^^^^^
* Update table fields
* `fn_node_create`_
* INSERT `network_element`_

ft_node_element_update
^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_all_nodes_delete
^^^^^^^^^^^^^^^^^^^^^^
* DELETE `network_element`_
* `fn_node_set_type`_
 
ft_vw_all_nodes_insert
^^^^^^^^^^^^^^^^^^^^^^
* Update table fields
* `fn_node_create`_
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_all_nodes_update
^^^^^^^^^^^^^^^^^^^^^^
* Update table fields
* UPDATE `node`_
* UPDATE `network_element`_

ft_vw_qwat_installation_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `source`_
* DELETE `pump`_
* DELETE `tank`_
* DELETE `treatment`_
* DELETE `chamber`_
* DELETE `pressurecontrol`_
* DELETE `installation`_

ft_vw_qwat_installation_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `installation`_
* INSERT `source`_
* INSERT `pump`_
* INSERT `tank`_
* INSERT `treatment`_
* INSERT `chamber`_
* INSERT `pressurecontrol`_

ft_vw_qwat_installation_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `installation`_
* UPDATE `source`_
* UPDATE `pump`_
* UPDATE `tank`_
* UPDATE `treatment`_
* UPDATE `chamber`_
* UPDATE `pressurecontrol`_

ft_vw_qwat_network_element_delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE `subscriber`_
* DELETE `part`_
* DELETE `vw_qwat_installation`_
* DELETE `hydrant`_
* DELETE `samplingpoint`_
* DELETE `valve`_
* DELETE `meter`_
* DELETE `vw_node_element`_

ft_vw_qwat_network_element_insert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* INSERT `vw_node_element`_
* INSERT `subscriber`_
* INSERT `part`_
* INSERT `vw_qwat_installation`_
* INSERT `hydrant`_
* INSERT `samplingpoint`_
* INSERT `valve`_
* INSERT `meter`_

ft_vw_qwat_network_element_update
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* UPDATE `vw_node_element`_
* UPDATE `subscriber`_
* UPDATE `part`_
* UPDATE `vw_qwat_installation`_
* UPDATE `hydrant`_
* UPDATE `valve`_
* UPDATE `meter`_


Functions
---------

fn_get_district
^^^^^^^^^^^^^^^
Returns the id of the first overlapping district.

Params:
    * geom

Perform an intersection between the geom and `district`_.


fn_get_pressurezone
^^^^^^^^^^^^^^^^^^^
Returns the id of the first overlapping pressurezone.

Params:
    * geom

Perform an intersection between the geom and the `pressurezone`_ geometry.

fn_get_printmap_id
^^^^^^^^^^^^^^^^^^
Returns the id of the first overlapping printmap.

Params:
    * geom

Perform an intersection between the geom and `printmap`_ geometry.

fn_get_printmaps
^^^^^^^^^^^^^^^^
Returns a string contaning all the short names of the polygons in table printmap which overlap the given geometry.

Params:
    * geom
    * result

Perform an intersection between the geom and the `printmap`_ geometry.

fn_litres_per_cm
^^^^^^^^^^^^^^^^
Calculate the litres_per_cm of a `tank`_ cistern.

Params:
    * fk_type
    * dim1
    * dim2

Perform a calculation with dim1 & dim2.

fn_node_create
^^^^^^^^^^^^^^
Returns the node for a given geometry (point). If node does not exist, create it.

Params:
    * _point (geometry)
    * deactivate_node_add_pipe_vertex

Behaviour:
    * Search for a node a the _point location.
    * If a node if found
        * Deactivate the node_add_pipe_vertex_insert trigger if needed
        * INSERT into `node`_
        * Reactivate the node_add_pipe_vertex_insert trigger if needed

fn_node_get_ids
^^^^^^^^^^^^^^^
Returns a list of node IDs contained a given extent.

Params:
    * extent

Perform a selection on `node`_ with the given extent. If no extent is provided, return all ids.

fn_node_set_type[]
^^^^^^^^^^^^^^^^^^
Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year).

Params:
    * _node_ids[]

Perform `fn_node_set_type`_ for each `node`_ given in param. If no ids are given, the process is perform on all `node`_ ids.

fn_node_set_type
^^^^^^^^^^^^^^^^
Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year).

Params:
    * _node_id

Perform a lot of processing:
    * Count the active pipes associated to this `node`_ (by joining tables from qwat_vlstatus & qwat_vl_pipe_function)
    * If count = 0:
        * If _node_id not on a `pipe`_ extremity (fk_node_a, fk_node_b)
            * If this is really a `node`_, delete it from node
            * Else, the node must be on the pipe vertex
                * Get geometry of the `pipe`_
                * If the geometry is null: raise an error
                * Else calculate the orientation of the `pipe`_

    * If count = 1 or 2
        * Loop over them, and take the 2 first/last vertices of the `pipe`_ to determine orientation (used for symbology)
    * If count > 2
        * Nothing to do

    * UPDATE node (_pipe_node_type, _pipe_orientation, _pipe_schema_visible)

fn_node_update_id
^^^^^^^^^^^^^^^^^
Not used anymore ?

.. warning:: to be completed

fn_pipe_get_id
^^^^^^^^^^^^^^
Returns the `pipe`_ at a given position. If geometry is a point, do not return a `pipe`_ which ends on it.

Params:
    * geometry

Perform an intersection between the geometry and the `pipe`_ geometries.

fn_pipe_update_valve
^^^^^^^^^^^^^^^^^^^^
Update `pipe`_ valves informations.

Params:
    * _pipe_id

Perform an update on `pipe`_ (_valve_count, _valve_closed) by joining `valve`_.

fn_update_pipe_crossing
^^^^^^^^^^^^^^^^^^^^^^^


Params:
    * update_existing
    * delete_unused

Process:
    * Get all crossing points (by performing intersections between pipes)
    * For each point
        * If point is at the end of a pipe: do nothing
        * Else, for the 2 crossing pipes :
            * Perform azimuth for all segments of the pipes with the corresponding linear referencing
            * Find the correct segment according to linear referencing of the crossing point
            * Get the corresponding azimuth according to segment id
            * Reports errors if azimuth are null
            * If the crossing is already existing: update it (_pipe1_id, _pipe1_angle, _pipe2_id, _pipe2_angle,geometry)
            * Else: create it
        * Delete the old crossing

.. warning:: This trigger use a fixed fk_status values = 1301


fn_update_sequences
^^^^^^^^^^^^^^^^^^^
Update a specific sequence.

Params:
    * none

For all columns in the DB associated to a sequence, calculate the max value + 1 for the column, and reassociate the next value of the sequence to that max.


Tables
------

chamber
^^^^^^^

* `qwat_sys.if_modified_func`_

consumptionzone
^^^^^^^^^^^^^^^
No triggers

cover
^^^^^
* BEFORE INSERT - `ft_geom3d_altitude`_
* BEFORE UPDATE altitude, geometry - `ft_geom3d_altitude`_

crossing
^^^^^^^^
* BEFORE UPDATE - `ft_controled_crossing`_


distributor
^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

district
^^^^^^^^
* `qwat_sys.if_modified_func`_

folder
^^^^^^
* No triggers

hydrant
^^^^^^^
* `qwat_sys.if_modified_func`_

installation
^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

leak
^^^^
* `qwat_sys.if_modified_func`_
* BEFORE INSERT - `ft_leak_pipe`_
* BEFORE INSERT OR UPDATE repair_date - `ft_leak_repaired`_

meter
^^^^^
* `qwat_sys.if_modified_func`_

meter_reference
^^^^^^^^^^^^^^^
* No triggers

network_element
^^^^^^^^^^^^^^^
* No triggers

node
^^^^
* AFTER INSERT - `ft_node_add_pipe_vertex`_
* AFTER UPDATE geometry - `ft_node_add_pipe_vertex`_
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_
* BEFORE INSERT - `ft_node_geom`_
* BEFORE UPDATE geometry - `ft_node_geom`_
* AFTER UPDATE geometry - `ft_pipe_node_moved`_

part
^^^^
* No triggers

pipe
^^^^
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
^^^^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

pressurezone
^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_

printmap
^^^^^^^^
* `qwat_sys.if_modified_func`_

protectionzone
^^^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

pump
^^^^
* `qwat_sys.if_modified_func`_

remote
^^^^^^
* BEFORE UPDATE geometry_alt1, geometry_alt2 - `ft_geometry_alternative_aux`_
* BEFORE INSERT - `ft_geometry_alternative_main`_
* BEFORE UPDATE geometry - `ft_geometry_alternative_main`_

samplingpoint
^^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

source
^^^^^^
* `qwat_sys.if_modified_func`_

subscriber
^^^^^^^^^^
* `qwat_sys.if_modified_func`_

subscriber_reference
^^^^^^^^^^^^^^^^^^^^
* `qwat_sys.if_modified_func`_

surveypoint
^^^^^^^^^^^
* `qwat_sys.if_modified_func`_
* BEFORE INSERT - `ft_geom3d_altitude`_
* BEFORE UPDATE altitude, geometry - `ft_geom3d_altitude`_

tank
^^^^
* `qwat_sys.if_modified_func`_
* BEFORE INSERT OR UPDATE cistern1_fk_type, cistern1_dimension_1, cistern1_dimension_2, cistern2_fk_type, cistern2_dimension_1, cistern2_dimension_2 - `ft_tank`_

treatment
^^^^^^^^^
* `qwat_sys.if_modified_func`_

valve
^^^^^
* `qwat_sys.if_modified_func`_
* AFTER UPDATE - `ft_valve_update`_
* BEFORE INSERT - `ft_valve_handle_altitude`_
* BEFORE UPDATE handle_altitude, handle_geometry - `ft_valve_handle_altitude`_
* AFTER INSERT - `ft_valve_node_set_type`_

worker
^^^^^^
* No triggers



Views
-----

vw_element_hydrant
^^^^^^^^^^^^^^^^^^
* DELETE - `ft_element_hydrant_delete`_
* INSERT - `ft_element_hydrant_insert`_
* UPDATE - `ft_element_hydrant_update`_

vw_consumptionzone
^^^^^^^^^^^^^^^^^^
* No triggers

vw_element_installation
^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_element_installation_delete`_
* INSERT - `ft_element_installation_insert`_
* UPDATE - `ft_element_installation_update`_

vw_element_meter
^^^^^^^^^^^^^^^^
* DELETE - `ft_element_meter_delete`_
* INSERT - `ft_element_meter_insert`_
* UPDATE - `ft_element_meter_update`_

vw_element_part
^^^^^^^^^^^^^^^
* DELETE - `ft_element_part_delete`_
* INSERT - `ft_element_part_insert`_
* UPDATE - `ft_element_part_update`_

vw_element_samplingpoint
^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_element_samplingpoint_delete`_
* INSERT - `ft_element_samplingpoint_insert`_
* UPDATE - `ft_element_samplingpoint_update`_

vw_element_subscriber
^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_element_subscriber_delete`_
* INSERT - `ft_element_subscriber_insert`_
* UPDATE - `ft_element_subscriber_update`_

vw_export_hydrant
^^^^^^^^^^^^^^^^^
* No triggers

vw_export_installation
^^^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_export_meter
^^^^^^^^^^^^^^^
* No triggers

vw_export_part
^^^^^^^^^^^^^^
* No triggers

vw_export_subscriber
^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_export_valve
^^^^^^^^^^^^^^^
* No triggers

vw_element_valve
^^^^^^^^^^^^^^^^
* DELETE - `ft_element_valve_delete`_
* INSERT - `ft_element_valve_insert`_
* UPDATE - `ft_element_valve_update`_

vw_installation_chamber
^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_chamber_delete`_
* INSERT - `ft_installation_chamber_insert`_
* UPDATE - `ft_installation_chamber_update`_

vw_installation_pressurecontrol
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_pressurecontrol_delete`_
* INSERT - `ft_installation_pressurecontrol_insert`_
* UPDATE - `ft_installation_pressurecontrol_update`_

vw_installation_pump
^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_pump_delete`_
* INSERT - `ft_installation_pump_insert`_
* UPDATE - `ft_installation_pump_update`_

vw_installation_source
^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_source_delete`_
* INSERT - `ft_installation_source_insert`_
* UPDATE - `ft_installation_source_update`_

vw_installation_tank
^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_tank_delete`_
* INSERT - `ft_installation_tank_insert`_
* UPDATE - `ft_installation_tank_update`_

vw_installation_treatment
^^^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_installation_treatment_delete`_
* INSERT - `ft_installation_treatment_insert`_
* UPDATE - `ft_installation_treatment_update`_

vw_leak
^^^^^^^
* No triggers

vw_node_element
^^^^^^^^^^^^^^^
* DELETE - `ft_node_element_delete`_
* INSERT - `ft_node_element_insert`_
* UPDATE - `ft_node_element_update`_

vw_pipe
^^^^^^^
* No triggers

vw_pipe_child_parent
^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_pipe_schema
^^^^^^^^^^^^^^
* RULE - UPDATE `pipe`_

vw_pipe_schema_error
^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_pipe_schema_merged
^^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_pipe_schema_visibleitems
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* RULE - DELETE / UPDATE `pipe`_
* RULE - UPDATE / UPDATE `pipe`_

vw_printmap
^^^^^^^^^^^
* No triggers

vw_protectionzone
^^^^^^^^^^^^^^^^^
* No triggers

vw_qwat_installation
^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_vw_qwat_installation_delete`_
* INSERT - `ft_vw_qwat_installation_insert`_
* UPDATE - `ft_vw_qwat_installation_update`_

vw_qwat_network_element
^^^^^^^^^^^^^^^^^^^^^^^
* DELETE - `ft_vw_qwat_network_element_delete`_
* INSERT - `ft_vw_qwat_network_element_insert`_
* UPDATE - `ft_vw_qwat_network_element_update`_

vw_all_nodes
^^^^^^^^^^^^
* DELETE - `ft_vw_all_nodes_delete`_
* INSERT - `ft_vw_all_nodes_insert`_
* UPDATE - `ft_vw_all_nodes_update`_

vw_remote
^^^^^^^^^
* No triggers

vw_search_view
^^^^^^^^^^^^^^
* No triggers

vw_subscriber_pipe_relation
^^^^^^^^^^^^^^^^^^^^^^^^^^^
* No triggers

vw_valves_lines
^^^^^^^^^^^^^^^
* No triggers
