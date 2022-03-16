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

GROUP_NAME = "Pollution réseau"
LAYER_RESULAT_NAME = "Conduites touchées"
SUBSCRIBER_LAYER_NAME = "Abonnés"

PIPE_SOURCE_NAME = '"qwat_od"."pipe"'

class SearchPipesDialog(QDialog):
    def __init__(self, parent, pipe_id, x, y):
        super(SearchPipesDialog, self).__init__(parent)
        self.pipe_id = pipe_id
        self.x = x
        self.y = y
        self.setWindowTitle("Pollution sur le réseau")
        self.point = QgsGeometry()
        self.startFeature = None
        self.endFeature = None

        # Get CRS from settings table
        query = "(select id, value from qwat_sys.settings)"
        source = """{} key='id' table="({})" ()""".format("service=qwat", query)
        crsLayer = QgsVectorLayer(source, "temporary", "postgres")
        if crsLayer.isValid():
            for feature in crsLayer.getFeatures():
                self.crs = feature["value"]
                break

        # Store result pipes, sources and targets in lists
        self.resultPipes = []

        self.layout = QGridLayout()
        self.layout.setContentsMargins(10, 10, 10, 10)

        self.kmLabel = QLabel("Km max. : ")
        self.layout.addWidget(self.kmLabel, 0, 0)
        self.kmSpinBox = QSpinBox()
        self.kmSpinBox.setMinimum(1)
        self.kmSpinBox.setMaximum(50)
        self.kmSpinBox.setValue(10)
        self.layout.addWidget(self.kmSpinBox, 1, 0)

        self.stopOnNetworkValves = QCheckBox("S'arrêter aux vannes réseaux")
        self.stopOnNetworkValves.setChecked(False)
        self.layout.addWidget(self.stopOnNetworkValves, 2, 0)

        self.stopOnSubscriberValves = QCheckBox("S'arrêter aux vannes abonnés")
        self.stopOnSubscriberValves.setChecked(True)
        self.layout.addWidget(self.stopOnSubscriberValves, 3, 0)

        self.stopOnCurrentPressureZone = QCheckBox("Limiter à la zone de pression courante")
        self.stopOnCurrentPressureZone.setChecked(True)
        self.layout.addWidget(self.stopOnCurrentPressureZone, 4, 0)

        buttons = QDialogButtonBox.Ok | QDialogButtonBox.Cancel
        self.buttonBox = QDialogButtonBox(buttons)
        self.buttonBox.button(QDialogButtonBox.Ok).clicked.connect(self.searchNetwork)
        self.buttonBox.rejected.connect(self.reject)
        self.layout.addWidget(self.buttonBox, 5, 0)

        self.setLayout(self.layout)

    def showEvent(self, event):
        self.setupLayers()

    def setupLayers(self):
        layers = QgsProject.instance().mapLayers()
        pipe_layername = None
        for layer_id, layer in layers.items():
            if layer.dataProvider().uri().quotedTablename() == PIPE_SOURCE_NAME:
                pipe_layername = layer.name()
                break
        if (pipe_layername is None):
            QgsMessageLog.logMessage("Pipe layer does not exist in QGIS project !", 'Messages', Qgis.Critical)
            iface.messageBar().pushMessage("Error", "Pipe layer does not exist in QGIS project !", level=Qgis.Critical)            
            QTimer.singleShot(0, self.reject)
            return
        self.pipe_layer = QgsProject.instance().mapLayersByName(pipe_layername)[0]

    def searchNetwork(self):
        # Check if the result layer already exists
        self.cleanResults()

        self.searchPipes()
        self.searchSubscribers()

    def searchPipes(self):
        km = self.kmSpinBox.value()
        stopOnNetworkValves = self.stopOnNetworkValves.isChecked()
        stopOnSubscriberValves = self.stopOnSubscriberValves.isChecked()
        stopOnCurrentPressureZone = self.stopOnCurrentPressureZone.isChecked()

        # Set query for a temporary layer which will retreive the data only one time
        query = """(select * from qwat_network.ft_search_network_and_subscribers({pipe_id},{x},{y},{km},{stopOnNetworkValves},{stopOnSubscriberValves},{stopOnCurrentPressureZone}))""".format(pipe_id=str(self.pipe_id), x=str(self.x), y=str(self.y), km=str(km), stopOnNetworkValves=str(stopOnNetworkValves), stopOnSubscriberValves=str(stopOnSubscriberValves), stopOnCurrentPressureZone=str(stopOnCurrentPressureZone))

        # Set connection to database
        source = """{} key='id' table="{}" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():

            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("LineString?crs=epsg:" + self.crs, LAYER_RESULAT_NAME, "memory")

            # Copy feature from temporary layer to final one (memory)
            attr = tmpLayer.dataProvider().fields().toList()
            features = []
            for feature in tmpLayer.getFeatures():
                self.resultPipes.append(feature['id'])
                features.append(feature)

            layer.startEditing()
            dataP = layer.dataProvider()
            dataP.addAttributes(attr)
            layer.updateFields()
            dataP.addFeatures(features)
            layer.commitChanges()

            layer.renderer().symbol().setWidth(5)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            map_layer = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(map_layer)
        self.close()

    def searchSubscribers(self):
        QgsMessageLog.logMessage("Recherche des abonnés", 'Messages', Qgis.Info)
        # Set query
        query = """
        select * from qwat_od.vw_element_subscriber
        where fk_pipe in (select id from qwat_network.network where network_id in ({pipes}))
        """.format(pipes=', '.join(repr(p) for p in self.resultPipes))
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, SUBSCRIBER_LAYER_NAME, "memory")

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
            layer.renderer().symbol().symbolLayer(0).setShape(QgsSimpleMarkerSymbolLayerBase.Pentagon)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            map_layer = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(map_layer)

    def cleanResults(self):
        root = QgsProject.instance().layerTreeRoot()
        self.group = root.findGroup(GROUP_NAME)
        if self.group:
            self.group.removeAllChildren()
        else:
            self.group = root.insertGroup(0, GROUP_NAME)


sp = SearchPipesDialog(iface.mainWindow(), [% "ID" %], [% @click_x %], [% @click_y %])
sp.show()
