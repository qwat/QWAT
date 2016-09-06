# -*- coding: utf-8 -*-
import os

from PyQt4 import QtGui, uic
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qgis.core import QgsGeometry
from qgis.gui import QgsRubberBand, QgsMapCanvas, QgsMapCanvasLayer

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'event_dialog.ui'))

import re

# Convert a string representing a hstore from psycopg2 to a Python dict
def parse_hstore(hstore_str):
    if hstore_str is None:
        return {}
    kv_re = re.compile('"(\w+)"=>(NULL|""|".*?[^\\\\]")(?:, |$)')
    return dict([(m.group(1), None if m.group(2) == 'NULL' else m.group(2).replace('\\"', '"')[1:-1]) for m in re.finditer(kv_re, hstore_str)])

def ewkb_to_geom(ewkb_str):
    # get type + flags
    header = ewkb_str[2:10]
    has_srid = int(header[6], 16) & 2 > 0
    if has_srid:
        # remove srid flag
        header = header[:6] + "%X" % (int(header[6], 16) ^ 2) + header[7]
        # remove srid
        ewkb_str = ewkb_str[:2] + header + ewkb_str[18:]
    w = ewkb_str.decode('hex')
    g = QgsGeometry()
    g.fromWkb(w)
    return g

class EventDialog(QtGui.QDialog, FORM_CLASS):
    def __init__(self, parent, conn, map_canvas):
        """Constructor."""
        super(EventDialog, self).__init__(parent)
        # Set up the user interface from Designer.
        # After setupUI you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect
        self.setupUi(self)

        self.conn = conn
        self.map_canvas = map_canvas

        # FIXME pass as parameters
        self.geometry_columns = ["geometry", "geometry_alt1", "geometry_alt2"]

        self.populate()

        self.eventTable.itemSelectionChanged.connect(self.onEventSelection)
        self.dataTable.hide()

        # rubber band on the main canvas
        self.rubber = QgsRubberBand(self.map_canvas)
        self.rubber.setWidth(2)
        self.rubber.setBorderColor(QColor("red"))

        #
        # inner canvas
        self.vbox = QVBoxLayout()
        margins = self.vbox.contentsMargins()
        margins.setBottom(0)
        margins.setTop(11)
        margins.setLeft(0)
        margins.setRight(0)
        self.vbox.setContentsMargins(margins)
        self.inner_canvas = QgsMapCanvas()
        # copy layer set
        self.inner_canvas.setLayerSet([QgsMapCanvasLayer(l) for l in self.map_canvas.layers()])
        self.inner_canvas.setExtent(self.map_canvas.extent())
        self.vbox.addWidget(self.inner_canvas)
        self.geometryGroup.setLayout(self.vbox)
        self.geometryGroup.hide()

        # rubber band on the inner canvas
        self.inner_rubber = QgsRubberBand(self.inner_canvas)
        self.inner_rubber.setWidth(2)
        self.inner_rubber.setBorderColor(QColor("red"))
        self.inner_rubber_d = QgsRubberBand(self.inner_canvas)
        self.inner_rubber_d.setWidth(2)
        self.inner_rubber_d.setBorderColor(QColor("#888"))

        self.hsplitter.setSizes([100,100])


    def populate(self):
        self.row_data = []
        self.changed_fields = []
        
        cur = self.conn.cursor()
        cur.execute("SELECT action_tstamp_clk, schema_name || '.' || table_name, action, application_name, row_data, changed_fields FROM qwat_sys.logged_actions")
        self.eventTable.clear()
        self.eventTable.setHorizontalHeaderLabels(["Date", "Table", "Action", "Application"])
        i = 0
        for row in cur.fetchall():
            tstamp, table_name, action, application, row_data, changed_fields = row
            self.eventTable.insertRow(i)
            self.eventTable.setItem(i, 0, QTableWidgetItem(tstamp.strftime("%x - %X")))
            self.eventTable.setItem(i, 1, QTableWidgetItem(table_name))
            if action == 'I':
                self.eventTable.setItem(i, 2, QTableWidgetItem("Insertion"))
            elif action == 'U':
                self.eventTable.setItem(i, 2, QTableWidgetItem("Update"))
            elif action == 'D':
                self.eventTable.setItem(i, 2, QTableWidgetItem("Delete"))
            self.eventTable.item(i, 2).setData(Qt.UserRole, action)
            self.eventTable.setItem(i, 3, QTableWidgetItem(application))

            # store data
            self.row_data.append(parse_hstore(row_data))
            self.changed_fields.append(parse_hstore(changed_fields))
            
            i += 1

        self.eventTable.resizeColumnsToContents()

    def onEventSelection(self):
        i = self.eventTable.currentRow()
        action = self.eventTable.item(i, 2).data(Qt.UserRole)

        self.dataTable.clear()
        for r in range(self.dataTable.rowCount() - 1, -1, -1):
            self.dataTable.removeRow(r)

        self.undisplayGeometry()
        if action == 'I' or action == 'D':
            self.dataTable.setColumnCount(2)
            self.dataTable.setHorizontalHeaderLabels(["Column", "Value"])
            data = self.row_data[i]
            j = 0
            for k, v in data.iteritems():
                if k == self.geometry_columns[0]:                                        
                    self.displayGeometry(ewkb_to_geom(v))
                    continue
                if k in self.geometry_columns:
                    continue
                if v is None:
                    continue
                self.dataTable.insertRow(j)                
                self.dataTable.setItem(j, 0, QTableWidgetItem(k))
                self.dataTable.setItem(j, 1, QTableWidgetItem(v))
                j += 1
        elif action == 'U':
            self.dataTable.setColumnCount(3)
            self.dataTable.setHorizontalHeaderLabels(["Column", "Old value", "New value"])
            data = self.row_data[i]
            changed_fields = self.changed_fields[i]
            j = 0
            for k, v in data.iteritems():
                if k == self.geometry_columns[0]:
                    w = changed_fields.get(k)
                    if w is not None:
                        self.displayGeometry(ewkb_to_geom(w), ewkb_to_geom(v))
                    continue
                if k in self.geometry_columns:
                    continue
                w = changed_fields.get(k)
                if v is None and w is None:
                    continue
                self.dataTable.insertRow(j)
                self.dataTable.setItem(j, 0, QTableWidgetItem(k))
                self.dataTable.setItem(j, 1, QTableWidgetItem(v))
                if w is None:
                    self.dataTable.setItem(j, 2, QTableWidgetItem(v))
                else:
                    self.dataTable.setItem(j, 2, QTableWidgetItem(w))
                j += 1
        self.dataTable.resizeColumnsToContents()
        #self.dataTable.sortByColumn(0, Qt.DescendingOrder)
        self.dataTable.show()

    def undisplayGeometry(self):
        self.geometryGroup.hide()
        self.inner_rubber.reset()
        self.inner_rubber_d.reset()
        self.rubber.reset()
        
    def displayGeometry(self, geom, geom2 = None):
        bbox = geom.boundingBox()
        self.inner_rubber.setToGeometry(geom, None)

        if geom2 is not None:
            bbox.combineExtentWith(geom2.boundingBox())
            self.inner_rubber_d.setToGeometry(geom2, None)
        bbox.scale(1.5)
        self.inner_canvas.setExtent(bbox)
        self.geometryGroup.show()

        if self.onMainCanvas.isChecked():
            self.rubber.setToGeometry(geom, None)
            self.map_canvas.setExtent(bbox)
