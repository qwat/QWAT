"""
Denis Rouzaud
denis.rouzaud@gmail.com
Jan. 2012

qWat - qgis water module
"""

# Import the PyQt and QGIS libraries
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *

# Import the code for the dialog
from pipemerger import pipeMerger
from pipesearch import pipeSearch
from connectlayers import connectLayers


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
	
	def initGui(self):
		self.connectLayersDlg = connectLayers(self.iface)
		# run connection when new layers are loaded
		QObject.connect(self.iface.mapCanvas() , SIGNAL("layersChanged ()") , self.connect ) 
		
		# CONNECTLAYERS
		self.connectLayerAction = QAction(QIcon(":/plugins/qWat/icons/connect.png"), "connect layers", self.iface.mainWindow())
		# connect the action to the run method
		QObject.connect(self.connectLayerAction, SIGNAL("triggered()"), self.connectLayersDlg.exec_)
		QObject.connect(self.connectLayersDlg,   SIGNAL("accepted()"),  self.connect)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.connectLayerAction)
		self.iface.addPluginToMenu("&qWat", self.connectLayerAction)
		
		# PIPESEARCH
		self.pipeSearchAction = QAction(QIcon(":/plugins/qWat/icons/search.png"), "pipe search", self.iface.mainWindow())
		QObject.connect(self.pipeSearchAction, SIGNAL("triggered()"), self.PipeSearchDlg)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.pipeSearchAction)
		self.iface.addPluginToMenu("&qWat", self.pipeSearchAction)
				
	def unload(self):
		self.iface.removePluginMenu("&qWat",self.connectLayerAction)
		self.iface.removePluginMenu("&qWat",self.pipeSearchAction)
		self.iface.removeToolBarIcon(self.connectLayerAction)
		self.iface.removeToolBarIcon(self.pipeSearchAction)	
		
	def connect(self):
		self.pipelayer = next( ( layer for layer in self.iface.mapCanvas().layers() if layer.id() == QgsProject.instance().readEntry("qWat", "pipes_layer", "")[0] ), False )
		if self.pipelayer is not False:
			self.pipeMerger = pipeMerger(self.iface,self.pipelayer)
			QObject.connect( self.pipelayer , SIGNAL("browserCurrentItem(int)") , self.pipeMerger.itemChanged )
			QObject.connect( self.pipelayer , SIGNAL("browserNoItem()")         , self.pipeMerger.clear )
			QObject.connect( self.pipelayer , SIGNAL("layerDeleted()")          , self.pipeMerger.unload )
		
	def PipeSearchDlg(self):
		layer = next( ( layer for layer in self.iface.mapCanvas().layers() if layer.id() == QgsProject.instance().readEntry("qWat", "pipes_layer", "")[0] ), False )
		if layer is False: 
			QMessageBox.warning( dlg , "qWat", QApplication.translate("PipeSearch", "Pipes layer is not connected.", None, QApplication.UnicodeUTF8) )
			return
		dlg = pipeSearch(layer, self.iface )
		dlg.exec_()
