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

from PyQt4.QtCore import pyqtSlot
from PyQt4.QtGui import QWidget
from qgis.core import QgsMapLayerRegistry

from ..core.mysettings import MySettings
from ..core.valveclosepipes import ValveClosePipes
from ..ui.ui_tabvalve import Ui_TabValve


class TabValve(QWidget, Ui_TabValve):

    def __init__(self, parent=None):
        QWidget.__init__(self, parent)
        self.setupUi(self)
        self.settings = MySettings()
        self.valveClosePipesStopButton.hide()

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
        self.process = ValveClosePipes(valveLayer, pipeLayer)
        self.process.progress.connect(self.valveClosePipesProgressBar.setValue)
        self.process.finished.connect(self.valveClosePipesStopButton.hide)
        self.process.finished.connect(self.valveClosePipesStartButton.show)
        self.valveClosePipesStopButton.pressed.connect(self.process.stop)
        self.valveClosePipesProgressBar.setMinimum(0)
        self.valveClosePipesProgressBar.setMaximum(self.process.processLength)
        print self.process.processLength
        self.valveClosePipesProgressBar.setValue(0)
        self.process.start()
