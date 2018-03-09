Demo data and project
=====================

QWAT can be tested by downloading the QGS project repository `here <https://github.com/qwat/QWAT>`_ and restoring the latest `data_and_structure_sample.backup <https://github.com/qwat/qwat-data-model/releases/latest>`_ in PostgreSQL (+ extension PostGIS and hstore).

On the download page you can find theses backups:

- `qwat_vX.X.X_data_and_structure_sample.backup`: Restore a full demo with dataset sample

- `qwat_vX.X.X_structure_only.backup`:  Restore only the structure of QWAT (you need at least demo or custom value_list)

- `qwat_vX.X.X_value_list_data_only.backup`: Restore the value list of QWAT demo project

- `qwat_vX.X.X_data_only_sample.backup`: Restore the dataset sample (must have run init_qwat or restore the structure of QWAT) 


More detailed instructions:

How to install the data sample from the QWAT Water distribution management project.

.. note::

 The install guide mainly presents how to restore the data sample from **GNU/Linux**.
 There are some suggestions on how to do it under **Windows** but if you feel you're in too deep
 you may checkout the next chapter and download the Demo VM.


Create the QWAT database model with roles and restore the latest version:

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
  
You now have the latest data model (with sample data) + database roles.

**Create the QWAT service in the .pg_service.conf file**

If you already have the service defined you can skip this step, else edit the ``.pg_service.conf`` file and make it look like:

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

    [qwat_prod]
    #enter your database ip
    host=127.0.0.1
    #database name
    dbname=qwat
    port=5432
    user=postgres
    #you can also add your password if you like
    password=YourPassword

**Open the qgis project**

You can open the **qwat.qgs** project from the qwat-data-sample directory and you should see this screen:

.. image:: img/qgis.png

.. note::

 You can also try out the latest **qwat.qgs** project from the QWAT directory. Keep in mind that there there's a chance
 that it doesn't fit the sample data model. This is because the sample data model may be a little older than the latest
 data model and only the corresponding **.qgs** project has been matched.
