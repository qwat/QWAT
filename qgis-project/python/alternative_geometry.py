
from PyQt5.QtCore import QSettings
from PyQt5.QtWidgets import QDialog
from qgis.core import QgsProject, QgsFeature, QgsFeatureRequest, QgsMessageLog, Qgis
from qgis.gui import QgisInterface
from python.ui_alternative_geometry_dialog import Ui_AltGeomDialog

pipeLayerId = "conduites_copy20130709141244955"
valveLayerId = "valve20130304110011497"
installLayerId = "vw_node_installation20150918153835436"
remoteLayerId = "od_remote20150116100522170"


# PIPE
def pipeConnectGeomModified():
    pipeLayer = QgsProject().instance().mapLayer(pipeLayerId)
    pipeLayer.editingStarted.connect(pipeEditingStarted)


def pipeEditingStarted():
    pipeLayer = QgsProject().instance().mapLayer(pipeLayerId)
    editBuffer = pipeLayer.editBuffer()
    editBuffer.geometryChanged.connect(pipeGeomModified)


def pipeGeomModified(featureId, geom):
    pipeLayer = QgsProject().instance().mapLayer(pipeLayerId)
    geomModified(pipeLayer, featureId)

# VALVES


def valveConnectGeomModified():
    valveLayer = QgsProject().instance().mapLayer(valveLayerId)
    valveLayer.editingStarted.connect(valveEditingStarted)


def valveEditingStarted():
    valveLayer = QgsProject().instance().mapLayer(valveLayerId)
    editBuffer = valveLayer.editBuffer()
    editBuffer.geometryChanged.connect(valveGeomModified)


def valveGeomModified(featureId, geom):
    valveLayer = QgsProject().instance().mapLayer(valveLayerId)
    geomModified(valveLayer, featureId)

# INSTALLATIONS


def installConnectGeomModified():
    installLayer = QgsProject().instance().mapLayer(installLayerId)
    installLayer.editingStarted.connect(installEditingStarted)


def installEditingStarted():
    installLayer = QgsProject().instance().mapLayer(installLayerId)
    editBuffer = installLayer.editBuffer()
    editBuffer.geometryChanged.connect(installGeomModified)


def installGeomModified(featureId, geom):
    installLayer = QgsProject().instance().mapLayer(installLayerId)
    geomModified(installLayer, featureId)

# REMOTE


def remoteConnectGeomModified():
    remoteLayer = QgsProject().instance().mapLayer(remoteLayerId)
    remoteLayer.editingStarted.connect(remoteEditingStarted)


def remoteEditingStarted():
    remoteLayer = QgsProject().instance().mapLayer(remoteLayerId)
    editBuffer = remoteLayer.editBuffer()
    editBuffer.geometryChanged.connect(remoteGeomModified)


def remoteGeomModified(featureId, geom):
    remoteLayer = QgsProject().instance().mapLayer(remoteLayerId)
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

    if f.attribute("update_geometry_alt2") in ('t', 'f'):
        QgsMessageLog.logMessage(
            "Already asked if alternative geometries should be updated", "QWAT", Qgis.Info)
        return

    _geometry_alt2_used = f.attribute("_geometry_alt2_used")

    if _geometry_alt2_used and f.attribute("update_geometry_alt2").isNull():
        dlg = AltGeomDialog()
       
        if f.attribute("update_geometry_alt2").isNull():
            dlg.updateAlt2.setChecked(False if _geometry_alt2_used else True)
        else:
            dlg.updateAlt2.setChecked(True if f.attribute(
                "update_geometry_alt2") == 't' else False)

        while not dlg.exec_():
            continue

        editBuffer = layer.editBuffer()
        editBuffer.changeAttributeValue(featureId, layer.fields().indexFromName(
            "update_geometry_alt2"), "t" if dlg.updateAlt2.isChecked() else "f")
