import os

# import from __init__
from . import name as plugin_name

from PyQt4.QtCore import QSettings
from PyQt4.QtGui import QAction, QIcon

from qgis.core import QgsMapLayerRegistry, QgsProject

import psycopg2

import event_dialog
import table_map_dialog

PLUGIN_PATH=os.path.dirname(__file__)

def database_connection_string():
    return QSettings("qwat_history_viewer").value("connection", "service=qwat")

def project_table_map():
    # get table_map
    table_map_strs, ok = QgsProject.instance().readListEntry("QWAT", "table_map", [])
    # list of "layer_id=table_name" strings
    table_map = dict([t.split('=') for t in table_map_strs])
    return table_map


class Plugin():
    def __init__(self, iface):
        self.iface = iface

    def initGui(self):
        self.listEventsAction = QAction(QIcon(os.path.join(PLUGIN_PATH, "icons", "qaudit-64.png")), u"List events", self.iface.mainWindow())
        self.listEventsAction.triggered.connect(self.onListEvents)

        self.iface.addToolBarIcon(self.listEventsAction)
        self.iface.addPluginToMenu(plugin_name(), self.listEventsAction)

        self.configureAction = QAction(u"Configure layer - table mapping", self.iface.mainWindow())
        self.configureAction.triggered.connect(self.onConfigure)
        self.iface.addPluginToMenu(plugin_name(), self.configureAction)


    def unload(self):
        self.iface.removeToolBarIcon(self.listEventsAction)
        self.iface.removePluginMenu(plugin_name(),self.listEventsAction)
        self.iface.removePluginMenu(plugin_name(),self.configureAction)

    def onListEvents(self, layer_id = None, feature_id = None):
        conn = psycopg2.connect(database_connection_string())

        table_map = project_table_map()
        
        self.dlg = event_dialog.EventDialog(self.iface.mainWindow(),
                                            conn,
                                            self.iface.mapCanvas(),
                                            table_map = table_map,
                                            geometry_columns = ["geometry", "geometry_alt1", "geometry_alt2"],
                                            selected_layer_id = layer_id,
                                            selected_feature_id = feature_id)
        self.dlg.show()

    def onConfigure(self):
        table_map = project_table_map()
        self.table_map_dlg = table_map_dialog.TableMapDialog(self.iface.mainWindow(), table_map)
        r = self.table_map_dlg.exec_()
        if r == 1:
            table_map = self.table_map_dlg.table_map()
            # save to the project
            QgsProject.instance().writeEntry("QWAT", "table_map", [k+"="+v for k,v in table_map.items()])

