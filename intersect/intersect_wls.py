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
class intersect_wls:
	def __init__(self,xyrp):
		for l in xyrp:
			print l
			
			
			
	def twoCirclesIntersect(self,c1,c2):
		# cf http://www.mathpages.com/home/kmath396/kmath396.htm
		[x1,y1,r1,p1] = c1
		[x2,y2,r2,p2] = c2
		
		d = pointDistance(x1,y1,x2,y2)
		if d<math.abs(r1-r2):
			# circle is within the other
			return
		while d>r1+r2:
			# no solution: circles are separate, let's increase radius to get a point
			r1+=.01
			r2+=.01
	
		a = .25*math.sqrt( (d+r1+r2) * (d+r1-r2) * (d-r1+r2) * (-d+r1+r2) )
		
		xrt = 2*(y1-y2)*a/(d*d)
		yrt = 2*(x1-x2)*a/(d*d)
		
		xlt = (x1+x2)/2 - (x1-x2)(r1*r1-r2*r2)/(2*d*d)
		ylt = (y1+y2)/2 - (y1-y2)(r1*r1-r2*r2)/(2*d*d)
		
		
			
			
	def pointDistance(x1,y1,x2,y2):
		return math.sqrt(  math.pow(x1-x2,2) + math.pow(y1-y2,2)  )
		
