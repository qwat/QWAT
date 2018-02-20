************
Install QWAT
************

Note that installing QWAT using the initialization script is only required for contributing to the model or extending the model.
If you only need to test a demo, a regular postgreSQL dump is enough. See Demo page for that.

Install guide
-------------

Assuming you have installed a postgresql server.

**Create database**

Create a database named **qwat**.

You can do this either by using **pgAdmin** or using the command line, e.g.::

 psql -U postgres -c 'create database qwat;'
 psql -U postgres -d qwat -c 'create extension postgis;'
 psql -U postgres -d qwat -c 'create extension hstore;'


**Create a postgreSQL service file for database authentication**

This file is used by postgreSQL to simplify the connection process. On unix, you will find it in your home directory `.pg_service.conf <http://www.postgresql.org/docs/current/static/libpq-pgservice.html>`_ file in the users home directory or in the directory specified by the `PGSYSCONFDIR or PGSERVICEFILE <http://www.postgresql.org/docs/current/static/libpq-envars.html>`_ variables.

Add the following sections::

 [qwat]
 #enter your database ip
 host=127.0.0.1
 #database name
 dbname=qwat
 port=5432
 user=postgres
 #you can also add your password if you like
 password=YourPassword"

 [qwat_prod]
 #enter your database ip
 host=127.0.0.1
 #database name
 dbname=qwat
 port=5432
 user=postgres
 #you can also add your password if you like
 password=YourPassword"

Note: since version 1.3, another service definition is necessary to let the postgreSQL Update Manager initialize and migrate database versions.


**Create the data model and download the sample**

Get the repositories

::

    git clone https://github.com/qwat/qWat
    cd qWat

If you haven't added your ssh key to github, then you need to tell git to access the data-model submodule through https.
Edit the ``.gitmodules`` file in the qWat folder and replace the url value from ``git@github.com:qwat/qwat-data-model.git`` to ``https://github.com/qwat/qwat-data-model.git``

::

    git submodule update --init --recursive

Now go to the ``data-model`` directory and run the ``./init_qwat.sh`` script:

::

    cd data-model
    ./init_qwat.sh -p qwat -s 21781 -d -r

The script has the following options:

- ``-p``                   PG service to connect to the database.
- ``-s`` or ``--srid``         PostGIS SRID. Default to 21781 (ch1903)
- ``-d`` or ``--drop-schema``  drop schemas (cascaded) if they exist
- ``-r`` or ``--create-roles`` create roles in the database

You can restore a sample dataset, then download the data sample and insert it into the qwat database:

::

        QWAT_VERSION=`cat system/CURRENT_VERSION.txt`
        # With wget
        wget "https://github.com/qwat/qwat-data-model/releases/download/$QWAT_VERSION/qwat_v"$QWAT_VERSION"_data_only_sample.backup"
        pg_restore -U postgres --dbname qwat -e --no-owner --verbose --jobs=3 --disable-triggers --port 5432 "qwat_v"$QWAT_VERSION"_data_only_sample.backup"

        # or directly with curl
        curl -L "https://github.com/qwat/qwat-data-model/releases/download/$VERSION/qwat_v"$VERSION"_data_only_sample.backup" | pg_restore -U postgres --dbname qwat -e --no-owner --verbose --disable-triggers --port 5432

Instead of running the init script or git, just run :

::

  # Create the database and the extensions
  psql -U postgres -c 'create database qwat;'
  psql -U postgres -d qwat -c 'create extension postgis;'
  psql -U postgres -d qwat -c 'create extension hstore;'

  # Create the roles for qwat
  psql -c 'CREATE ROLE qwat_viewer NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
  psql -c 'CREATE ROLE qwat_user NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
  psql -c 'CREATE ROLE qwat_manager NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres
  psql -c 'CREATE ROLE qwat_sysadmin NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;' -U postgres

  QWAT_VERSION=1.3.1
  wget "https://github.com/qwat/qwat-data-model/releases/download/$QWAT_VERSION/qwat_v"$QWAT_VERSION"_data_and_structure_sample.backup"
  pg_restore -U postgres --dbname qwat -e --no-owner --verbose --jobs=3 --disable-triggers --port 5432 "qwat_v"$QWAT_VERSION"_data_and_structure_sample.backup"
  # or with curl
  curl -L "https://github.com/qwat/qwat-data-model/releases/download/$QWAT_VERSION/qwat_v"$QWAT_VERSION"_data_and_structure_sample.backup" | pg_restore -U postgres --dbname qwat -e --no-owner --verbose --disable-triggers --port 5432

