.. image:: https://raw.githubusercontent.com/qwat/QWAT/master/qwat.png
    :height: 80px

qWat: QGIS Water Module
=======================

INSTALL
-------

In your shell:

::

    git clone https://github.com/qwat/qWat
    cd qWat

If you haven't added your ssh key to github, then you need to tell git
to access the data-model submodule through https.
Edit the ``.gitmodules`` file in the qWat folder and replace the url value
from ``git@github.com:qwat/qwat-data-model.git`` to ``https://github.com/qwat/qwat-data-model.git``

::

    git submodule update --init --recursive

In order to create the database model you need to create a postgresql database.
Do to this you may execute for example:

::

    psql -U postgres -c 'create database qwat'

You can choose whatever name for the database and whatever user as its owner.
The script that is used to create the database model looks for the ``.pg_service.conf`` file.
Assuming you named your database qwat, edit the ``~/.pg_service.conf`` file and make it look like:

::

    # Qwat service name
    [qwat]
    #enter your database ip
    host=192.168.0.1
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

- ``-p``                   PG service to connect to the database.
- ``-s`` or ``--srid``         PostGIS SRID. Default to 21781 (ch1903)
- ``-d`` or ``--drop-schema``  drop schemas (cascaded) if they exist
- ``-r`` or ``--create-roles`` create roles in the database

After your model gets created, in QGIS you should be able now to connect to the
database by creating a new connection with ``Name=qwat``, ``Service=qwat``, ``SSL mode=prefer``.

If that works then open the ``qwat.qgs`` project in QGIS.

Credits
-------

see CREDITS.rst

License
-------

This work is free software and licenced under the GNU GPL version 2 or any later version.
See LICENSE file.
