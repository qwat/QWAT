"""
Triangulation QGIS plugin
Denis Rouzaud
denis.rouzaud@gmail.com
Jan. 2012

qWat - qgis water module
"""

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
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
		self.setupUi(self)
		QObject.connect(self , SIGNAL( "accepted()" ) , self.applySettings)
		self.combos      = [ self.pipesCombo  , self.valvesCombo   ]
		self.settingName = [     "pipes_layer",     "valves_layer" ]
				
	def showEvent(self, e):
		self.proj   = QgsProject.instance()
		self.layers = self.iface.mapCanvas().layers()
	
		for c in range(len(self.combos)):
			combo = self.combos[c]
			combo.clear()
			combo.addItem(_fromUtf8(""))
			l = 1
			for layer in self.layers:
				combo.addItem(_fromUtf8(""))
				combo.setItemText(l, layer.name())
				if layer.id() == self.proj.readEntry("qWat",self.settingName[c],"")[0]:
					combo.setCurrentIndex(l)
				l+=1
				
	def applySettings(self):
		for c in range(len(self.combos)):
			# TODO if pipelayer.type() != QgsMapLayer.VectorLayer or pipelayer.geometryType() != 1 and pipelayer.dataProvider().fieldNameIndex('id_parent') == -1:
			self.proj.writeEntry("qWat", self.settingName[c] , self.layer(c).id() )
		
	def layer(self,c):
		i = self.combos[c].currentIndex()
		if i == 0: return emptyLayer()
		else: return self.layers[i-1]
		
				
class emptyLayer():
	def id(self):
		return ''
				
