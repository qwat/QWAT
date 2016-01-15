

from PyQt4.QtCore import QSettings
from PyQt4.QtGui import QDialog
from qgis.core import QgsMapLayerRegistry, QgsFeature, QgsFeatureRequest
from qgis.gui import QgisInterface
from python.pipe_geom_alt_dialog import Ui_PipeGeomAltDialog



class PipeGeomAltDialog(QDialog, Ui_PipeGeomAltDialog):
	def __init__(self):
		QDialog.__init__(self)
		self.setupUi(self)


def connectPipeGeomModified():
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer("conduites_copy20130709141244955")
	pipeLayer.editingStarted.connect(editingStarted)
	

def editingStarted():
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer("conduites_copy20130709141244955")
	editBuffer = pipeLayer.editBuffer()
	editBuffer.geometryChanged.connect(pipeGeomModified)


def pipeGeomModified(featureId, geom):
	pipeLayer = QgsMapLayerRegistry.instance().mapLayer("conduites_copy20130709141244955")
	
	f = QgsFeature()
	if pipeLayer.getFeatures(QgsFeatureRequest().setFilterFid(featureId)).nextFeature(f) is False:
		return
		
	if f.attribute("update_geometry_alt1") in ('t','f') and f.attribute("update_geometry_alt2") in ('t','f'):
		print "qwat: already asked if alternative geometries should be updated"
		return
	
	_geometry_alt1_used = f.attribute("_geometry_alt1_used") == 't'
	_geometry_alt2_used = f.attribute("_geometry_alt2_used") == 't'
		
	if _geometry_alt1_used and f.attribute("update_geometry_alt1").isNull() or _geometry_alt2_used and f.attribute("update_geometry_alt2").isNull():
		dlg = PipeGeomAltDialog()
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
			
		editBuffer = pipeLayer.editBuffer()
		editBuffer.changeAttributeValue( featureId, pipeLayer.fieldNameIndex("update_geometry_alt1"), "t" if dlg.updateAlt1.isChecked() else "f" )
		editBuffer.changeAttributeValue( featureId, pipeLayer.fieldNameIndex("update_geometry_alt2"), "t" if dlg.updateAlt2.isChecked() else "f" )

