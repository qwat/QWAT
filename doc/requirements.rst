************
Requirements
************

Server-side
===========

Server side software components are:

* `PostgreSQL <https://postgresql.org/>`_ (> 9.3)
* `PostGIS <https://postgis.net/>`_, the spatial extension (> 2.1)
* `Python <https://www.python.org/>`_, for installation and update (> 3.5)
* `PUM <https://github.com/opengisch/pum>`_ for upgrade

Supported and tested versions are PostgreSQL 9.6 and Postgis 2.3.

The exact required hardware configuration is very dependant on the data sizes.
However, water network data tend not to be huge volumes, and the minimal required configuration is very low.

A comfortable configuration would be the following:

* 4x Core Intel
* >= 8GB RAM
* SSD Storage (40GB+) with Raid capabilities for data redundancy

We recommend using Linux as Operating System when running PostgreSQL, for performance and stability.

In order to benefit fully from your hardware, PostgreSQL should be configured correctly.
You can use the following application to have a basic configuration better than default values : http://pgtune.leopard.in.ua/

Choose the following parameters:

* DB Version : your PostgreSQL database version
* OS Type : your Operating System
* DB Type : "Mixed type of applications"
* Total memory : how much memory is installed on your server
* Number of connections : how many concurrent users you want to allow ( as a maximum ). Optional parameter

The application should give you the settings to adapt in the ``postgresql.conf`` configuration file.

Client-side
===========

Client side components are:

* QGIS (2.14+)
* QGIS extensions (depending on specific use case)

The exact required configuration is very dependant on the data sizes and complexity of rendering.
However, water network data tend not to be huge volumes, and the minimal required configuration
is not really high. For smooth map rendering, it is advised to use recent hardware, good video card and enough RAM though.

A comfortable configuration would be:

* 4x core Intel processor
* 8GB of RAM
* SSD storage
* Good video card (recent onboard Intel are ok, or dedicated NVidia/AMD)
