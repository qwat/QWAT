*****************
Developer's guide
*****************

How to develop QWAT core datamodel.

Local customization are described `here <local_customizations>`_.


Prerequisites
=============


In order to develop for QWAT, the following skills may be required :

* Good general knowledge of GIS
* Good general knowledge of QGIS
* Skills in relational databases and PostgreSQL/PostGIS specifically
* Skills in Python

* TODO : complete

Environment
===========

* You will need to [[install and configure Git and GitHub|qDG_git_github]]
* TODO . Code editor
* ...

QWAT architecture
=================

* Describe here various parts of QWAT
* Describe relation to other projects ( plugins, qgis core)

Roles
=====

* *Commiters* have access to QWAT code repositories and can push to them. It means they control the evolution of the software
* *contributors* can provide information, code, documentation to the project. They do not have direct access for modifications and must go through the *commiters* to get their modifications applied. See the [[Contributors_guide]] for more information and processes.
* The *release manager* is in charge of deciding when a new version of the software is published, and to actually publish the release. Current release manager for QWAT is [Denis Rouzaud](https://github.com/3nids)

Release cycles and versioning
=============================

New releases for QWAT are published on a regular basis, but non-fixed frequency. The *release manager* decides when a new version is published.

Version numbers follow as much as possible the [semantic versioning approach](http://semver.org)

You can find the installed version number in the data model, in the `qwat_sys.versions` table :

* model.core : model version

Release process
===============

The release process for QWAT is the following :

* Issues are triaged with milestones for next versions
* The *release manager* decides when the next release will be made, in accordance with the community needs
* He announces the estimated release date in advance ( at least 1 week)
* Issues are re-triaged and the date can be moved according to how the work progresses
* CHANGES.md is checked to be sure that it contains a description of changes for this version
* When ready (all due tickets closed), the *release manager* add version metadata to the project and tags the project(s) to release (data model, QWAT project) with the new version,
* The *release manager* announces the new version ( mailing lists, IRC, twitter…)

Additional dependencies
======================

QWAT Project has several dependencies on different submodules
* Fetching their content is achieved with a specific git command


Developing the core data model
==============================

To keep a controlled process over versioning, we have the following system :

* The SQL files corresponding to the creation of the core data model
* SQL files corresponding to the modifications from version X to version X+1 ( "diff SQL" )

Diff files are located in the repository in the "upgrade" directory. Their name has this convention :

* `diff_fromversion_toversion.sql` e.g. `diff_v1.0_v1.1.sql`

Deploying a model for a specific version and applying the diff files successively to reach another version should lead to the exact same model as deploying this latter version. The QWAT project will have tools to test for this compliance.

It is advised to write the diff files at the same time as the model modification, but this is not mandatory. Diff files *must* be complete and uptodate when a new model version is released.
Before releasing a new model version, the diff files should therefore be analyzed and completed. Some code can also be refactored to simplify the diff files ( e.g. multiple modification to the same field between two version)

As a consequence, when developing the core data model, you should : 

* Put your modifications to the core model SQL files
* Add your modifications to the correct diff file.

Your pull request should be complete with these elements, or you have to be ready to review the diff SQL files before the release to ensure that the diff are uptodate.

Developing a QGIS project
=========================

* How to modify default project or create a new one
* How to share these modifications

Adding new features to QWAT
===========================

* see contributor's guide for discussion process & issue management
* creating a specific plugin
* contributing to QGIS core
