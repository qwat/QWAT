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

from PyQt4.QtCore import pyqtSlot, QCoreApplication
from PyQt4.QtGui import QWidget
from qgis.core import QgsMapLayerRegistry
from ..core.mysettings import MySettings
from ..ui.ui_tabnode import Ui_TabNode


class TabNode(QWidget, Ui_TabNode):

    def __init__(self, parent=None):
        QWidget.__init__(self, parent)
        self.setupUi(self)
        self.settings = MySettings()

        self.nodeInfoLabel.hide()
        self.nodeUnusedFrame.setEnabled(False)
        self.nodeErrorFrame.setEnabled(False)
        self.nodeTypeFrame.setEnabled(False)

    @pyqtSlot(name="on_nodeStartButton_pressed")
    def startNode(self):
        layerid = self.settings.value("nodeLayer")
        layer = QgsMapLayerRegistry.instance().mapLayer(layerid)
        if layer is None:
            self.nodeInfoLabel.setText(QCoreApplication.translate("node", "Please choose a node layer in qWat settings first."))
            self.nodeInfoLabel.show()
            return
        self.nodeInfoLabel.hide()
        self.unusedFrame.setEnabled(True)
        self.errorFrame.setEnabled(True)
        self.typeFrame.setEnabled(True)


