Setup database server
=====================

If you expect to access the data from several different workstations, you can
install the database on a network accessible server. If it is just a single
desktop you are working on, this can be installed on the same machine.

Required Software
-----------------

Server installation
~~~~~~~~~~~~~~~~~~~

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
* Number of connections : how many concurrent users you want to allow (as a maximum). Optional parameter

The application should give you the settings to adapt in the ``postgresql.conf`` configuration file.


.. note::

 In a single desktop environment (no network database server) you can set up
 your database to trust local connections.

 This way, the database won't ask for a password if you're connecting from your
 local workstation while no password is written anywhere. You even can do
 with no database password at all.

 This can be done by editing the database access configuration file
 `pg_hba.conf <http://www.postgresql.org/docs/devel/static/auth-pg-hba-conf.html>`_
 and set the auth-options from ``md5`` to ``trust``. A database service reload
 is required to activate changes.

