# -*- coding: utf-8 -*-
import os

from PyQt4 import QtGui, uic
from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qgis.core import QgsGeometry, QgsMapLayerRegistry
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

def reset_table_widget(table_widget):
    table_widget.clearContents()
    for r in range(table_widget.rowCount() - 1, -1, -1):
        table_widget.removeRow(r)


class GeometryDisplayer:

    def __init__(self, canvas ):
        self.canvas = canvas
        # main rubber
        self.rubber1 = QgsRubberBand(self.canvas)
        self.rubber1.setWidth(2)
        self.rubber1.setBorderColor(QColor("#f00"))
        self.rubber1.setFillColor(QColor("#ff6969"))
        # old geometry rubber
        self.rubber2 = QgsRubberBand(self.canvas)
        self.rubber2.setWidth(2)
        self.rubber2.setBorderColor(QColor("#bbb"))
        self.rubber2.setFillColor(QColor("#ccc"))

    def reset(self):
        self.rubber1.reset()
        self.rubber2.reset()

    def display(self, geom1, geom2 = None):
        """
        @param geom1 base geometry (old geometry for an update)
        @param geom2 new geometry for an update
        """
        if geom2 is None:
            bbox = geom1.boundingBox()
            self.rubber1.setToGeometry(geom1, None)
        else:
            bbox = geom1.boundingBox()
            bbox.combineExtentWith(geom2.boundingBox())
            self.rubber1.setToGeometry(geom2, None)
            self.rubber2.setToGeometry(geom1, None)
        bbox.scale(1.5)
        self.canvas.setExtent(bbox)        

