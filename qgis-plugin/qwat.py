#-----------------------------------------------------------
#
# qWat is a QGIS plugin to manage a network of water pipes.
#
# Copyright    : (C) 2013 Denis Rouzaud
# Email        : denis.rouzaud@gmail.com
#
#-----------------------------------------------------------
#
# licensed under the terms of GNU GPL 2
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this progsram; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#---------------------------------------------------------------------

from PyQt4.QtCore import QUrl, Qt, QTranslator, QCoreApplication, QSettings, QFileInfo
from PyQt4.QtGui import QAction, QIcon, QDesktopServices
from qgis.core import QgsMapLayer, QgsProject, QgsApplication

from core.mysettings import MySettings
from gui.mysettingsdialog import MySettingsDialog
from gui.maindialog import MainDialog

import resources


class qWat():
    def __init__(self, iface):
        self.iface = iface
        self.settings = MySettings()
        self.mainDialog = MainDialog()

         # Initialise the translation environment.
        userPluginPath = QFileInfo(QgsApplication.qgisUserDbFilePath()).path()+"/python/plugins/qwat"
        systemPluginPath = QgsApplication.prefixPath()+"/share/qgis/python/plugins/qwat"
        locale = QSettings().value("locale/userLocale")
        myLocale = locale[0:2]
        if QFileInfo(userPluginPath).exists():
            pluginPath = userPluginPath+"/i18n/qwat_"+myLocale+".qm"
        elif QFileInfo(systemPluginPath).exists():
            pluginPath = systemPluginPath+"/i18n/qwat_"+myLocale+".qm"
        self.localePath = pluginPath
        if QFileInfo(self.localePath).exists():
            self.translator = QTranslator()
            self.translator.load(self.localePath)
            QCoreApplication.installTranslator(self.translator)


    def initGui(self):
        self.uiAction = QAction(QIcon(":/plugins/qWat/icons/qwat.svg"), "settings", self.iface.mainWindow())
        self.uiAction.triggered.connect(self.showDialog)
        self.iface.addPluginToMenu("&qWat", self.uiAction)
        self.iface.addToolBarIcon(self.uiAction)


    def unload(self):
        self.iface.removePluginMenu("&qWat", self.uiAction)
        self.iface.removeToolBarIcon(self.uiAction)

    def showDialog(self):
        self.mainDialog.show()




