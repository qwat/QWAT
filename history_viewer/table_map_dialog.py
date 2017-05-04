# -*- coding: utf-8 -*-
import os

from PyQt4 import uic
from PyQt4.QtGui import QDialog

from qgis.core import QgsProject, QgsLayerTreeModel
from qgis.gui import QgsLayerTreeView

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'table_map.ui'))

class TableMapDialog(QDialog, FORM_CLASS):
    def __init__(self, parent, table_map = {}):
        """Constructor.
        @param parent parent widget
        """
        super(TableMapDialog, self).__init__(parent)
        self.setupUi(self)

        self._table_map = table_map

        self.tree_group = QgsProject.instance().layerTreeRoot().clone()
        self.tree_model = QgsLayerTreeModel(self.tree_group)
        self.treeView.setModel(self.tree_model)

        self.treeView.currentLayerChanged.connect(self.onLayerChanged)
        self.tableEdit.textChanged.connect(self.onTableEdit)

    def onLayerChanged(self, layer):
        self.tableEdit.setText('')
        if layer is None:
            return
        table_name = self._table_map.get(layer.id())
        if table_name is not None:
            self.tableEdit.setText(table_name)

    def onTableEdit(self, table_name):
        current = self.treeView.currentLayer()
        if current is not None:
            self._table_map[current.id()] = table_name

    def table_map(self):
        return self._table_map


        
        
