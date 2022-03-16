from PyQt5.QtGui import QColor
from qgis.utils import iface
from qgis.PyQt.QtGui import *
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtWidgets import *

GROUP_NAME = "Interruption réseau"
PIPE_LAYER_NAME = "Conduites"
HYDRANT_LAYER_NAME = "Bornes hydrantes"
METER_LAYER_NAME = "Compteurs réseau"
SUBSCRIBER_LAYER_NAME = "Abonnés"
SUBSCRIBER_REF_LAYER_NAME = "Renvois d'abonnés"

VALVE_SOURCE_NAME = '"qwat_od"."valve"'
PIPE_SOURCE_NAME = '"qwat_od"."pipe"'

class selectTool(QgsMapToolIdentifyFeature):
    def __init__(self, iface, layer):
        self.iface = iface
        self.canvas = self.iface.mapCanvas()
        self.layer = layer
        QgsMapToolIdentifyFeature.__init__(self, self.canvas, self.layer)

class NetworkInterruptionDialog(QDialog):
    def __init__(self, parent, valve_id):
        super().__init__(parent)
        self.setWindowTitle("Coupure de réseau")       
        uri = QgsDataSourceUri()
        uri.setConnection("qwat", "", "", "")
        uri.setDataSource("qwat_network", "network", "geometry", "")
        self.network_layer = QgsVectorLayer(uri.uri(), "Network", "postgres")

        # Get CRS from settings table
        query = "(select id, value from qwat_sys.settings)"
        source = """{} key='id' table="({})" ()""".format("service=qwat", query)
        crsLayer = QgsVectorLayer(source, "temporary", "postgres")
        if crsLayer.isValid():
            for feature in crsLayer.getFeatures():
                self.crs = feature["value"]
                break

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
        self.valvesList = QListWidget()
        self.valvesList.setSelectionMode(QAbstractItemView.MultiSelection)        
        self.valveVerticalLayout = QVBoxLayout()
        self.selectValveToolButton = QToolButton()
        self.selectValveToolButton.setIcon(QgsApplication.instance().getThemeIcon('symbologyAdd.svg'))
        self.selectValveToolButton.setFixedSize(25, 25)
        self.selectValveToolButton.setToolTip('Sélectionner une vanne...')
        self.selectValveToolButton.setObjectName('SelectValvesButton')
        self.selectValveToolButton.clicked.connect(self.selectValves)
        self.removeValveToolButton = QToolButton()
        self.removeValveToolButton.setIcon(QgsApplication.instance().getThemeIcon('symbologyRemove.svg'))
        self.removeValveToolButton.setFixedSize(25, 25)
        self.removeValveToolButton.setToolTip('Supprimer la vanne sélectionnée')
        self.removeValveToolButton.setObjectName('RemoveValveButton')
        self.removeValveToolButton.clicked.connect(self.removeValves)
        self.valveVerticalLayout.addStretch()
        self.valveVerticalLayout.addWidget(self.selectValveToolButton)
        self.valveVerticalLayout.addWidget(self.removeValveToolButton)
        self.layout.addWidget(self.valvesLabel, 0, 0)
        self.layout.addWidget(self.valvesList, 1, 0)
        self.layout.addLayout(self.valveVerticalLayout, 1, 1)

        self.pipeLabel = QLabel("Sélectionner une conduite")
        self.pipeText = QTextEdit()
        self.pipeText.setReadOnly(True)
        self.pipeVerticalLayout = QVBoxLayout()
        self.selectPipeToolButton = QToolButton()
        self.selectPipeToolButton.setIcon(QgsApplication.instance().getThemeIcon('symbologyAdd.svg'))
        self.selectPipeToolButton.setFixedSize(25, 25)
        self.selectPipeToolButton.setToolTip('Sélectionner une conduite...')
        self.selectPipeToolButton.setObjectName('SelectPipeButton')
        self.selectPipeToolButton.clicked.connect(self.selectPipe)
        self.pipeVerticalLayout.addStretch()
        self.pipeVerticalLayout.addWidget(self.selectPipeToolButton)
        self.layout.addWidget(self.pipeLabel, 2, 0)
        self.layout.addWidget(self.pipeText, 3, 0)
        self.layout.addLayout(self.pipeVerticalLayout, 3, 1)

        self.kmMaxLabel = QLabel("Km max. : ")
        self.layout.addWidget(self.kmMaxLabel, 4, 0)
        self.kmMaxSpinBox = QDoubleSpinBox()
        self.kmMaxSpinBox.setDecimals(2)
        self.kmMaxSpinBox.setMinimum(0.1)
        self.kmMaxSpinBox.setMaximum(50)
        self.kmMaxSpinBox.setValue(1)
        self.layout.addWidget(self.kmMaxSpinBox, 4, 1)        
        
        buttons = QDialogButtonBox.Ok | QDialogButtonBox.Cancel
        self.buttonBox = QDialogButtonBox(buttons)
        self.buttonBox.button(QDialogButtonBox.Ok).clicked.connect(self.searchNetwork)
        self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(False)
        self.buttonBox.rejected.connect(self.reject)
        self.layout.addWidget(self.buttonBox)

        self.setLayout(self.layout)

        # Add valve where action was launched from
        self.valvesList.addItem(str(valve_id))
        self.valves.append(valve_id)

    def showEvent(self, event):
        self.setupLayers()

    def setupLayers(self):
        layers = QgsProject.instance().mapLayers()
        valve_layername = None
        pipe_layername = None
        for layer_id, layer in layers.items():
            if (layer.dataProvider().uri().quotedTablename() == VALVE_SOURCE_NAME) \
                and (layer.dataProvider().uri().geometryColumn() == 'geometry'):
                valve_layername = layer.name()
                break
        for layer_id, layer in layers.items():
            if (layer.dataProvider().uri().quotedTablename() == PIPE_SOURCE_NAME) \
                and (layer.dataProvider().uri().geometryColumn() == 'geometry'):
                pipe_layername = layer.name()
                break
        if (valve_layername is None) or (pipe_layername is None):
            QgsMessageLog.logMessage("Valve layer or Pipe layer does not exist in QGIS project !", 'Messages', Qgis.Critical)
            iface.messageBar().pushMessage("Error", "Valve layer or Pipe layer does not exist in QGIS project !", level=Qgis.Critical)            
            QTimer.singleShot(0, self.reject)
            return
        self.valve_layer = QgsProject.instance().mapLayersByName(valve_layername)[0]
        self.valvesMapTool = selectTool(iface, self.valve_layer)
        self.pipe_layer = QgsProject.instance().mapLayersByName(pipe_layername)[0]
        self.pipeMapTool = selectTool(iface, self.network_layer)
        
    def onValveIdentified(self, feature):
        QgsMessageLog.logMessage("Vanne : " + str(feature.id()) + " sélectionnée", 'Messages', Qgis.Info)
        if feature.id() not in self.valves:
            self.valvesList.addItem(str(feature.id()))
            self.valves.append(feature.id())
            self.status.append(feature['closed'])
        else:
            QgsMessageLog.logMessage("La vanne " + str(feature.id()) + " est déjà sélectionnée.", 'Messages', Qgis.Info)
        if (self.valves and self.pipeFeature):
            self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(True)

    def selectValves(self):
        self.valvesMapTool.featureIdentified.connect(self.onValveIdentified)
        iface.mapCanvas().setMapTool(self.valvesMapTool)

    def removeValves(self):
        selectedValves = [item.text() for item in self.valvesList.selectedItems()]
        if selectedValves:
            self.valves = [v for v in self.valves if str(v) not in selectedValves]
        for item in self.valvesList.selectedItems():
            self.valvesList.takeItem(self.valvesList.row(item))
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
            if self.resultPipes:
                self.searchHydrants()
                self.searchMeters()
                self.searchSubscribers()
            if self.resultSubscribers: 
                self.searchSubscribersReferences()
            if self.resultPipes:
                self.reorderLayers(self.group)
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
            layer = QgsVectorLayer("LineString?crs=epsg:" + self.crs, PIPE_LAYER_NAME, "memory")

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

            # Join pipe layer
            join = QgsVectorLayerJoinInfo()
            join.setJoinFieldName('id')
            join.setTargetFieldName('id')
            join.setJoinLayerId(self.pipe_layer.id())
            join.setUsingMemoryCache(True)
            join.setJoinLayer(self.pipe_layer)
            layer.addJoin(join)

            layer.renderer().symbol().setWidth(3.0)            
            layer.renderer().symbol().setColor(QColor(255, 0, 0))
            l = QgsProject.instance().addMapLayer(layer, False)
            self.group.addLayer(l)
        else:
            QgsMessageLog.logMessage("Layer not valid in search pipes", 'Messages', Qgis.Critical)

    
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
        select h.* from qwat_od.vw_element_hydrant h, pipes where h.id in (pipes.target) or h.id  in (pipes.source)
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
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, HYDRANT_LAYER_NAME, "memory")

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
        select * 
        from qwat_od.vw_element_meter m
        where m.id in ({pipes})
        """.format(pipes=', '.join(repr(p) for p in self.resultPipes))        
        # Set connection to database
        source = """{} key='id' table="({})" (geometry)""".format("service=qwat", query)

        tmpLayer = QgsVectorLayer(source, "temporary", "postgres")
        if tmpLayer.isValid():
            # Create a memory layer (the final one which will be display to the user)
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, METER_LAYER_NAME, "memory")

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
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, SUBSCRIBER_LAYER_NAME, "memory")

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
            layer = QgsVectorLayer("Point?crs=epsg:" + self.crs, SUBSCRIBER_REF_LAYER_NAME, "memory")

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

    def reorderLayers(self, group):
        bridge = iface.layerTreeCanvasBridge() 
        order = bridge.rootGroup().customLayerOrder()
        for layer in group.children():
            order.insert(0, order.pop(order.index(layer.layer())))
        bridge.rootGroup().setCustomLayerOrder(order)

nc = NetworkInterruptionDialog(iface.mainWindow(), [% "ID" %])
nc.show()
