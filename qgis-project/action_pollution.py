from PyQt5.QtGui import QColor
from PyQt5.QtCore import QVariant
from qgis.utils import iface
from PyQt5 import uic
from qgis.PyQt.QtGui import *
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtWidgets import *

GROUP_NAME = "Pollution réseau"
LAYER_RESULAT_NAME = "Conduites touchées"

class SearchPipesDialog(QDialog):
    def __init__(self, parent, pipe_id):
        super(SearchPipesDialog, self).__init__(parent)
        self.pipe_id = pipe_id
        self.setWindowTitle("Pollution sur le réseau")
        self.point = QgsGeometry()
        self.startFeature = None
        self.endFeature = None

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
        self.buttonBox.button(QDialogButtonBox.Ok).clicked.connect(self.searchOpenedValves)
        self.buttonBox.rejected.connect(self.reject)
        self.layout.addWidget(self.buttonBox, 5, 0)

        self.setLayout(self.layout)

    def searchOpenedValves(self):
        km = self.kmSpinBox.value()
        stopOnNetworkValves = self.stopOnNetworkValves.isChecked()
        stopOnSubscriberValves = self.stopOnSubscriberValves.isChecked()
        stopOnCurrentPressureZone = self.stopOnCurrentPressureZone.isChecked()

        # Check if the result layer already exists
        self.cleanResults()

        # Set query for a temporary layer which will retreive the data only one time
        query = "(select * from qwat_network.ft_search_network_and_subscribers(" + str(self.pipe_id) + "," + str(km) + "," + str(stopOnNetworkValves) + "," + str(stopOnSubscriberValves) + "," + str(stopOnCurrentPressureZone) + "))"

        # Set connection to database
        source = """{} key='id' table="{}" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        
        if tmpLayer.isValid():
        
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("LineString?crs=epsg:21781", LAYER_RESULAT_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

            # Copy feature from temporary layer to final one (memory)
            features = []
            for feature in tmpLayer.getFeatures():
                features.append(feature)

            layer.startEditing()
            dataP = layer.dataProvider()
            dataP.addFeatures(features)
            layer.commitChanges()

            layer.renderer().symbol().setWidth(5)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)
        self.close()

    def cleanResults(self):
        root = QgsProject.instance().layerTreeRoot()
        self.group = root.findGroup(GROUP_NAME)
        if self.group:
            self.group.removeAllChildren()
        else:
            self.group = root.insertGroup(0, GROUP_NAME)

sp = SearchPipesDialog(iface.mainWindow(), [% "ID" %])
sp.show()

