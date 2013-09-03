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

from PyQt4.QtGui import QWidget
from qgis.core import QGis

from ..qgissettingmanager import SettingDialog
from ..qgiscombomanager import VectorLayerCombo

from ..core.mysettings import MySettings
from ..ui.ui_tabsettings import Ui_TabSettings


class TabSettings(QWidget, Ui_TabSettings, SettingDialog):

    def __init__(self, parent=None):
        QWidget.__init__(self, parent)
        self.setupUi(self)
        self.settings = MySettings()
        SettingDialog.__init__(self, self.settings, False, True)

        self.nodeLayerComboManager = VectorLayerCombo(self.nodeLayer, lambda: self.settings.value("nodeLayer"), {"geomType": QGis.Point})
        self.valveLayerComboManager = VectorLayerCombo(self.valveLayer, lambda: self.settings.value("valveLayer"), {"geomType": QGis.Point})
        self.pipeLayerComboManager = VectorLayerCombo(self.pipeLayer, lambda: self.settings.value("pipeLayer"), {"geomType": QGis.Line})



