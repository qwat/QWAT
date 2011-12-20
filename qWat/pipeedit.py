"""
/***************************************************************************
 qWat Pipe Editor
                                 A QGIS plugin
 Tools
                             -------------------
        begin                : 2011-11-17
        copyright            : (C) 2011 by Denis Rouzaud
        email                : denis.rouzaud@sige.ch
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/	
"""

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *


try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s


from ui_PipeEdit import Ui_PipeEdit

# create the dialog for zoom to point
class PipeEdit( QDockWidget , Ui_PipeEdit ):
	def __init__(self,iface,layer):
		self.layer = layer
		self.iface = iface		
		# UI setup
		QDockWidget.__init__(self)
		self.setupUi(self)
		self.schema_cancelButton.hide()
		self.iface.addDockWidget(Qt.LeftDockWidgetArea,self)
		QObject.connect(self.layer , SIGNAL("editingStarted()")   , self.enableEditing)
		QObject.connect(self.layer , SIGNAL("editingStopped()")   , self.disableEditing)
		QObject.connect(self.layer , SIGNAL("selectionChanged ()"), self.onPipeSelected )
		# connect all fields to feature attributes
		QObject.connect(self.schema_idParentLineEdit , SIGNAL("textChanged(QString)")     , self.setIdParent         )
		QObject.connect(self.schema_forceViewCombo   , SIGNAL("currentIndexChanged(int)") , self.setSchemaForceView  )
		
	def unload(self):
		self.iface.removeDockWidget(self)
		

	@pyqtSignature("on_previousButton_clicked()")
	def on_previousButton_clicked(self):
		i = self.fidListCombo.currentIndex()
		n = max(0,i-1)
		self.fidListCombo.setCurrentIndex(n)
		
	@pyqtSignature("on_nextButton_clicked()")
	def on_nextButton_clicked(self):
		i = self.fidListCombo.currentIndex()
		c = self.fidListCombo.count()
		n = min(i+1,c-1)
		self.fidListCombo.setCurrentIndex(n)

	@pyqtSignature("on_fidListCombo_currentIndexChanged(int)")
	def on_fidListCombo_currentIndexChanged(self,i):
		# Extract pipe
		pipe = self.getCurrentPipe()
		# Zoom to element
		if self.zoomCheck.isChecked():
			self.zoomToPipe(pipe)
		# Update browser
		self.currentPosLabel.setText('%u/%u' % (i+1,len(self.subset)) )
		# edit element
		self.viewPipe(pipe)
		
		
	@pyqtSignature("on_zoomCheck_stateChanged(int)")
	def on_zoomCheck_stateChanged(self,i):
		if self.zoomCheck.isChecked():
			# Extract pipe
			pipe = self.getCurrentPipe()
			# zoom
			self.zoomToPipe(pipe)
			
	@pyqtSignature("on_schema_selectButton_clicked()")
	def on_schema_selectButton_clicked(self):	
		canvas = self.iface.mapCanvas()
		self.getNeighbor = getNeighbor(canvas)
		QObject.connect(self.getNeighbor , SIGNAL("canvasClickedWithModifiers") , self.onCanvasClicked ) 
		canvas.setMapTool(self.getNeighbor)
		QObject.connect( canvas, SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
		self.schema_selectButton.hide()
		self.schema_cancelButton.show()
		
	@pyqtSignature("on_schema_cancelButton_clicked()")
	def on_schema_cancelButton_clicked(self):	
		canvas = self.iface.mapCanvas()
		canvas.unsetMapTool(self.getNeighbor)
		self.schema_selectButton.show()
		self.schema_cancelButton.hide()
		QObject.disconnect( canvas, SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
			
	def toolChanged(self, tool):
		self.on_schema_cancelButton_clicked()

	def onPipeSelected(self):
		self.enableDockWidget(False)
		self.cleanBrowserFields()
		self.cleanEditFields()
		self.fieldPos = fieldPos(self.layer)
		nPipes = self.layer.selectedFeatureCount()
		if nPipes == 0:
			print "SIGE PipeEdit: Nothing has been selected"
		else:
			self.enableDockWidget(True)
			self.subset = self.layer.selectedFeaturesIds()
			l = 0
			for id in self.subset:
				self.fidListCombo.addItem(_fromUtf8(""))
				self.fidListCombo.setItemText(l, "%u" % id)
				l+= 1
				
	def enableEditing(self):
		self.schemaWidget.setEnabled(True)

	def disableEditing(self):
		self.schemaWidget.setEnabled(False)
		
	def enableDockWidget(self,enabled):
		self.browseFrame.setEnabled(enabled)
		self.editTabWidget.setEnabled(enabled)	
						
	def cleanBrowserFields(self):
		self.currentPosLabel.setText('0/0')
		self.fidListCombo.clear()
		
	def cleanEditFields(self):
		# schema
		self.schema_idParentLineEdit.setText('')
		
	def viewPipe(self,pipe):
			fieldmap=pipe.attributeMap()
			
			# schema
			idParent = fieldmap[self.fieldPos.id_parent].toString()
			self.schema_idParentLineEdit.setText(idParent)
			schemaForceView = fieldmap[self.fieldPos.schema_force_view].toInt()
			self.schema_forceViewCombo.setCurrentIndex( schemaForceView[0])
						
	def getCurrentPipe(self):
		pipe = QgsFeature()
		i = self.fidListCombo.currentIndex()
		self.layer.featureAtId(self.subset[i],pipe)
		return pipe			
		
	def zoomToPipe(self,pipe):
		bobo = pipe.geometry().boundingBox()
		bobo.scale(5)
		self.iface.mapCanvas().setExtent(bobo)
		self.iface.mapCanvas().refresh()	
			
	def setIdParent(self,new):
		new = new.toInt()
		new = new[0] # new[1] is True or False. If new was an empty string, then a NULL value is stored based on SQL rule
		i = self.fidListCombo.currentIndex()
		self.layer.changeAttributeValue(self.subset[i] , self.fieldPos.id_parent, new )
		
	def setSchemaForceView(self,new):
		i = self.fidListCombo.currentIndex()
		self.layer.changeAttributeValue(self.subset[i] , self.fieldPos.schema_force_view, new )
		
			
		
	def onCanvasClicked(self, point, button, modifiers):
		if button != Qt.LeftButton:
			return
		canvas = self.iface.mapCanvas()
		point = canvas.mapRenderer().mapToLayerCoordinates(self.layer, point)
		
		pixTolerance = 6
		mapTolerance = pixTolerance * canvas.mapUnitsPerPixel()
		rect = QgsRectangle(point.x()-mapTolerance,point.y()-mapTolerance,point.x()+mapTolerance,point.y()+mapTolerance)
		
		provider = self.layer.dataProvider()
		provider.select([self.fieldPos.fid], rect, True, True)
		subset = []
		f = QgsFeature()
		while (provider.nextFeature(f)):
			subset.append(f)
		if len(subset) > 1:
			QMessageBox.warning( self, "qWat Pipe Editor", QApplication.translate("PipeEditor", "Two pipes have been selected. Please select only one parent.", None, QApplication.UnicodeUTF8) )
			return
		if len(subset) == 1:
			fieldmap=subset[0].attributeMap()
			self.schema_idParentLineEdit.setText(fieldmap[self.fieldPos.fid].toString())
		self.on_schema_cancelButton_clicked()
		
			
class getNeighbor(QgsMapToolEmitPoint):
	def __init__(self, canvas):
		QgsMapToolEmitPoint.__init__(self, canvas)

	def canvasPressEvent(self, mouseEvent):
		point = self.toMapCoordinates( mouseEvent.pos() )
		self.emit( SIGNAL( "canvasClickedWithModifiers" ), point, mouseEvent.button(), mouseEvent.modifiers() )

				
class fieldPos:		
	def __init__(self,layer):
		provider = layer.dataProvider()
		self.fid                = provider.fieldNameIndex('fid')
		self.schema_force_view  = provider.fieldNameIndex('schema_force_view')
		self.id_parent          = provider.fieldNameIndex('id_parent')
