"""
Triangulation QGIS plugin
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
from pipesearch import pipeSearch
from connectlayers import connectLayers
from itembrowser import itemBrowser

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
		self.connectLayers = connectLayers(iface)

	def initGui(self):
		# CONNECTLAYERS
		self.ConnectLayerAction = QAction(QIcon(":/plugins/qWat/icons/connect.png"), "connect layers", self.iface.mainWindow())
		# connect the action to the run method
		QObject.connect(self.ConnectLayerAction, SIGNAL("triggered()"), connectLayers.exec_())
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
		self.itembrowser.unload()
		
	def ConnectLayersDlg(self):
		# create and show the dialog
		layerlist = self.iface.mapCanvas().layers()
		dlg = ConnectLayers(layerlist)
		if dlg.exec_():
			# TODO: check layers before starting connection! 
			pipelayer = layerlist[dlg.pipesCombo.currentIndex()]
			if pipelayer.type() != QgsMapLayer.VectorLayer or pipelayer.geometryType() != 1 and pipelayer.dataProvider().fieldNameIndex('id_parent') == -1:
				self.pipelayer = 0;
				QMessageBox.warning( dlg , "qWat", QApplication.translate("Connect layers", "The pipe layer has not a valid structure! Check again!", None, QApplication.UnicodeUTF8) )
				return
			else:
				self.itembrowser = ItemBrowser( self.iface , pipelayer , QApplication.translate("Browser", "qWat :: Pipes", "Window title", QApplication.UnicodeUTF8) )
				QObject.connect(pipelayer , SIGNAL("layerDeleted ()")    , self.disconnectPipeLayer )
				self.pipelayer = pipelayer
				print "qWat: connecting SIGNAL for pipes (layer: %s)" % pipelayer.name()

	def PipeSearchDlg(self):
		dlg = PipeSearch(self.pipelayer, self.iface )
		if self.pipelayer == 0:
			QMessageBox.warning( dlg , "qWat", QApplication.translate("PipeSearch", "Pipes layer is not connected.", None, QApplication.UnicodeUTF8) )
			dlg.close()
			return
		# create and show the dialog
		dlg.exec_()

				
			
		
			
	
		
		

