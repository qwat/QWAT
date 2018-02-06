************
Install QWAT
************

Note that installing QWAT using the initialization script is only required for contributing to the model or extending the model.
If you only need to test a demo, a regular postgreSQL dump is enough. See Demo page for that.

Install guide
-------------

**Create database**

Create a database named **qwat**.

You can do this either by using **pgAdmin** or using the command line, e.g.::

 psql -U postgres -c 'create database qwat;'
 psql -U postgres -d qwat -c 'create extension postgis;'
 psql -U postgres -d qwat -c 'create extension hstore;'


**Create a postgreSQL service file for database authentication**

This file is used by postgreSQL to simplify the connection process. On linux, you will find it in your home directory ~/.pg_service.conf

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

Get the repositories::

 git clone https://github.com/qwat/qWat
 git clone https://github.com/qwat/qwat-data-model
 git clone https://github.com/qwat/qwat-data-sample

.. note::

 If you don't like using git in the command line you can always go to the above links
 and press the **Clone and download** button then the **Download zip** one and extract
 the archives afterwards.
