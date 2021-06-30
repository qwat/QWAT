from PyQt5.QtGui import QColor
from PyQt5.QtCore import QVariant
from qgis.utils import iface
from PyQt5 import uic
from qgis.PyQt.QtGui import *
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtWidgets import *

GROUP_NAME = "Incident réseau"
LAYER_RESULAT_NAME = "Vannes à fermer"

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

        self.layout = QGridLayout()
        self.layout.setContentsMargins(10, 10, 10, 10)

        self.kmLabel = QLabel("Km max. : ")
        self.layout.addWidget(self.kmLabel, 0, 0)
        self.kmSpinBox = QSpinBox()
        self.kmSpinBox.setMinimum(1)
        self.kmSpinBox.setMaximum(50)
        self.kmSpinBox.setValue(20)
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

    def searchOpenedValves(self):
        km = self.kmSpinBox.value()
        stopOnNetworkValves = str(self.checkNetworkValves.isChecked())

        # Check if the result layer already exists
        self.cleanResults()

        # Set query for a temporary layer which will retreive the data only one time
        query = "(select * from qwat_network.ft_search_opened_valves(" + str(self.pipe_id) + "," +  str(self.x) + "," + str(self.y) + "," + str(km) + ", " + stopOnNetworkValves + "))"

        # Set connection to database
        source = """{} key='id' table="{}" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:21781", LAYER_RESULAT_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

            # Copy feature from temporary layer to final one (memory)
            features = []
            for feature in tmpLayer.getFeatures():
                features.append(feature)

            layer.startEditing()
            dataP = layer.dataProvider()
            dataP.addFeatures(features)
            layer.commitChanges()

            layer.renderer().symbol().setSize(10)
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
        
sp = SearchOpenedValvesDialog(iface.mainWindow(), [% "ID" %], [% @click_x %], [% @click_y %])
sp.show()

