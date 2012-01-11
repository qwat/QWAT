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
import math

# Import the PyQt and QGIS libraries
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *

from distance import distance
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
		# create rubber band to emphasis selected circles
		self.rubber = QgsRubberBand(self.iface.mapCanvas())

	def initGui(self):
		# DISTANCE
		self.distanceAction = QAction(QIcon(":/plugins/intersect/icons/distance.png"), "distance tool", self.iface.mainWindow())
		self.distanceAction.setCheckable(True)
		# connect the action to the run method
		QObject.connect(self.distanceAction, SIGNAL("triggered()"), self.distanceStart)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.distanceAction)
		self.iface.addPluginToMenu("&intersect", self.distanceAction)	
		# INTERSECT
		self.intersectAction = QAction(QIcon(":/plugins/intersect/icons/intersect.png"), "distance tool", self.iface.mainWindow())
		self.intersectAction.setCheckable(True)
		# connect the action to the run method
		QObject.connect(self.intersectAction, SIGNAL("triggered()"), self.intersectStart)
		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.intersectAction)
		self.iface.addPluginToMenu("&intersect", self.intersectAction)	
		
	def unload(self):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.distanceToolChanged)
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.intersectToolChanged)
		print "TODO: instersect unload"
		try:
			print "Intersect :: Removing temporary layer"
			QgsMapLayerRegistry.instance().removeMapLayer(self.layer.id()) 
		except AttributeError:
			return

	def layerDeleted(self):
		self.layer = False

	def createMemoryLayer(self):	
		self.layer = QgsVectorLayer("LineString?crs=EPSG:21781&field=x:double&field=y:double&field=radius:double&field=precision:double&index=yes", "Intersect", "memory") 
		QgsMapLayerRegistry.instance().addMapLayer(self.layer) 
		QObject.connect( self.layer, SIGNAL("layerDeleted()") , self.layerDeleted )
		
	def distanceStart(self):
		canvas = self.iface.mapCanvas()
		if self.distanceAction.isChecked() is False:
			canvas.unsetMapTool(self.getDistancePoint)
			return
		self.distanceAction.setChecked( True )
		if self.layer is False:
			self.createMemoryLayer()
		self.getDistancePoint = getPoint(canvas)
		QObject.connect(self.getDistancePoint , SIGNAL("canvasClickedWithModifiers") , self.distanceOnCanvasClicked ) 
		canvas.setMapTool(self.getDistancePoint)
		QObject.connect( canvas, SIGNAL( "mapToolSet(QgsMapTool *)" ), self.distanceToolChanged)
		
	def distanceOnCanvasClicked(self, point, button, modifiers):
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
			f.setGeometry(QgsGeometry.fromPolyline( [QgsPoint(point.x()+radius*math.cos(math.pi/180*a),point.y()+radius*math.sin(math.pi/180*a)) for a in range(0,360,1)] ))
			f.setAttributeMap( {0: QVariant(point.x()),
								1: QVariant(point.y()),
								2: QVariant(radius),
								3: QVariant(precision)} )
			self.layer.dataProvider().addFeatures( [f] )
			self.layer.updateExtents()
			canvas.refresh()
		
	def distanceToolChanged(self, tool):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.distanceToolChanged)
		self.distanceAction.setChecked( False )
		self.iface.mapCanvas().unsetMapTool(self.getDistancePoint)
		
	def intersectStart(self):
		canvas = self.iface.mapCanvas()
		if self.intersectAction.isChecked() is False:
			canvas.unsetMapTool(self.getIntersectPoint)
			return
		if self.layer is False:
			self.intersectAction.setChecked(False)
			return
		self.intersectAction.setChecked( True )
		self.getIntersectPoint = getPoint(canvas)
		QObject.connect(self.getIntersectPoint , SIGNAL("canvasClickedWithModifiers") , self.intersectOnCanvasClicked ) 
		canvas.setMapTool(self.getIntersectPoint)
		QObject.connect( canvas, SIGNAL( "mapToolSet(QgsMapTool *)" ), self.intersectToolChanged)

	def intersectOnCanvasClicked(self, point, button, modifiers):
		if button != Qt.LeftButton:
			return
		canvas = self.iface.mapCanvas()
		point = canvas.mapRenderer().mapToLayerCoordinates(self.layer, point)
		xyrp = self.getCircles(point)
		intersectSolution = intersect_wls(point,xyrp)		
		print intersectSolution.getIntersection()	

	def intersectToolChanged(self, tool):
		QObject.disconnect( self.iface.mapCanvas(), SIGNAL( "mapToolSet(QgsMapTool *)" ), self.intersectToolChanged)
		self.intersectAction.setChecked( False )
		self.iface.mapCanvas().unsetMapTool(self.getIntersectPoint)
		
	def getCircles(self,point):
		mapTolerance = 0.6 # in meters
		rect = QgsRectangle(point.x()-mapTolerance,point.y()-mapTolerance,point.x()+mapTolerance,point.y()+mapTolerance)
		provider = self.layer.dataProvider()
		ix = provider.fieldNameIndex('x')
		iy = provider.fieldNameIndex('y')
		ir = provider.fieldNameIndex('radius')
		ip = provider.fieldNameIndex('precision')
		provider.select([ix,iy,ir,ip], rect, True, True)
		xyrp = []
		f = QgsFeature()
		self.rubber.reset()
		while (provider.nextFeature(f)):
			fm = f.attributeMap()
			x = fm[ix].toDouble()
			y = fm[iy].toDouble()
			r = fm[ir].toDouble()
			p = fm[ip].toDouble()
			xyrp.append([QgsPoint(x[0],y[0]),r[0],p[0]])
			self.rubber.addGeometry(f.geometry(),self.layer)
		return xyrp
		
class getPoint(QgsMapToolEmitPoint):
	def __init__(self, canvas):
		QgsMapToolEmitPoint.__init__(self, canvas)

	def canvasPressEvent(self, mouseEvent):
		point = self.toMapCoordinates( mouseEvent.pos() )
		self.emit( SIGNAL( "canvasClickedWithModifiers" ), point, mouseEvent.button(), mouseEvent.modifiers() )	
		
		
	
		

