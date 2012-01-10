"""
/***************************************************************************
 qWat - QGIS Water Module
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
# Import the PyQt and QGIS libraries
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *

# Initialize Qt resources from file resources.py
import resources

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s


class intersect ():
	def __init__(self, iface):
		# Save reference to the QGIS interface
		self.iface = iface
		self.layer = 0

	def initGui(self):
		# DISTANCE
		self.distanceAction = QAction(QIcon(":/plugins/intersect/icons/distance.png"), "distance tool", self.iface.mainWindow())
		self.distanceAction.setCheckable(True)
		# connect the action to the run method
		QObject.connect(self.distanceAction, SIGNAL("triggered()"), self.startDistance)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.distanceAction)
		self.iface.addPluginToMenu("&intersect", self.distanceAction)

	def unload(self):
		print "TODO: instersect unload"
		
		
	def startDistance(self):
		canvas = self.iface.mapCanvas()
		
		print self.distanceAction.isChecked()
		if self.distanceAction.isChecked() is False:
			canvas.unsetMapTool(self.getPoint)
			return
			
		self.distanceAction.setChecked( True )
		# create temporary layer
		self.deleteLayer
		self.layer = QgsVectorLayer("LineString?crs=EPSG:21781&field=x:double&field=y:double&field=radius:double&index=yes", "Intersect", "memory") 
		QgsMapLayerRegistry.instance().addMapLayer(self.layer) 
		
		
		self.getPoint = getPoint(canvas)
		QObject.connect(self.getPoint , SIGNAL("canvasClickedWithModifiers") , self.onCanvasClicked ) 
		canvas.setMapTool(self.getPoint)
		QObject.connect( canvas, SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
		
	def onCanvasClicked(self, point, button, modifiers):
		if button != Qt.LeftButton:
			return
		canvas = self.iface.mapCanvas()
		point = canvas.mapRenderer().mapToLayerCoordinates(self.layer, point)
		print point
		
	def toolChanged(self, tool):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
		self.distanceAction.setChecked( False )
		self.iface.mapCanvas().unsetMapTool(self.getPoint)
		self.deleteLayer()

	def deleteLayer(self):
		if self.layer.type() == QgsMapLayer.VectorLayer:
			print "Intersect :: Removing temporary layer"
			QgsMapLayerRegistry.instance().removeMapLayer(self.layer.id()) 

		
		
class getPoint(QgsMapToolEmitPoint):
	def __init__(self, canvas):
		QgsMapToolEmitPoint.__init__(self, canvas)

	def canvasPressEvent(self, mouseEvent):
		point = self.toMapCoordinates( mouseEvent.pos() )
		self.emit( SIGNAL( "canvasClickedWithModifiers" ), point, mouseEvent.button(), mouseEvent.modifiers() )	
		
		
	
		

