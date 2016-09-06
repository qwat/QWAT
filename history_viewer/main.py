import os

# import from __init__
from . import name as plugin_name

from PyQt4.QtCore import QSettings
from PyQt4.QtGui import QAction, QIcon

from qgis.core import QgsMapLayerRegistry

import psycopg2

import event_dialog

PLUGIN_PATH=os.path.dirname(__file__)

def database_connection_string():
    return QSettings("qwat_history_viewer").value("connection", "service=qwat")

class Plugin():
    def __init__(self, iface):
        self.iface = iface

    def initGui(self):
        self.listEventsAction = QAction(QIcon(os.path.join(PLUGIN_PATH, "icons", "qaudit-64.png")), u"List events", self.iface.mainWindow())
        self.listEventsAction.triggered.connect(self.onListEvents)

        self.iface.addToolBarIcon(self.listEventsAction)
        self.iface.addPluginToMenu(plugin_name(), self.listEventsAction)

    def unload(self):
        self.iface.removeToolBarIcon(self.listEventsAction)
        self.iface.removePluginMenu(plugin_name(),self.listEventsAction)

    def onListEvents(self):
        conn = psycopg2.connect(database_connection_string())

        table_map = {}
        l = QgsMapLayerRegistry.instance().mapLayersByName(u"conduites")
        if len(l) > 0:
            table_map[l[0].id()] = "qwat_od.pipe"
        l = QgsMapLayerRegistry.instance().mapLayersByName(u"vannes")
        if len(l) > 0:
            table_map[l[0].id()] = "qwat_od.valve"
        
        self.dlg = event_dialog.EventDialog(self.iface.mainWindow(),
                                            conn,
                                            self.iface.mapCanvas(),
                                            table_map = table_map,
                                            geometry_columns = ["geometry", "geometry_alt1", "geometry_alt2"])
        self.dlg.show()

