"""
Triangulation QGIS plugin
Denis Rouzaud
denis.rouzaud@gmail.com
Jan. 2012

qWat - qgis water module
"""

# -*- coding: utf-8 -*-
# Import the PyQt and QGIS libraries
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *


class Pipe:
	def __init__(self, dialog, layerId, featureId):
		self.dialog = dialog
		self.layerId = layerId
		self.featureId = featureId
			
