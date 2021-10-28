from PyQt5.QtGui import QColor
from qgis.utils import iface
from qgis.PyQt.QtGui import *
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtWidgets import *

GROUP_NAME = "Coupure de réseau"
PIPE_LAYER_NAME = "Conduites"
HYDRANT_LAYER_NAME = "Bornes hydrantes"
METER_LAYER_NAME = "Compteurs réseau"
SUBSCRIBER_LAYER_NAME = "Abonnés"
SUBSCRIBER_REF_LAYER_NAME = "Renvois d'abonnés"

class selectTool(QgsMapToolIdentifyFeature):
    def __init__(self, iface, layer):
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.layer = layer
        QgsMapToolIdentifyFeature.__init__(self, self.canvas, self.layer)

class NetworkInterruptionDialog(QDialog):
    def __init__(self, parent):
        super().__init__(parent)
        self.setWindowTitle("Coupure de réseau")
        self.valve_layer = QgsProject.instance().mapLayersByName('Vannes')[0]
        self.valvesMapTool = selectTool(iface, self.valve_layer)
        uri = QgsDataSourceUri()
        uri.setConnection("qwat", "", "", "")
        uri.setDataSource("qwat_network", "network", "geometry", "")
        self.network_layer = QgsVectorLayer(uri.uri(), "Network", "postgres")         
        self.pipe_layer = QgsProject.instance().mapLayersByName('Conduites')[0]
        self.pipeMapTool = selectTool(iface, self.network_layer)
       
        self.startPoint = QgsPoint()
        self.pipeFeature = None
        self.valves = []
        self.status = []

        # Store result pipes, sources and targets in lists
        self.resultPipes = []
        self.resultSources = []
        self.resultTargets = []
        # Store result subscribers in list
        self.resultSubscribers = []
        
        self.layout = QGridLayout()
        self.layout.setContentsMargins(10, 10, 10, 10)
        

        self.valvesLabel = QLabel("Sélectionner les vannes à fermer")
        self.valvesText = QTextEdit()
        self.valvesText.setReadOnly(True)
        self.selectValveToolButton = QToolButton()
        self.selectValveToolButton.setText('...')
        self.selectValveToolButton.setToolTip('Sélectionner les vannes...')
        self.selectValveToolButton.setObjectName('SelectValvesButton')
        self.selectValveToolButton.clicked.connect(self.selectValves)
        self.layout.addWidget(self.valvesLabel, 0, 0)
        self.layout.addWidget(self.valvesText, 1, 0)
        self.layout.addWidget(self.selectValveToolButton, 1, 1)

        self.pipeLabel = QLabel("Sélectionner une conduite")
        self.pipeText = QTextEdit()
        self.pipeText.setReadOnly(True)
        self.selectPipeToolButton = QToolButton()
        self.selectPipeToolButton.setText('...')
        self.selectPipeToolButton.setToolTip('Sélectionner une conduite...')
        self.selectPipeToolButton.setObjectName('SelectPipeButton')
        self.selectPipeToolButton.clicked.connect(self.selectPipe)
        self.layout.addWidget(self.pipeLabel, 2, 0)
        self.layout.addWidget(self.pipeText, 3, 0)
        self.layout.addWidget(self.selectPipeToolButton, 3, 1)

        self.kmMaxLabel = QLabel("Km max. : ")
        self.layout.addWidget(self.kmMaxLabel, 4, 0)
        self.kmMaxSpinBox = QSpinBox()
        self.kmMaxSpinBox.setMinimum(1)
        self.kmMaxSpinBox.setMaximum(50)
        self.kmMaxSpinBox.setValue(20)
        self.layout.addWidget(self.kmMaxSpinBox, 4, 1)        
        
        buttons = QDialogButtonBox.Ok | QDialogButtonBox.Cancel
        self.buttonBox = QDialogButtonBox(buttons)
        self.buttonBox.button(QDialogButtonBox.Ok).clicked.connect(self.searchNetwork)
        self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(False)
        self.buttonBox.rejected.connect(self.reject)
        self.layout.addWidget(self.buttonBox)

        self.setLayout(self.layout)

        
    def onValveIdentified(self, feature):
        QgsMessageLog.logMessage("Vanne : " + str(feature.id()) + " sélectionnée", 'Messages', Qgis.Info)
        if feature.id() not in self.valves:
            self.valvesText.append('Vanne : ' + str(feature.id()))
            self.valves.append(feature.id())
            self.status.append(feature['closed'])
        else:
            QgsMessageLog.logMessage("La vanne " + str(feature.id()) + " est déjà sélectionnée.", 'Messages', Qgis.Info)
        if (self.valves and self.pipeFeature):
            self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(True)

    def selectValves(self):
        self.valvesMapTool.featureIdentified.connect(self.onValveIdentified)
        iface.mapCanvas().setMapTool(self.valvesMapTool)
    
    def onPipeIdentified(self, feature):
        QgsMessageLog.logMessage("Conduite : " + str(feature['id']) + " sélectionnée", 'Messages', Qgis.Info)
        self.pipeText.setText('Conduite : ' + str(feature['id']))
        self.pipeFeature = feature

        if (self.valves and self.pipeFeature):
            self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(True)

        iface.mapCanvas().unsetMapTool(self.pipeMapTool)
    
    def selectPipe(self):
        self.pipeMapTool.featureIdentified.connect(self.onPipeIdentified)
        iface.mapCanvas().setMapTool(self.pipeMapTool)
    
    def searchNetwork(self):
        self.resultPipes.clear()
        self.resultSources.clear()
        self.resultTargets.clear()
        self.resultSubscribers.clear()
        if (not self.pipeFeature is None) or (not self.valves):
            root = QgsProject.instance().layerTreeRoot()
            self.group = root.findGroup(GROUP_NAME)
            if self.group:
                self.group.removeAllChildren()
            else:
                self.group = root.insertGroup(0, GROUP_NAME)
            self.searchPipes()
            self.searchHydrants()
            self.searchMeters()
            self.searchSubscribers()
            if self.resultSubscribers: 
                self.searchSubscribersReferences()
        self.close()

    def searchPipes(self):
        QgsMessageLog.logMessage("Recherche des conduites", 'Messages', Qgis.Info)
        networkId = self.pipeFeature['network_id']
        pipeId = self.pipeFeature['id']
        kmMax = self.kmMaxSpinBox.value()
        QgsMessageLog.logMessage("Recherche de chemins depuis la conduite " + str(pipeId), 'Messages', Qgis.Info)
        QgsMessageLog.logMessage("Vannes fermées : " + str(self.valves), 'Messages', Qgis.Info)
        # Set query
        query = "(select * from qwat_network.ft_network_cutoff(array{valves}, {networkId}, {kmmax}))"\
            .format(valves=str(self.valves), networkId=str(networkId), kmmax=str(kmMax))
        # Set connection to database
        source = """{} key='id,source,target' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("LineString?crs=epsg:21781", PIPE_LAYER_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

            # Copy feature from temporary layer to final one (memory)
            attr = tmpLayer.dataProvider().fields().toList()
            features = []
            for feature in tmpLayer.getFeatures():
                self.resultPipes.append(feature['id'])
                self.resultSources.append(feature['source'])
                self.resultTargets.append(feature['target'])
                features.append(feature)

            layer.startEditing()
            dataP = layer.dataProvider()
            dataP.addAttributes(attr)
            layer.updateFields()
            dataP.addFeatures(features)
            layer.commitChanges()

            layer.renderer().symbol().setWidth(3.0)            
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)
    
    def searchHydrants(self):
        QgsMessageLog.logMessage("Recherche des bornes hydrantes", 'Messages', Qgis.Info)
        networkId = self.pipeFeature['network_id']
        kmMax = self.kmMaxSpinBox.value()
        # Set query
        query = """
        with pipes as 
        (
        select * from qwat_network.ft_network_cutoff(array{valves}, {networkId}, {kmmax}) 
        where qwat_network.ft_check_node_is_hydrant(source) 
        or qwat_network.ft_check_node_is_hydrant(target)
        )
        select h.id, h.geometry from qwat_od.vw_element_hydrant h, pipes where h.id in (pipes.target) or h.id  in (pipes.source)
        """.format(valves=str(self.valves), networkId=str(networkId), kmmax=str(kmMax))
        # query = """
        # select h.id, h.geometry 
        # from qwat_od.vw_element_hydrant h
        # where h.id in ({targets}) or h.id  in ({sources})
        # """.format(targets=', '.join(repr(t) for t in self.resultTargets), 
        # sources=', '.join(repr(s) for s in self.resultSources))
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:21781", HYDRANT_LAYER_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

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
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)
    
    def searchMeters(self):
        QgsMessageLog.logMessage("Recherche des compteurs réseau", 'Messages', Qgis.Info)
        # Set query
        query = """
        select m.id, m.geometry 
        from qwat_od.vw_element_meter m
        where m.id in ({pipes})
        """.format(pipes=', '.join(repr(p) for p in self.resultPipes))        
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:21781", METER_LAYER_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

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

            layer.renderer().symbol().setSize(8)
            layer.renderer().symbol().symbolLayer(0).setShape(QgsSimpleMarkerSymbolLayerBase.Square)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)

    def searchSubscribers(self):
        QgsMessageLog.logMessage("Recherche des abonnés", 'Messages', Qgis.Info)
        # Set query
        query = """
        select * from qwat_od.vw_element_subscriber 
        where fk_pipe in ({pipes})
        """.format(pipes=', '.join(repr(p) for p in self.resultPipes))
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:21781", SUBSCRIBER_LAYER_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

            # Copy feature from temporary layer to final one (memory)
            attr = tmpLayer.dataProvider().fields().toList()
            features = []
            for feature in tmpLayer.getFeatures():
                self.resultSubscribers.append(feature['ID'])
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
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)

    def searchSubscribersReferences(self):
        QgsMessageLog.logMessage("Recherche des renvois abonnés", 'Messages', Qgis.Info)
        # Set query
        query = """
        select * from qwat_od.subscriber_reference 
        where fk_subscriber in ({subscribers})
        """.format(subscribers=', '.join(repr(s) for s in self.resultSubscribers))
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:21781", SUBSCRIBER_REF_LAYER_NAME, "memory")
            # TODO récupérer le srid depuis la couche temporaire ? 

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

            layer.renderer().symbol().setSize(8)
            layer.renderer().symbol().symbolLayer(0).setShape(QgsSimpleMarkerSymbolLayerBase.Hexagon)
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)

nc = NetworkInterruptionDialog(iface.mainWindow())#, [% "ID" %]
nc.show()
