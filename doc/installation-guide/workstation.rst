Setup workstation
=================

Required Software
-----------------

Install QGIS
~~~~~~~~~~~~

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
* Minimum requirement 2.14

.. note:: 
  We recommend using the latest LTR version: 2.18.
  which often offers a better experience in combination with QWAT.
  For Windows installation, download the `OSGeo4W Installer <http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe>`_

Database configuration
----------------------

To tell a workstation, where the database is (on the local system or on a
network server) you will have to create some files initially on every device on
which you will have QGIS/QWAT running. It is not required to do that on the
server itself.

These instructions depend on your operating system.

Windows pg_service
~~~~~~~~~~~~~~~~~~

Create a new directory where you want to store the configuration in. (E.g. a new folder ``pgconfig`` in your home folder). This directory will be referred to as ``PGSYSCONFDIR`` in this guide.

Set the environment variable ``PGSYSCONFDIR`` to the path to ``PGSYSCONFDIR``.

Inside this folder, there will be two files

* ``pg_service.conf``
* ``pgpass`` (If you do not want to enter the password for the db every time)

.. attention::

 On Windows, you need to save ``pg_service.conf`` in Unix format in order to work.
 One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
 and ``Edit --> EOL Conversion --> UNIX Format --> File save`` .
  
.. _pg_service-unix:

Unix pg_service
~~~~~~~~~~~~~~~

On Unix-like systems (linux/macOS/\*BSD etc.) you may put the files ``.pg_service.conf`` and ``.pgpass`` into your home folder (normally ``/home/[username]``).

All systems
~~~~~~~~~~~

Put the following content in the file ``pg_service.conf`` or ``.pg_service.conf``.
You may have to adapt the variables for your setup.

.. code:: ini

    [qwat]
    host=localhost
    port=5432
    dbname=qwat
    user=qwatuser

To save the password as well on the system you may use the file `pgpass <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_.

.. code:: ini

    localhost:5432:*:qwatuser:password

.. note:: If you don't have the database on your local machine replace any
   occurence of ``localhost`` with the network address of your database
   server.

