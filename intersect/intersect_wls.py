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

import numpy as np
from numpy import linalg as la



class intersect_wls:
	def __init__(self,initPoint,xyrp):
		self.initPoint = initPoint
		self.xyrp = xyrp
		self.nc = len(xyrp)
		
	def getIntersection(self):
		if self.nc<2:
			print "Intetersect :: not enough circles in tolerance radius"
			return
		elif self.nc==2:
			pts = self.twoCirclesIntersect()
			d1 = pts[0].sqrDist(self.initPoint)
			d2 = pts[1].sqrDist(self.initPoint)
			print d1
			print d2
			if d1<d2:
				return pts[0]
			else:
				return pts[1]
		else:
			self.leastSquares()
			
	def leastSquares(self):
		threshold = .002 # in meters
		# initial parameters
		x0  = np.array( [ self.initPoint.x() , self.initPoint.y() ] )
		print "Initial: %f,%f" % (x0[0],x0[1])
		dx = [10,10]
		while max(dx)>threshold:
			# jacobian for parameters
			A   = np.array( [ [2*self.initPoint.x()-2*c[0].x(),2*self.initPoint.y()-2*c[0].y()] for c in self.xyrp ] )
			# jacobian for observations
			B   = np.diag( [ -2*c[1] for c in self.xyrp ] )
			# stochastic model
			q   = [math.pow(c[2],2)   for c in self.xyrp ] 	
			Qll = np.diag(q)
			Pm  = np.dot( B , np.dot(Qll,B.T) )
			P   = la.inv( Pm )
			# misclosure
			w   = np.array([ math.pow(x0[0]-c[0].x(),2) + math.pow(x0[1]-c[0].y(),2) - math.pow(c[1],2) for c in self.xyrp ])
			# normal matrix
			N = np.dot( A.T , np.dot(P,A) )
			u = np.dot( A.T , np.dot(P,w) )
			# QR decomposition
			q,r = la.qr(N)
			p   = np.dot(q.T,u)
			dx  = np.dot(la.inv(r),p)
			x0 -= dx
			print "Correction: %f,%f" % (dx[0],dx[1])
		print "Solution: %f,%f" % (x0[0],x0[1])
						
	def twoCirclesIntersect(self):
		# cf http://www.mathpages.com/home/kmath396/kmath396.htm
		[pt1,r1,p1] = self.xyrp[0]
		[pt2,r2,p2] = self.xyrp[1]
		x1 = pt1.x()
		y1 = pt1.y()
		x2 = pt2.x()
		y2 = pt2.y()
		d = math.sqrt( pt1.sqrDist(pt2) )
		if d<math.fabs(r1-r2):
			# circle is within the other
			return
		if d>r1+r2:
			print "Intersect :: circles are separate, scaling radius to get intersection"
			s = d/(r1+r2)
			r1*=s
			r2*=s
		a = math.sqrt( (d+r1+r2) * (d+r1-r2) * (d-r1+r2) * (-d+r1+r2) ) / 4
		xlt = (x1+x2)/2.0 - (x1-x2)*(r1*r1-r2*r2)/(2.0*d*d)
		ylt = (y1+y2)/2.0 - (y1-y2)*(r1*r1-r2*r2)/(2.0*d*d)
		xrt = 2.0*(y1-y2)*a/(d*d)
		yrt = 2.0*(x1-x2)*a/(d*d)
		xa = xlt + xrt
		ya = ylt - yrt
		xb = xlt - xrt
		yb = ylt + yrt
		return [QgsPoint(xa,ya),QgsPoint(xb,yb)]
		
		
		