class EventDialog(QtGui.QDialog, FORM_CLASS):
    def __init__(self, parent, conn, map_canvas, table_map = {}, geometry_columns = ["geometry"], selected_layer_id = None, selected_feature_id = None):
        """Constructor.
        @param parent parent widget
        @param conn dbapi2 connection to the postgresql database where logs are stored
        @param map_canvas the main QgsMapCanvas
        @param table_map a dict that associates database table name to a QGIS layer id layer_id : table_name
        @param geometry_columns list of geometry column names to consider
        @param selected_layer_id selected layer
        @param selected_feature_id selected feature_id
        """
        super(EventDialog, self).__init__(parent)
        # Set up the user interface from Designer.
        # After setupUI you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect
        self.setupUi(self)
        # reload button icon
        self.searchButton.setIcon(QIcon(os.path.join(os.path.dirname(__file__), 'icons', 'mActionFilter2.svg')))

        self.conn = conn
        self.map_canvas = map_canvas

        self.geometry_columns = geometry_columns
        self.table_map = table_map

        # populate layer combo
        layer_idx = None
        for i, layer_id in enumerate(self.table_map.keys()):
            l = QgsMapLayerRegistry.instance().mapLayer( layer_id )
            if l is None:
                continue
            print layer_id, selected_layer_id
            if layer_id == selected_layer_id:
                layer_idx = i + 1
            self.layerCombo.addItem(l.name(), layer_id)
        if layer_idx is not None:
            self.layerCombo.setCurrentIndex(layer_idx)

        if selected_feature_id is not None:
            self.idEdit.setEnabled(True)
            self.idEdit.setText(str(selected_feature_id))

        self.populate()

        self.eventTable.itemSelectionChanged.connect(self.onEventSelection)
        self.dataTable.hide()

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

        self.hsplitter.setSizes([100,100])

        self.displayer = GeometryDisplayer(self.map_canvas)
        self.inner_displayer = GeometryDisplayer(self.inner_canvas)

        self.afterDt.setDateTime(QDateTime.currentDateTime())
        self.beforeDt.setDateTime(QDateTime.currentDateTime())

        self.advancedGroup.setCollapsed(True)

        # refresh results when the search button is clicked
        self.searchButton.clicked.connect(self.populate)

        # update the feature id line edit visiblity based on the current layer selection
        self.layerCombo.currentIndexChanged.connect(self.onCurrentLayerChanged)

        # replay button
        self.replayButton.clicked.connect(self.onReplayEvent)

    def onCurrentLayerChanged(self, index):
        self.idEdit.setEnabled(index > 0)
        
    def done(self, status):
        self.undisplayGeometry()
        return QDialog.done(self, status)

    def populate(self):
        self.row_data = []
        self.changed_fields = []

        wheres = []
        
        # filter by selected layer/table
        index = self.layerCombo.currentIndex()
        if index > 0:
            lid = self.layerCombo.itemData(index)
            schema, table = self.table_map[lid].split(".")
            wheres.append("schema_name = '{}'".format(schema))
            wheres.append("table_name = '{}'".format(table))

            # filter by feature id, if any
            if len(self.idEdit.text()) > 0:
                try:
                    id = int(self.idEdit.text())
                    wheres.append("row_data->'id'='{}'".format(id))
                except ValueError:
                    pass

        # filter by data
        if self.dataChck.isChecked():
            v = self.dataEdit.text()
            v = v.replace('\\', '\\\\').replace("'", "''").replace('%', '\\%').replace('_', '\\_')
            wheres.append("(SELECT string_agg(v,' ') FROM svals(row_data) as v) ILIKE '%{}%'".format(v))

        # filter by event type
        types = []
        if self.insertsChck.isChecked():
            types.append('I')
        if self.updatesChck.isChecked():
            types.append('U')
        if self.deletesChck.isChecked():
            types.append('D')
        wheres.append("action IN ('{}')".format("','".join(types)))

        # filter by dates
        if self.afterChck.isChecked():
            dt = self.afterDt.dateTime()
            wheres.append("action_tstamp_clk > '{}'".format(dt.toString(Qt.ISODate)))
        if self.beforeChck.isChecked():
            dt = self.beforeDt.dateTime()
            wheres.append("action_tstamp_clk < '{}'".format(dt.toString(Qt.ISODate)))

        cur = self.conn.cursor()
        # base query
        q = "SELECT event_id, action_tstamp_clk, schema_name || '.' || table_name, action, application_name, row_data, changed_fields FROM qwat_sys.logged_actions l"
        # where clause
        if len(wheres) > 0:
            q += " WHERE " + " AND ".join(wheres)
        print(q)
        cur.execute(q)
        reset_table_widget(self.eventTable)
        self.eventTable.setHorizontalHeaderLabels(["Date", "Table", "Action", "Application"])
        i = 0
        for row in cur.fetchall():
            event_id, tstamp, table_name, action, application, row_data, changed_fields = row
            # column 0 data: event_id
            # column 2 data: action
            self.eventTable.insertRow(i)
            self.eventTable.setItem(i, 0, QTableWidgetItem(tstamp.strftime("%x - %X")))
            self.eventTable.item(i, 0).setData(Qt.UserRole, event_id)
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
        reset_table_widget(self.dataTable)
        self.undisplayGeometry()
        self.replayButton.setEnabled(False)

        # get current selection
        rows = [i.row() for i in self.eventTable.selectedItems()]
        if len(rows) == 0:
            self.dataTable.hide()
            return
        i = rows[0]
        # action from current selection
        action = self.eventTable.item(i, 2).data(Qt.UserRole)
        self.replayButton.setEnabled(True)

        # insertion or deletion
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
        # update
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
                        self.displayGeometry(ewkb_to_geom(v), ewkb_to_geom(w))
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
                    if v != w:
                        b = QBrush(QColor("#ff8888"))
                        self.dataTable.item(j, 0).setBackground(b)
                        self.dataTable.item(j, 1).setBackground(b)
                        self.dataTable.item(j, 2).setBackground(b)
                j += 1
        self.dataTable.resizeColumnsToContents()
        #self.dataTable.sortByColumn(0, Qt.DescendingOrder)
        self.dataTable.show()

    def undisplayGeometry(self):
        self.geometryGroup.hide()
        self.displayer.reset()
        self.inner_displayer.reset()
        
    def displayGeometry(self, geom, geom2 = None):
        self.inner_displayer.display(geom, geom2)
        self.geometryGroup.show()

        if self.onMainCanvas.isChecked():
            self.displayer.display(geom, geom2)

    def onReplayEvent(self):
        rows = [i.row() for i in self.eventTable.selectedItems()]
        if len(rows) == 0:
            return
        i = rows[0]
        # event_id from current selection
        event_id = self.eventTable.item(i, 0).data(Qt.UserRole)

        r = QMessageBox.question(self, u"Replay", u"Are your sure you want to replay the selected event ?", QMessageBox.Yes | QMessageBox.No )
        if r == QMessageBox.No:
            return

        cur = self.conn.cursor()
        cur.execute("SELECT qwat_sys.replay_event({})".format(event_id))
        self.conn.commit()

        # refresh table
        self.populate()


        
        
