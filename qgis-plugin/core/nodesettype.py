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

from PyQt4.QtCore import QObject, pyqtSignal, QCoreApplication

from qgis.core import QgsFeatureRequest, QgsFeature


class NodeSetType(QObject):
    progress = pyqtSignal(int)
    finished = pyqtSignal()

    def __init__(self, nodeLayer, pipeLayer):
        QObject.__init__(self)
        self.nodeLayer = nodeLayer
        self.pipeLayer = pipeLayer
        self.processLength = pipeLayer.featureCount()
        self.goOn = True

    def stop(self):
        self.goOn = False

    def start(self):
        idx = self.pipeLayer.fieldNameIndex("_valve_closed")
        pFeatReq = QgsFeatureRequest()
        pipe = QgsFeature()
        valve = QgsFeature()
        pipeIterator = self.pipeLayer.getFeatures(pFeatReq)
        k = 1
        while pipeIterator.nextFeature(pipe) and self.goOn:
            self.progress.emit(k)
            closed = False
            bbox = pipe.geometry().boundingBox()
            vFeatReq = QgsFeatureRequest().setFilterRect(bbox)
            valveIterator = self.valveLayer.getFeatures(vFeatReq)
            while valveIterator.nextFeature(valve):
                if valve["closed"] == 't':
                    if pipe.geometry().touches(valve.geometry()):
                        closed = True
                        break
            self.pipeLayer.dataProvider().changeAttributeValues({pipe.id(): {idx: closed}})
            k += 1
            QCoreApplication.processEvents()
        self.finished.emit()





