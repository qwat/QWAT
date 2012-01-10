"""
/***************************************************************************
 qWat - QGIS Water Module
                             -------------------
        begin                : 2011-11-17
        copyright            : (C) 2011 by Denis Rouzaud
        email                : denis.rouzaud@sige.ch
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 This script initializes the plugin, making it known to QGIS.
"""
def name():
    return "intersect"
def description():
    return "CAD tools"
def version():
    return "Version 0.1"
def icon():
    return "icon.png"
def qgisMinimumVersion():
    return "1.7"
def classFactory(iface):
    from intersect import intersect
    return intersect(iface)
    
"""  
pyrcc4 -o ~/Documents/qWat/intersect/resources.py ~/Documents/qWat/intersect/resources.qrc
  
pyuic4 -o ~/Documents/qWat/intersect/ui_ItemBrowser.py   ~/Documents/qWat/intersect/ui_ItemBrowser.ui 
pyuic4 -o ~/Documents/qWat/intersect/ui_PipeSearch.py    ~/Documents/qWat/intersect/ui_PipeSearch.ui 
pyuic4 -o ~/Documents/qWat/intersect/ui_ConnectLayers.py ~/Documents/qWat/intersect/ui_ConnectLayers.ui 

pylupdate4             ~/Documents/qWat/intersect/*.py ~/Documents/qWat/intersect/*.ui -ts qWat_fr.ts
pylupdate4 -noobsolete ~/Documents/qWat/intersect/*.py ~/Documents/qWat/intersect/*.ui -ts qWat_fr.ts

lrelease ~/Documents/qWat/intersect/qWat_fr.ts -qm ~/Documents/qWat/intersect/qWat.qm

rm ~/.qgis/python/plugins/intersect/*; cp ~/Documents/qWat/intersect/* ~/.qgis/python/plugins/intersect/;  ~/opt/builds/bin/qgis ~/Documents/qWat/project/distribution_v19.qgs &
"""




