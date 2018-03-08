QWAT Development Overview
=========================


Prerequisites
-------------


In order to develop for QWAT, the following skills may be required :

* Good general knowledge of GIS
* Good general knowledge of QGIS
* Skills in relational databases and PostgreSQL/PostGIS specifically
* Skills in Python


Environment
-----------

* You will need to `install and configure Git and GitHub <https://help.github.com/articles/set-up-git/>`_
* Have python 3 installed and as your default python. In case it is not, use a `virtual environment <https://docs.python.org/3/library/venv.html>`_
* have a bash shell
* have admin rights to create and drop PostgreSQL databases

QWAT architecture
-----------------

* Describe here various parts of QWAT
* Describe relation to other projects (plugins, qgis core)

Roles
-----

* *Commiters* have access to QWAT code repositories and can push to them. It means they control the evolution of the software
* *contributors* can provide information, code, documentation to the project. They do not have direct access for modifications and must go through the *commiters* to get their modifications applied. See the [[Contributors_guide]] for more information and processes.
* The *release manager* is in charge of deciding when a new version of the software is published, and to actually publish the release. Current release manager is `Régis Haubourg (OSLANDIA)  <https://github.com/haubourg>`_ on behalf of the QWAT's group.

Release cycles and versioning
-----------------------------

New releases for QWAT are published on a regular basis, but non-fixed frequency. The *release manager* decides when a new version is published.

You can find the installed version number in the data model, in the `qwat_sys.info` table.

Version and release management policy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Version numbers follows the `semantic versioning approach <http://semver.org>`_.
* Version Roadmap for new features must be shared on the tracker and with the general committee. Issues must be opened and tagged using labels (1.4 , 1.5).
* Do not create a version for each code change.
* Versions will group different code change and must be discussed with the released manager.
* It is possible to multiple Delta files for one *version-release* Ex: `delta_1.3.2_0001_one_change`, `delta_1.3.2_0002_another_change`
* Each new version will systematically have a release. A release is materialized by a git tag
* travis-CI automatically deploys a release when the tag is pushed AND the tests succeed
* Data administrators must NEVER work on master branch, but use release. The rationale behind that is that the latest version in master branch changes until the release, so it is not a reliable version tag . This means for git user they ahve to fetch remote tags and checkout to the desired release using git checkout tag_number


Release process
---------------

The release process for QWAT is the following :

* Issues are triaged with milestones for next versions
* The *release manager* decides when the next release will be made, in accordance with the community needs
* He announces the estimated release date in advance (at least 1 week)
* Issues are re-triaged and the date can be moved according to how the work progresses
* CHANGES.md is checked to be sure that it contains a description of changes for this version
* When ready (all due tickets closed), the *release manager* add version metadata to the project and tags the project(s) to release (data model, QWAT project) with the new version,
* The *release manager* announces the new version (mailing lists, IRC, twitter…)

Additional dependencies
-----------------------

QWAT Project has several dependencies on different submodules

* Fetching their content is achieved with a specific git command

Versioning your extensions
--------------------------

Before QWAT 1.3.0 data model, version was tracked in the qwat_sys.versions that contributors had to maintain manually.
After that PUM module is taking care of raising and keeping track of versions automatically using core delta file naming convention.
However, we recommend using only one customization SQL script, with no version in its name. You can version it in a separate git or SVN repository, but mixing local and core version might lead to a very complex system.

 

Developing the core data model
------------------------------

To keep a controlled process over versioning, we have the following system :

* The SQL files corresponding to the creation of the core data model
* SQL files corresponding to the modifications from version X to version X+1 ("diff SQL")

Diff files are located in the repository in the "delta" directory. Their name has this convention, which is used by PUM module :

* `delta_1.3.2_0001_one_change.sql`

Deploying a model for a specific version and applying the diff files successively to reach another version should lead to the exact same model as deploying this latter version. The QWAT project will have tools to test for this compliance.

It is advised to write the diff files at the same time as the model modification, but this is not mandatory. Diff files *must* be complete and uptodate when a new model version is released.
Before releasing a new model version, the diff files should therefore be analyzed and completed. Some code can also be refactored to simplify the diff files (e.g. multiple modification to the same field between two version)

Some delta file are simple, like new tables and views. Some are more more complex since they are exposed via views. Most views in QWAT are autogenerated by the meta-project module.
That means that adding user fields (in elements or pipes for instance), will require additional instructions to drop and recreate the views before / after applying you delta file.
PUM allows to add pre and post files, either in python or sql for each update, see delta.1.2.8 for exemples.

As a consequence, when developing the core data model, you should : 

* Put your modifications to the core model SQL files
* Add your modifications to the correct diff file.


Your pull request should be complete with these elements, or you have to be ready to review the diff SQL files before the release to ensure that the diff are uptodate.

Developing a QGIS project
-------------------------

* How to modify default project or create a new one
* How to share these modifications

Adding new features to QWAT
---------------------------

* see contributor's guide for discussion process & issue management
* creating a specific plugin
* contributing to QGIS core
