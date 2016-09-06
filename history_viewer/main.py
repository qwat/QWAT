import os

# import from __init__
from . import name as plugin_name

from PyQt4.QtCore import QSettings
from PyQt4.QtGui import QAction, QIcon

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
        
        self.dlg = event_dialog.EventDialog(self.iface.mainWindow(), conn, self.iface.mapCanvas())
        self.dlg.show()

