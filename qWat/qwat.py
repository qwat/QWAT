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
		self.connectLayersDlg = connectLayers(iface)

	def initGui(self):
		# CONNECTLAYERS
		self.connectLayerAction = QAction(QIcon(":/plugins/qWat/icons/connect.png"), "connect layers", self.iface.mainWindow())
		# connect the action to the run method
		QObject.connect(self.connectLayerAction, SIGNAL("triggered()"), self.connectLayersDlg.exec_)
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
		print "TODO: qWat unload"
		# TODO
		# Remove the plugin menu item and icon
		#self.iface.removePluginMenu("&qWat",self.pipeSearchAction)
		#self.iface.removeToolBarIcon(self.pipeSearchAction)
		
	def PipeSearchDlg(self):
		dlg = PipeSearch(self.pipelayer, self.iface )
		if self.pipelayer == 0:
			QMessageBox.warning( dlg , "qWat", QApplication.translate("PipeSearch", "Pipes layer is not connected.", None, QApplication.UnicodeUTF8) )
			dlg.close()
			return
		# create and show the dialog
		dlg.exec_()

				
			
		
			
	
		
		

