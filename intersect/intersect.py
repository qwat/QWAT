"""
/***************************************************************************
 intersect
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

from distance import distance
from drawcircle import drawCircle
from intersect_wls import intersect_wls


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
		self.layer = False

	def initGui(self):
		# DISTANCE
		self.distanceAction = QAction(QIcon(":/plugins/intersect/icons/distance.png"), "distance tool", self.iface.mainWindow())
		self.distanceAction.setCheckable(True)
		# connect the action to the run method
		QObject.connect(self.distanceAction, SIGNAL("triggered()"), self.startDistance)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.distanceAction)
		self.iface.addPluginToMenu("&intersect", self.distanceAction)	
		# INTERSECT
		self.intersectAction = QAction(QIcon(":/plugins/intersect/icons/intersect.png"), "distance tool", self.iface.mainWindow())
		# connect the action to the run method
		QObject.connect(self.intersectAction, SIGNAL("triggered()"), self.startIntersect)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.intersectAction)
		self.iface.addPluginToMenu("&intersect", self.intersectAction)	
		
		
	def unload(self):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
		print "TODO: instersect unload"
		
	def startDistance(self):
		canvas = self.iface.mapCanvas()
		if self.distanceAction.isChecked() is False:
			canvas.unsetMapTool(self.getPoint)
			return
		self.distanceAction.setChecked( True )
		if self.layer is False:
			self.createMemoryLayer()
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
		dlg = distance(point)
		if dlg.exec_():
			radius    = dlg.distance.value()
			if radius==0:
				return
			precision = dlg.precision.value()
			f = QgsFeature()
			c = drawCircle(point,radius)
			f.setGeometry(c.getGeometry())
			f.setAttributeMap( {0: QVariant(point.x()),
								1: QVariant(point.y()),
								2: QVariant(radius),
								3: QVariant(precision)} )
			self.layer.dataProvider().addFeatures( [f] )
			self.layer.updateExtents()
			canvas.refresh()
		
	def toolChanged(self, tool):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.toolChanged)
		self.distanceAction.setChecked( False )
		self.iface.mapCanvas().unsetMapTool(self.getPoint)
		#self.deleteLayer()

	def deleteLayer(self):
		if self.layer.type() == QgsMapLayer.VectorLayer:
			print "Intersect :: Removing temporary layer"
			QgsMapLayerRegistry.instance().removeMapLayer(self.layer.id()) 
			
	def layerDeleted(self):
		self.layer = False

	def createMemoryLayer(self):	
		self.layer = QgsVectorLayer("LineString?crs=EPSG:21781&field=x:double&field=y:double&field=radius:double&field=precision:double&index=yes", "Intersect", "memory") 
		QgsMapLayerRegistry.instance().addMapLayer(self.layer) 
		QObject.connect( self.layer, SIGNAL("layerDeleted()") , self.layerDeleted )
		
	def startIntersect(self):
		fts = self.layer.selectedFeatures()
		print self.layer.selectedFeatureCount()
		provider = self.layer.dataProvider()
		ix = provider.fieldNameIndex('x')
		iy = provider.fieldNameIndex('y')
		ir = provider.fieldNameIndex('radius')
		ip = provider.fieldNameIndex('precision')
		print ix,iy,ir,ip
		xyrp = []
		for f in fts:
			fm = f.attributeMap()
			xyrp.append([fm[ix],fm[iy],fm[ir],fm[ip]])
		intersect_wls(xyrp)			
		
		
class getPoint(QgsMapToolEmitPoint):
	def __init__(self, canvas):
		QgsMapToolEmitPoint.__init__(self, canvas)

	def canvasPressEvent(self, mouseEvent):
		point = self.toMapCoordinates( mouseEvent.pos() )
		self.emit( SIGNAL( "canvasClickedWithModifiers" ), point, mouseEvent.button(), mouseEvent.modifiers() )	
		
		
	
		

