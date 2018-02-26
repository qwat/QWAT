Elevation
=========

Managing Z values in a water distribution network is important and has to be treated carefully. We have to follow conventions and principles to ensure that we keep precision, measurements sources, and providing useful and easy way of managing the elevation information.

This page details how elevation is managed in the QWAT project.

Principles
----------

* Reference altitude values are stored in nodes and survey points. They may have been set manually, or set from field measurements
* 3D geometries for pipes are automatically recomputed, and the Z value of the pipe's vertices should not be set manually. The 3D geometry is recomputed from nodes and survey points by interpolating the values.
* Nodes and survey points tables feature informations on the precision, as well as source of measure (gps, interpolation, dtm, etc..). The following attributes are stored :

    * precision_plani : planimetric precision
    * precision_alt : altimetric precision
    * zsource : source of measure

* A survey point does not necessarily correspond to a node. If the survey point spatially corresponds to a vertex, the value will also be used for interpolating the 3D geometry of the pipe.
* Each location where altitude are known (measured) has a corresponding survey point or node
* 3D pipe geometry is always recomputed as a whole
* Default altitude is 0.0, as 3D geometries in PostGIS do not support null values for Z coordinate. Elevation values at 0.0 should not be manually set. Instead use the real field value, which should not be strictly equal to zero.


Behaviours
----------

* If we move an element of the network (valve, part, hydrant ...) then attached pipe's geometries are recomputed with 3D information
* Any modification of a pipe's geometry will trigger recomputation of its 3D geometry with calculated interpolated elevation
* If a new vertex is created for a pipe, or a vertex is moved, the elevation value for this vertex is nulled (set to 0) and will be automatically recomputed
* If we want to insert a node on a pipe and we do not know the elevation for this node, we should create the node, use the tool to compute an interpolated value on this node, and connect the pipe


Needed tools
------------

* A tool to compute interpolated elevation for specific network element (valve, hydrant..). It uses the N nearest nodes and survey points to interpolate the altitude. N can be chosen in QGIS GUI.
* Tool to compute interpolated elevation for specific network elements by pointing to a pipe
* A tool to computed interpolated altitudes for a selection of objects (e.g. construction points over which a pipe passes), given a set of reference points (e.g. 3 surveys points)
* A tool to create a node or a survey point at a specific pipe vertex, asking the user for elevation value and precision, with default value being the pipe's vertex interpolated elevation value.

Open Issues
-----------

* How to compute the precision for a pipe given the precision for nodes ? Where to store this computed information ?
* When interpolating the pipe's elevation, is there any parameter we want to set ? There should'nt be, but the buffer around the pipe to take survey points into account looks like an important parameter.


Références
----------

* https://github.com/qwat/QWAT/issues/93
* https://github.com/qwat/qwat-data-model/issues/82
