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

**Create the data model and download the sample**

Get the repositories::

 git clone https://github.com/qwat/qWat
 git clone https://github.com/qwat/qwat-data-model
 git clone https://github.com/qwat/qwat-data-sample

.. note::

 If you don't like using git in the command line you can always go to the above links
 and press the **Clone and download** button then the **Download zip** one and extract
 the archives afterwards.
