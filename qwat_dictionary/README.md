**Qwat Dictionary** is a [QGIS](http://www.qgis.org) plugin that is used to translate the forms of the qWat project.

Thus, the labels, title etc. of the forms are translated to your liking.

.. note::

 It is a complement for the translated values in the database

It currently has French, Romanian and English (the English part has few strings untranslated).

See demo on [youtube](https://www.youtube.com/watch?v=XLa5o2u9kvs)

To install it, just copy the ``qwat_dictionary`` directory to the qgis plugins dir
(``~/.qgis2/python/plugins``) then you can follow the demo.

New changes in the forms, new forms or new languages can be easily added.

If the qwat forms change, first step is to copy the ui files (forms) to ``qwat_dictionary/i18n/develop``.
Then simply run the ``00_make_ts.sh`` script which will complete the ts files
that can be easily translated using QT linguist tool.

Afterwards, run the ``00_make_ts.sh`` script that will transform the **ts** files
into **qm** files.

If you have a new form, be sure to copy it to the ``develop`` directory,
add it's name into the ``proiect.pro`` file and then follow the usual steps.

If you want to translate into german let's say, just edit the ``proiect.pro``
file, and add ``extradictionary_de.ts`` at the bottom. Of course, also add a ``\``
to the line before.

Then, run the create ts script and follow the usual workflow.

Afterwards, run the ``00_make_ts.sh`` script that will transform the **ts** files
into **qm** files.

That's about it.
