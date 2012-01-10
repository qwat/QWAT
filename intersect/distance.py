"""
/***************************************************************************
  intersect - distance dialog
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
from ui_distance import Ui_distanceDialog

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

# create the dialog to connect layers
class distance(QDialog, Ui_distanceDialog ):
	def __init__(self,point):
		QDialog.__init__(self)
		# Set up the user interface from Designer.
		self.setupUi(self)
		
		self.x.setText("%.3f" % point.x())
		self.y.setText("%.3f" % point.y())
		
		
			
