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
from PyQt4.QtGui import QDialog
from qgis.core import QGis, QgsMapLayerRegistry

from ..qgissettingmanager import SettingDialog
from ..qgiscombomanager import VectorLayerCombo

from ..core.mysettings import MySettings
from ..core.valveclosepipes import ValveClosePipes
from ..ui.ui_qwat import Ui_qwat


class MainDialog(QDialog, Ui_qwat, SettingDialog):
    def __init__(self):
        QDialog.__init__(self)
        self.setupUi(self)
        self.settings = MySettings()
        SettingDialog.__init__(self, self.settings, False, True)

        self.nodeLayerComboManager = VectorLayerCombo(self.nodeLayer, lambda: self.settings.value("nodeLayer"), {"geomType": QGis.Point})
        self.valveLayerComboManager = VectorLayerCombo(self.valveLayer, lambda: self.settings.value("valveLayer"), {"geomType": QGis.Point})
        self.pipeLayerComboManager = VectorLayerCombo(self.pipeLayer, lambda: self.settings.value("pipeLayer"), {"geomType": QGis.Line})

        self.nodeInfoLabel.hide()
        # self.nodeUnusedFrame.setEnabled(False)
        # self.nodeErrorFrame.setEnabled(False)
        # self.nodeTypeFrame.setEnabled(False)

        # VALVES
        self.valveClosePipesStopButton.hide()

    @pyqtSlot(name="on_nodeStartButton_pressed")
    def startNode(self):
        layerid = self.settings.value("nodeLayer")
        layer = QgsMapLayerRegistry.instance().mapLayer(layerid)
        if layer is None:
            self.nodeInfoLabel.setText(QCoreApplication.translate("Please choose a node layer in qWat settings first."))
            self.nodeInfoLabel.show()
            return
        self.nodeInfoLabel.hide()
        self.unusedFrame.setEnabled(True)
        self.errorFrame.setEnabled(True)
        self.typeFrame.setEnabled(True)


    @pyqtSlot(name="on_valveClosePipesStartButton_pressed")
    def valveClosePipes(self):
        valveLayerId = self.settings.value("valveLayer")
        valveLayer = QgsMapLayerRegistry.instance().mapLayer(valveLayerId)
        pipeLayerId = self.settings.value("pipeLayer")
        pipeLayer = QgsMapLayerRegistry.instance().mapLayer(pipeLayerId)
        if valveLayer is None or pipeLayer is None:
            return
        self.valveClosePipesStopButton.show()
        self.valveClosePipesStartButton.hide()
        process = ValveClosePipes(valveLayer, pipeLayer)
        process.progress.connect(self.valveClosePipesProgressBar.setValue)
        process.finished.connect(self.valveClosePipesStopButton.hide)
        process.finished.connect(self.valveClosePipesStartButton.show)
        self.valveClosePipesStopButton.pressed.connect(process.stop)
        self.valveClosePipesProgressBar.setMinimum(0)
        self.valveClosePipesProgressBar.setMaximum(process.processLength)
        self.valveClosePipesProgressBar.setValue(0)
        process.start()










