"""
/***************************************************************************
 qWat
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
# Import the PyQt and QGIS libraries
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *

# Import the code for the dialog
from pipeedit import PipeEdit
from pipesearch import PipeSearch
from connectlayers import ConnectLayers
from layerconnected import LayerConnected

# Initialize Qt resources from file resources.py
import resources

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s


class qWat ():

	def __init__(self, iface):
		# Save reference to the QGIS interface
		self.iface = iface
		self.pipelayer = 0

	def initGui(self):
		# CONNECTLAYERS
		self.ConnectLayerAction = QAction(QIcon(":/plugins/qWat/icons/connect.png"), "connect layers", self.iface.mainWindow())
		# connect the action to the run method
		QObject.connect(self.ConnectLayerAction, SIGNAL("triggered()"), self.ConnectLayersDlg)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.ConnectLayerAction)
		self.iface.addPluginToMenu("&qWat", self.ConnectLayerAction)
		
		# PIPESEARCH
		self.PipeSearchAction = QAction(QIcon(":/plugins/qWat/icons/search.png"), "pipe search", self.iface.mainWindow())
		QObject.connect(self.PipeSearchAction, SIGNAL("triggered()"), self.PipeSearchDlg)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.PipeSearchAction)
		self.iface.addPluginToMenu("&qWat", self.PipeSearchAction)
				
		
	def unload(self):
		print "TODO: qWat unload"
		# TODO
		# Remove the plugin menu item and icon
		#self.iface.removePluginMenu("&SIGE",self.PipeSearchAction)
		#self.iface.removeToolBarIcon(self.PipeSearchAction)
		
	def disconnectPipeLayer(self):
		self.pipelayer = 0
		self.PipeEditDock.unload()
		
	def ConnectLayersDlg(self):
		# create and show the dialog
		layerlist = self.iface.mapCanvas().layers()
		dlg = ConnectLayers(layerlist)
		if dlg.exec_():
			# TODO: check layers before starting connection! 
			pipelayer = layerlist[dlg.pipesCombo.currentIndex()]
			if pipelayer.type() != QgsMapLayer.VectorLayer or pipelayer.geometryType() != 1 and pipelayer.dataProvider().fieldNameIndex('id_parent') == -1:
				self.pipelayer = 0;
				QMessageBox.warning( dlg , "qWat", "The pipe layer has not a valid structure! Check again!" )
				return
			else:
				self.PipeEditDock = PipeEdit(self.iface,pipelayer)
				QObject.connect(pipelayer , SIGNAL("layerDeleted ()")    , self.disconnectPipeLayer )
				self.pipelayer = pipelayer
				print "qWat: connecting SIGNAL for pipes (layer: %s)" % pipelayer.name()

	def PipeSearchDlg(self):
		dlg = PipeSearch(self.pipelayer, self.iface )
		if self.pipelayer == 0:
			QMessageBox.warning( dlg , "qWat", QApplication.translate("PipSearch", "Connect pipe layer first.", None, QApplication.UnicodeUTF8) )
			dlg.close()
			return
		# create and show the dialog
		dlg.exec_()

				
			
		
			
	
		
		

