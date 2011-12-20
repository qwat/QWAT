"""
/***************************************************************************
 qWat Connect Layers
                                 A QGIS plugin
 Tools
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
"""

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from ui_ConnectLayers import Ui_ConnectLayers

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

# create the dialog to connect layers
class ConnectLayers(QDialog, Ui_ConnectLayers ):
	def __init__(self,layerlist):
		QDialog.__init__(self)
		# Set up the user interface from Designer.
		self.setupUi(self)
		
		l = 0
		for lay in layerlist:
			self.pipesCombo.addItem(_fromUtf8(""))
			self.pipesCombo.setItemText(l, lay.name())
			
			self.valvesCombo.addItem(_fromUtf8(""))
			self.valvesCombo.setItemText(l, lay.name())
			
			l+=1
			
