"""
This action code should be added to the pipe layer in the QGIS project
"""

from PyQt5.QtGui import QColor
from PyQt5.QtCore import QVariant
from qgis.utils import iface
from PyQt5 import uic
from qgis.PyQt.QtGui import *
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtWidgets import *

GROUP_NAME = "Incident réseau"
LAYER_RESULAT_NAME = "Vannes à fermer"

VALVE_SOURCE_NAME = '"qwat_od"."valve"'

class SearchOpenedValvesDialog(QDialog):
    def __init__(self, parent, pipe_id, x, y):
        super(SearchOpenedValvesDialog, self).__init__(parent)
        self.pipe_id = pipe_id
        self.setWindowTitle("Incident sur le réseau")
        self.point = QgsGeometry()
        self.startFeature = None
        self.endFeature = None
        self.x = x
        self.y = y

        # Get CRS from settings table
        query = "(select id, value from qwat_sys.settings)"
        source = """{} key='id' table="({})" ()""".format("service=qwat", query)
        crsLayer = QgsVectorLayer(source, "temporary", "postgres")
        if crsLayer.isValid():
            for feature in crsLayer.getFeatures():
                self.crs = feature["value"]
                break

        self.layout = QGridLayout()
        self.layout.setContentsMargins(10, 10, 10, 10)

        self.kmLabel = QLabel("Km max. : ")
        self.layout.addWidget(self.kmLabel, 0, 0)
        self.kmSpinBox = QDoubleSpinBox()
        self.kmSpinBox.setDecimals(2)
        self.kmSpinBox.setMinimum(0.1)        
        self.kmSpinBox.setMaximum(50)
        self.kmSpinBox.setValue(1)
        self.layout.addWidget(self.kmSpinBox, 1, 0)

        self.checkNetworkValves = QCheckBox("S'arrêter uniquement aux vannes réseaux")
        self.checkNetworkValves.setChecked(True)
        self.layout.addWidget(self.checkNetworkValves, 2, 0)

        buttons = QDialogButtonBox.Ok | QDialogButtonBox.Cancel
        self.buttonBox = QDialogButtonBox(buttons)
        self.buttonBox.button(QDialogButtonBox.Ok).clicked.connect(self.searchOpenedValves)
        self.buttonBox.rejected.connect(self.reject)
        self.layout.addWidget(self.buttonBox, 3, 0)

        self.setLayout(self.layout)

    def showEvent(self, event):
        self.setupLayers()

    def setupLayers(self):
        layers = QgsProject.instance().mapLayers()
        valve_layername = None
        for layer_id, layer in layers.items():
            if layer.dataProvider().uri().quotedTablename() == VALVE_SOURCE_NAME:
                valve_layername = layer.name()
                break
        if (valve_layername is None):
            QgsMessageLog.logMessage("Valve layer does not exist in QGIS project !", 'Messages', Qgis.Critical)
            iface.messageBar().pushMessage("Error", "Valve layer does not exist in QGIS project !", level=Qgis.Critical)            
            QTimer.singleShot(0, self.reject)
            return
        self.valve_layer = QgsProject.instance().mapLayersByName(valve_layername)[0]

    def searchOpenedValves(self):
        km = self.kmSpinBox.value()
        stopOnNetworkValves = str(self.checkNetworkValves.isChecked())

        # Check if the result layer already exists
        self.cleanResults()

        # Set query for a temporary layer which will retreive the data only one time
        query = """(select * from qwat_network.ft_search_opened_valves({pipe_id},{x},{y},{km},{stopOnNetworkValves}))""".format(pipe_id=str(self.pipe_id), x=str(self.x), y=str(self.y), km=str(km), stopOnNetworkValves=str(stopOnNetworkValves))

        # Set connection to database
        source = """{} key='id' table="{}" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, LAYER_RESULAT_NAME, "memory")

            # Copy feature from temporary layer to final one (memory)
            attr = tmpLayer.dataProvider().fields().toList()
            features = []
            for feature in tmpLayer.getFeatures():
                features.append(feature)

            layer.startEditing()
            dataP = layer.dataProvider()
            dataP.addAttributes(attr)
            layer.updateFields()
            dataP.addFeatures(features)
            layer.commitChanges()

            layer.renderer().symbol().setSize(10)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            map_layer = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(map_layer)
        self.close()

    def cleanResults(self):
        root = QgsProject.instance().layerTreeRoot()
        self.group = root.findGroup(GROUP_NAME)
        if self.group:
            self.group.removeAllChildren()
        else:
            self.group = root.insertGroup(0, GROUP_NAME)


sp = SearchOpenedValvesDialog(iface.mainWindow(), [% "ID" %], [% @click_x %], [% @click_y %])
sp.show()
