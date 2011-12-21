"""
/***************************************************************************
 qWat
                                 A QGIS plugin
 Tools
                              -------------------
        begin                : 2011-12-20
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

from ui_ItemBrowser import Ui_ItemBrowser

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s


class ItemBrowser( QDockWidget , Ui_ItemBrowser ):
	def __init__(self,iface,layer,name):
		self.iface = iface
		self.layer = layer
		# UI setup
		QDockWidget.__init__(self)
		self.setupUi(self)
		self.setWindowTitle(name)
		self.iface.addDockWidget(Qt.LeftDockWidgetArea,self)
		self.setVisible(False)
		# Connect SIGNAL
		QObject.connect(self.layer , SIGNAL("selectionChanged ()"), self.selectionChanged )
		# create rubber band to emphasis the current selected item (over the whole selection)
		self.rubber = QgsRubberBand(self.iface.mapCanvas())
		# initial color for rubber band
		self.rubber.color = QColor(255,0,0,255)
		self.rubber.setColor(self.rubber.color)
		self.colorButton.setStyleSheet("background-color: rgb(255,0,0)")
		
	def unload(self):
		self.iface.removeDockWidget(self)
		
	def selectionChanged(self):
		self.browseFrame.setEnabled(False)
		self.cleanBrowserFields()
		self.rubber.reset()
		nItems = self.layer.selectedFeatureCount()
		if nItems == 0:	print "qWat: Nothing has been selected"; return
		if nItems > 1:  self.setVisible(True)
		self.browseFrame.setEnabled(True)
		self.subset = self.layer.selectedFeaturesIds()
		l = 0
		for id in self.subset:
			self.listCombo.addItem(_fromUtf8(""))
			self.listCombo.setItemText(l, "%u" % id)
			l+= 1		

	def cleanBrowserFields(self):
		self.currentPosLabel.setText('0/0')
		self.listCombo.clear()
		
	def zoomToItem(self,item):
		bobo = item.geometry().boundingBox()
		bobo.scale(5)
		self.iface.mapCanvas().setExtent(bobo)
		self.iface.mapCanvas().refresh()	

	def getCurrentItem(self):
		item = QgsFeature()
		i = self.listCombo.currentIndex()
		self.layer.featureAtId(self.subset[i],item)
		return item	
	

	@pyqtSignature("on_previousButton_clicked()")
	def on_previousButton_clicked(self):
		i = self.listCombo.currentIndex()
		n = max(0,i-1)
		self.listCombo.setCurrentIndex(n)
		
	@pyqtSignature("on_nextButton_clicked()")
	def on_nextButton_clicked(self):
		i = self.listCombo.currentIndex()
		c = self.listCombo.count()
		n = min(i+1,c-1)
		self.listCombo.setCurrentIndex(n)

	@pyqtSignature("on_listCombo_currentIndexChanged(int)")
	def on_listCombo_currentIndexChanged(self,i):
		item = self.getCurrentItem()
		# update rubber band
		self.rubber.reset()
		self.rubber.addGeometry(item.geometry(),self.layer)
		# zoom to item
		if self.zoomCheck.isChecked():
			self.zoomToItem(item)
		# Update browser
		self.currentPosLabel.setText('%u/%u' % (i+1,len(self.subset)) )
		
	@pyqtSignature("on_zoomCheck_stateChanged(int)")
	def on_zoomCheck_stateChanged(self,i):
		if self.zoomCheck.isChecked():
			# Extract item
			item = self.getCurrentItem()
			# zoom
			self.zoomToItem(item)

	@pyqtSignature("on_editFormButton_clicked()")
	def on_editFormButton_clicked(self):
		# launch edit form
		self.iface.openFeatureForm(self.layer, self.getCurrentItem() )
			
	@pyqtSignature("on_colorButton_clicked()")
	def on_colorButton_clicked(self):
		self.rubber.color = QColorDialog.getColor(self.rubber.color,self)
		self.colorButton.setStyleSheet("background-color: rgb(%u,%u,%u)" % (self.rubber.color.red(),self.rubber.color.green(),self.rubber.color.blue()))
		self.rubber.setColor(self.rubber.color)


