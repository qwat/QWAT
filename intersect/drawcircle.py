"""
/***************************************************************************
 qWat Connect Layers
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
import math
from qgis.core import *


# create the dialog to connect layers
class drawCircle:
	def __init__(self,point,radius):
		self.x = point.x()
		self.y = point.y()
		self.radius = radius
		
	def getGeometry(self):
		return QgsGeometry.fromPolyline( [QgsPoint(self.x+self.radius*math.cos(math.pi/180*a),self.y+self.radius*math.sin(math.pi/180*a)) for a in range(0,360,1)] )
		"""for a in range(0,360,1):
			x = self.x + self.radius * math.cos(math.pi/180*a)
			y = self.y + self.radius * math.sin(math.pi/180*a)
			print x
		"""
		
		
			
