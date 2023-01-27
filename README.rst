.. image:: 210910-teksi-drink-logos-en-01_96pp.png


TEKSI drinking water module (Project QWAT)
=========================================================

Open source water distribution network module based on QGIS / Postgis

Documentation
-------------

Hosted version here: https://qwat.github.io/docs/

The documentation has its own repository at https://github.com/qwat/docs

Requirements
------------

Server side software components are:

* `PostgreSQL <https://postgresql.org/>`_ (> 10)
* `PostGIS <https://postgis.net/>`_, the spatial extension (> 2.5)
* `Python <https://www.python.org/>`_, for installation and update (> 3.5)
* `PUM <https://github.com/opengisch/pum>`_ for upgrade

Supported and tested versions are PostgreSQL 10 and Postgis 2.5.

The exact required hardware configuration is very dependant on the data sizes.
However, water network data tend not to be huge volumes, and the minimal required configuration is very low.

A comfortable configuration would be the following:

* 4x Core Intel
* >= 8GB RAM
* SSD Storage (40GB+) with Raid capabilities for data redundancy

We recommend using Linux as Operating System when running PostgreSQL, for performance and stability.


Install
-------

Assuming you have installed a postgresql server, there are two ways to set up the QWAT database:
- The first way is to create an empty database with ``init_qwat.sh``.
- The second way is to create a database from the sample dump using ``pg_restore``.

First way. Create an empty database with ``init_qwat.sh``
`````````````````````````````````````````````````````````

Get the repositories. In a shell:

::

    git clone https://github.com/qwat/qwat
    cd qwat

Update data-model submodule:

::

    git submodule update --init --recursive

In order to create the database model you need to create a postgresql database.
Do to this you may execute for example:

::

    psql -U postgres -c 'create database qwat'

You can choose whatever name for the database and whatever user as its owner.
The script that is used to create the database model looks for the
`.pg_service.conf <http://www.postgresql.org/docs/current/static/libpq-pgservice.html>`_ file in the
users home directory or in the directory specified by the
`PGSYSCONFDIR or PGSERVICEFILE <http://www.postgresql.org/docs/current/static/libpq-envars.html>`_ variables.

Assuming you named your database ``qwat``, edit the ``.pg_service.conf`` file and make it look like:

::

    [qwat]
    #enter your database ip
    host=127.0.0.1
    #database name
    dbname=qwat
    port=5432
    user=postgres
    #you can also add your password if you like
    password=YourPassword

Now go to the ``data-model`` directory and run the ``./init_qwat.sh`` script:

::

    cd data-model
    ./init_qwat.sh -p qwat -s 21781 -d -r

The script has the following options:

- ``-p``                     PG service to connect to the database.
- ``-s`` or ``--srid``         PostGIS SRID. Default to 21781 (ch1903)
- ``-d`` or ``--drop-schema``    drop schemas (cascaded) if they exist
- ``-r`` or ``--create-roles`` create roles in the database

Optionally, you can restore a sample dataset. For that you need to download the data sample dump and restore it into the QWAT database:

::

    QWAT_VERSION=`cat system/CURRENT_VERSION.txt`
    wget -q -O qwat_dump.backup "https://github.com/qwat/qwat-data-model/releases/download/$QWAT_VERSION/qwat_v"$QWAT_VERSION"_data_only_sample.backup"
    pg_restore -U postgres --dbname qwat -e --no-owner --verbose --jobs=3 --disable-triggers --port 5432 qwat_dump.backup

Second way. Create a database from the sample dump using ``pg_restore``
```````````````````````````````````````````````````````````````````````
QWAT can be tested by downloading the QGS project repository `here <https://github.com/qwat/QWAT>`_ and restoring the latest `data_and_structure_sample.backup <https://github.com/qwat/qwat-data-model/releases/latest>`_ in PostgreSQL.

In your shell:

::

    # Create the database and the extensions
    psql -U postgres -c 'create database qwat;'
    psql -U postgres -d qwat -c 'create extension postgis;'
    psql -U postgres -d qwat -c 'create extension hstore;'

    # Create the roles for QWAT
    psql -c 'CREATE ROLE qwat_viewer NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
    psql -c 'CREATE ROLE qwat_user NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
    psql -c 'CREATE ROLE qwat_manager NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
    psql -c 'CREATE ROLE qwat_sysadmin NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres

    # And restore it into your QWAT database
    pg_restore -U postgres --dbname qwat -e --no-owner --verbose --jobs=3 --disable-triggers --port 5432 qwat_dump.backup
    

Open the project
----------------

After your model gets created, in QGIS you should be able now to connect to the
database by creating a new connection with ``Name=qwat``, ``Service=qwat``, ``SSL mode=prefer``.

If that works then open the ``qgis-projetct/qwat.qgs`` project in QGIS.


Credits
-------

see `CREDITS <https://github.com/qwat/QWAT/blob/master/CREDITS.rst>`_

License
-------

This work is free software and licenced under the GNU GPL version 2 or any later version.

You can get the `LICENSE here <https://github.com/qwat/QWAT/blob/master/LICENSE>`_ .
