"""
Triangulation QGIS plugin
Denis Rouzaud
denis.rouzaud@gmail.com
Jan. 2012

qWat - qgis water module
"""

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from ui_connectLayers import Ui_connectLayers

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

# create the dialog to connect layers
class connectLayers(QDialog, Ui_connectLayers ):
	def __init__(self,iface):
		self.iface = iface
		QDialog.__init__(self)
		# Set up the user interface from Designer.
		self.setupUi(self)
			
			
	def showEvent(self, e):
		proj = QgsProject.instance()
		combos       = [                    self.pipesCombo                             , self.valvesCombo           ]
		currentValue = [proj.readEntry("qWat", "pipes_layer", "")[0] , proj.readEntry("qWat", "valves_layer", "")[0] ]
		
		for combo in combos:
			combo.reset()
			combo.addItem(_fromUtf8(""))
			l = 0
			for layer in self.iface.mapCanvas().layers():
				combo.addItem(_fromUtf8(""))
				combo.setItemText(l, layer.name())
				if layer.id() == 
				l+=1
