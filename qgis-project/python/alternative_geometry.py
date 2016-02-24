
from PyQt4.QtCore import QSettings
from PyQt4.QtGui import QDialog
from qgis.core import QgsMapLayerRegistry, QgsFeature, QgsFeatureRequest
from qgis.gui import QgisInterface
from python.ui_alternative_geometry_dialog import Ui_AltGeomDialog

pipeLayerId = "conduites_copy20130709141244955"
valveLayerId = "valve20130304110011497"
installLayerId = "vw_node_installation20150918153835436"
remoteLayerId = "od_remote20150116100522170"


# PIPE
def pipeConnectGeomModified():
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer(pipeLayerId)
	pipeLayer.editingStarted.connect(pipeEditingStarted)
	
def pipeEditingStarted():
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer(pipeLayerId)
	editBuffer = pipeLayer.editBuffer()
	editBuffer.geometryChanged.connect(pipeGeomModified)

def pipeGeomModified(featureId, geom):
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer(pipeLayerId)
	geomModified(pipeLayer, featureId)
	
# VALVES	
def valveConnectGeomModified():
	valveLayer = QgsMapLayerRegistry.instance().mapLayer(valveLayerId)
	valveLayer.editingStarted.connect(valveEditingStarted)
	
def valveEditingStarted():
	valveLayer = QgsMapLayerRegistry.instance().mapLayer(valveLayerId)
	editBuffer = valveLayer.editBuffer()
	editBuffer.geometryChanged.connect(valveGeomModified)

def valveGeomModified(featureId, geom):
	valveLayer = QgsMapLayerRegistry.instance().mapLayer(valveLayerId)
	geomModified(valveLayer, featureId)	
	
# INSTALLATIONS	
def installConnectGeomModified():
	installLayer = QgsMapLayerRegistry.instance().mapLayer(installLayerId)
	installLayer.editingStarted.connect(installEditingStarted)
	
def installEditingStarted():
	installLayer = QgsMapLayerRegistry.instance().mapLayer(installLayerId)
	editBuffer = installLayer.editBuffer()
	editBuffer.geometryChanged.connect(installGeomModified)

def installGeomModified(featureId, geom):
	installLayer = QgsMapLayerRegistry.instance().mapLayer(installLayerId)
	geomModified(installLayer, featureId)	
	
# REMOTE	
def remoteConnectGeomModified():
	remoteLayer = QgsMapLayerRegistry.instance().mapLayer(remoteLayerId)
	remoteLayer.editingStarted.connect(remoteEditingStarted)
	
def remoteEditingStarted():
	remoteLayer = QgsMapLayerRegistry.instance().mapLayer(remoteLayerId)
	editBuffer = remoteLayer.editBuffer()
	editBuffer.geometryChanged.connect(remoteGeomModified)

def remoteGeomModified(featureId, geom):
	remoteLayer = QgsMapLayerRegistry.instance().mapLayer(remoteLayerId)
	geomModified(remoteLayer, featureId)	
	

# DIALOG
class AltGeomDialog(QDialog, Ui_AltGeomDialog):
	def __init__(self):
		QDialog.__init__(self)
		self.setupUi(self)
	
	
# GENERIC FUNCTION TO ASK USER IF CHANGES ON MAIN GEOMETRY SHOULD BE FORWARDED TO ALTERNATIVE GEOMETRY	
def geomModified(layer, featureId):
	
	f = QgsFeature()
	if layer.getFeatures(QgsFeatureRequest().setFilterFid(featureId)).nextFeature(f) is False:
		return
		
	if f.attribute("update_geometry_alt1") in ('t','f') and f.attribute("update_geometry_alt2") in ('t','f'):
		print "qwat: already asked if alternative geometries should be updated"
		return
	
	_geometry_alt1_used = f.attribute("_geometry_alt1_used") == 't'
	_geometry_alt2_used = f.attribute("_geometry_alt2_used") == 't'
		
	if _geometry_alt1_used and f.attribute("update_geometry_alt1").isNull() or _geometry_alt2_used and f.attribute("update_geometry_alt2").isNull():
		dlg = AltGeomDialog()
		if f.attribute("update_geometry_alt1").isNull():
			dlg.updateAlt1.setChecked( False if _geometry_alt1_used else True )
		else:
			dlg.updateAlt1.setChecked( True if f.attribute("update_geometry_alt1") == 't' else False )
			
		if f.attribute("update_geometry_alt2").isNull():
			dlg.updateAlt2.setChecked( False if _geometry_alt2_used else True )
		else:
			dlg.updateAlt2.setChecked( True if f.attribute("update_geometry_alt2") == 't' else False )
			
		while not dlg.exec_():
			continue
			
		editBuffer = layer.editBuffer()
		editBuffer.changeAttributeValue( featureId, layer.fieldNameIndex("update_geometry_alt1"), "t" if dlg.updateAlt1.isChecked() else "f" )
		editBuffer.changeAttributeValue( featureId, layer.fieldNameIndex("update_geometry_alt2"), "t" if dlg.updateAlt2.isChecked() else "f" )

