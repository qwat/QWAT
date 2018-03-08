Contributor's guide
===================

How to contribute to QWAT and collaborate with developers.

This guide is dedicated to anyone willing to contribute to QWAT. From sending a data sample to giving advices on features, or contributing to documentation, you will find useful informations here.

If you want to go further, you can look at `the Developer's Guide <developer_>`_ 

Prerequisites
-------------

You will need a GitHub account. Please create one here : https://github.com/join.

Discussing features
-------------------

Bug reports, feature demand, feature specifications and all collaboration on QWAT takes place first in QWAT issues :

* https://github.com/qwat/QWAT/issues

This is the starting place for all demands. If other modules are impacted (QGIS core, data model, plugins), then additional tickets in respective projects are created.

Read below advices on how to contribute.


I found a bug in QWAT, what do I do ?
`````````````````````````````````````
* If the bug you find is a QGIS issue, please search if it doesn't exist upstream at `https://issues.qgis.org/projects/qgis/issues/ <https://issues.qgis.org/projects/qgis/issues/>`_ and add one if needed
* Create a new issue here : https://github.com/qwat/QWAT/issues. Reference any upstream issue there.
* Be sure to include all relevant information to reproduce the bug : minimal steps to follow, sample data, QGIS version, options used...
* Be clear and concise. Any screencast or screenshot will help a lot.
* Tag your issue as "Bug"
* Keep an eye on the following discussion to give additional informations if needed


I found a bug in the data model, what do I do ?
```````````````````````````````````````````````

* Open a new issue here as well : https://github.com/qwat/QWAT/issues
* If you are 100% sure that it is a data model bug :
    * tag your issue as "Data model"
    * open a new issue here : https://github.com/qwat/qwat-data-model/issues
    * reference this new issue in the QWAT issue originally created
* If unsure, help developers to qualify the bug


I want a new feature in QWAT, what do I do ?
````````````````````````````````````````````

* Open a new issue here : https://github.com/qwat/QWAT/issues
* Describe carefully the feature with details, include images and mockups if needed
* Tag the issue as "Enhancement"
* Consider funding the development

I want to collaborate on feature specs, what do I do ?
``````````````````````````````````````````````````````

* Check the existing issues `here <https://github.com/qwat/QWAT/issues?q=is%3Aissue+is%3Aopen+label%3AEnhancement>`_
* Add comments to the discussion


Data model changes
------------------


I need a change in the data model, what is the process ?
````````````````````````````````````````````````````````

* be sure that the required feature is really a change in the data model itself and not the application
* open an issue on GitHub in the data model project (https://github.com/qwat/qwat-data-model/issues)
* include in your issues a clear and concise explanation of the reasons for the change
* allow some time for others to reply
* participate in the discussion
* do not hesitate to mention concerned people (like @vpicavet for example) to notify them of the discussion
* when the discussion converges, a decision is taken by commiters to go for this modification or not
* `OSLANDIA <http://oslandia.com/en/home-en/>`_, on behalf of the PSC, is the data model release manager and will have final word in case of unclear trend


My change demand has been considered valid. What is next ?
``````````````````````````````````````````````````````````

* Two cases : you can write the change, or you want somedy else to do it.

I can write the patch myself, what do I do ?
````````````````````````````````````````````

* Read the `developer's guide <developer_>`_
* Write the patch
* send a pull request to the qwat-data-model repository
* commiters will review and merge it

Note that a continuous integration tool will automatically run functional tests and conformity tests on your pull request.
Please note that a patch must be done in two parts: the core model files used for initialization, and the delta files used to migrate existing database versions.
A patch must lead to the exactly the same state between initialization and migration process to be valid.


I want someone to write the modifications, what is the process ?
````````````````````````````````````````````````````````````````

* a specification is written as new comment to the issue (by you or someone else)
* impacts on other parts of QWAT are studied, and corresponding issues are opened (on qwat/QWAT project namely)
* a required funding estimation is done
* funding is found
* development takes place
* a PR is created on the qwat-data-model repository
* commiters will review and merge it


I want to add some custom fields/table to the model, how do I do ?
``````````````````````````````````````````````````````````````````

* See `the Developer's Guide <developer_>`_ and `customization guidelines <../developer-guide/local_customizations.html>`_

.. _developer: ../developer-guide/index.html
