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
    return "qWAT"
def description():
    return "Water networkmodule"
def version():
    return "Version 0.1"
def icon():
    return "icon.png"
def qgisMinimumVersion():
    return "1.0"
def classFactory(iface):
    # load Sige class from file Sige
    from qwat import qWat
    return qWat(iface)
    
"""  
pyrcc4 -o /home/denis/Documents/qWat/qWat/resources.py /home/denis/Documents/qWat/qWat/resources.qrc
  
pyuic4 -o /home/denis/Documents/qWat/qWat/ui_ItemBrowser.py /home/denis/Documents/qWat/qWat/ui_ItemBrowser.ui 
pyuic4 -o /home/denis/Documents/qWat/qWat/ui_PipeSearch.py /home/denis/Documents/qWat/qWat/ui_PipeSearch.ui 
pyuic4 -o /home/denis/Documents/qWat/qWat/ui_ConnectLayers.py /home/denis/Documents/qWat/qWat/ui_ConnectLayers.ui 

pylupdate4             /home/denis/Documents/qWat/qWat/*.py /home/denis/Documents/qWat/qWat/*.ui -ts qWat_fr.ts
pylupdate4 -noobsolete /home/denis/Documents/qWat/qWat/*.py /home/denis/Documents/qWat/qWat/*.ui -ts qWat_fr.ts

lrelease /home/denis/Documents/qWat/qWat/qWat_fr.ts -qm /home/denis/Documents/qWat/qWat/qWat.qm

rm /home/denis/.qgis/python/plugins/qWat/*; cp /home/denis/Documents/qWat/qWat/* /home/denis/.qgis/python/plugins/qWat/; qgis /home/denis/Documents/qWat/project/distribution_v19.qgs &
"""




