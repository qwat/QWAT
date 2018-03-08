Upgrade database
================

Create a new upgrade delta
--------------------------

* First create a new branch for your modification on the model
* Modify the SQL creation code at your convenience
* Create the corresponding SQL delta file in *data-model/update/delta*.
  * file must be named : delta_{tag_number}_{increment}_{short description}.sql `see Release cycles and versioning. <qwat_dev.html#release-cycles-and-versioning>`_
* Push your branch, and check travis result
* If travis test is OK, then you can create a pull request to merge your modifications in master

.. note:: Data model should be TAGGED. Tag should respect the following syntax like this: x.x.x. For each major version, the tag MUST be called x.0.0.


Migrate an existing database
----------------------------

If you use an old version of QWAT model, you can upgrade it by following the instructions bellow:

.. warning:: You should always save you current database before upgrading

* Open a terminal, and move to *qwat_project/data-model/update*
* Launch upgrade command: ``./upgrade_db.sh``
    * This will test the migration process
* If the migration process is OK, then launch again the command with the parameter to upgrade the real DB : ``./upgrade_db.sh --upgrade yes``

.. note:: Your *.pg_service.conf* must contain connexions to qwat, qwat_test and qwat_conform DB

The way it works
----------------

We've got a tag for version x.0

In */update/delta/ directory*, we find the SQL files list which contain the current evolutions (delta).
If we execute *init_qwat.sh* in the current git repository, we should have the same DB than if we execute *init_qwat.sh* of the x.0 version.
The contributor who add a new delta SQL file must also update the DB creation SQL script.

For a user, the migration process consists in :

* Get the version of his base (should be given in QWAT the system schema).
* Execute the migration script, which take in parameter that version number. The script execute the following tasks :
    - pg_dump of the QWAT DB
    - pg_restore of the previous dump in a test DB (*qwat_test*)
    - Execute on test DB all SQL delta above or equals to the version number (sql deltas must be named *delta_{tag_number}_{increment}_{short description}.sql*)
    - Execute conformity test script:
        - Create a new DB: *qwat_test_conform*
        - Produce the reference file (result from the DB test sql)
        - Comparison of that reference file with the one produced by the *qwat_test* DB previously created
        - If all is OK, user is invited to launch the migration on his real DB
        - If errors occur, the user has to debug himself or contact the QWAT team


