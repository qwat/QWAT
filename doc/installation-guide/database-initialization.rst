.. _database-initialization:

Database initialization
=======================

Note that installing QWAT using the initialization script is only required for contributing to the model or extending the model.
If you only need to test a demo or use a production database, a regular postgreSQL dump is enough. See `Demo page <../demo-guide/index.html>`_ for that.

Process
--------

Assuming you have installed a postgresql server. In a shell:

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

.. _restore-demomodel:

Restore demo datamodel
^^^^^^^^^^^^^^^^^^^^^^

Optionally, you can restore a sample dataset. For that you need to `download <https://github.com/qwat/qwat-data-model/releases/latest>`_ the data sample dump and restore it into the QWAT database with pgAdmin or with pg_restore, assuming you have named the download file *qwat_dump.backup*:

::

    pg_restore -U postgres --dbname qwat -e --no-owner --verbose --jobs=3 --disable-triggers --port 5432 qwat_dump.backup

