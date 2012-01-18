"""
/***************************************************************************
 qWat Pipe Merger
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
from ui_pipeSearch import Ui_pipeSearch

try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s


class pipeSearch( QDialog , Ui_pipeSearch ):
	def __init__(self , layer, iface ):
		self.iface = iface
		self.layer = layer
		QDialog.__init__(self)
		# Set up the user interface from Designer.
		self.setupUi(self)
		self.progressBar.hide()

	@pyqtSignature("on_searchButton_clicked()")
	def on_searchButton_clicked(self):
	
		# Disable select button
		self.selectButton.setEnabled(False)
		self.selectButton.setText(QApplication.translate("PipeSearch", "Select", None, QApplication.UnicodeUTF8))
		
		# Provider setup
		provider = self.layer.dataProvider()
		provider.rewind()
		fieldmap = provider.fields()
		# count pipes in layer
		nPipes = provider.featureCount()
			
		# Init progress bar
		self.progressBar.show()
		self.progressBar.setMinimum(0)
		self.progressBar.setMaximum(nPipes)
		self.progressBar.setValue(0)
	
		#for (k,attr) in fieldmap.iteritems():      
		#	print k,attr.name()
		
		# compute search fields from form
		[searchGeom,searchAttrEqual,searchAttrNotEqual] = self.fillSearch(provider)
		
		# extact list of attribute indexes to select
		idx2select = [];
		for item in searchAttrEqual: 
			idx2select.append(item[0]) # field index, value
		for item in searchAttrNotEqual: 
			idx2select.append(item[0]) # field index, value

		# select elements
		provider.select(idx2select)

		# perform search
		[self.pipeSubset,invalidGeomSubset] = self.performSearch(provider,searchGeom,searchAttrEqual,searchAttrNotEqual)

		if len(invalidGeomSubset)>0:
			QMessageBox.warning( self, "qWat Pipe Search", QApplication.translate("PipeSearch", "The layer has %u pipes with an invalid geometry. IDs: %s" % (len(invalidPipes),str(invalidPipes)), None, QApplication.UnicodeUTF8) )

		# finishing
		self.progressBar.hide()
			
		if len(self.pipeSubset) > 0:
			# Disable select button
			self.selectButton.setEnabled(True)
			self.selectButton.setText(QApplication.translate("PipeSearch", "Select %u pipes" % (len(self.pipeSubset)), None, QApplication.UnicodeUTF8))
		else:
			QMessageBox.warning( self, "qWat Pipe Search", QApplication.translate("PipeSearch", "No pipe found with chosen criteria", None, QApplication.UnicodeUTF8) )
		
	@pyqtSignature("on_cancelButton_clicked()")
	def on_cancelButton_clicked(self):
		self.close()

	@pyqtSignature("on_selectButton_clicked()")
	def on_selectButton_clicked(self):
		if len(self.pipeSubset) > 0:
			self.layer.setSelectedFeatures(self.pipeSubset)
			self.close()
		
	def fillSearch(self,provider):
		# init search lists
		searchGeom = [] # function, test(</=/>), value
		searchAttrEqual = [] # field index, value
		searchAttrNotEqual = [] # field index, value
				
		
		# **************************************************************
		# Geometry
		# --------
		# Length 
		if self.geomLengthCheck.isChecked():
			searchGeom.append(['length()',self.geomLengthModeCombo.currentText(),self.geomLengthValueSpin.value()])
		# **************************************************************
		# Schematic view
		# --------------
		# parent status (pipe already has a parent or not)
		if self.schemaParentCheck.isChecked():
			fix = provider.fieldNameIndex('id_parent')
			if self.schemaParentCombo.currentIndex() == 0:
				searchAttrNotEqual.append([fix,''])
			else:
				searchAttrEqual.append([fix,''])
		# pipe's function is visible or not in schematic view
		if self.schemaFunctionCheck.isChecked():
			fix = provider.fieldNameIndex('_function_schema_view')
			if self.schemaFunctionCombo.currentIndex() == 0:
				val = 't' # 0::visible => true
			else:
				val = 'f' # 1::invisible => false
			searchAttrEqual.append([fix,val])
		# pipe attribute to override function view
		if self.schemaForceCheck.isChecked():
			fix = provider.fieldNameIndex('schema_force_view')
			val = self.schemaForceCombo.currentIndex() # 0: auto, 1: visible, 2: invisible
			searchAttrEqual.append([fix,val])
		return searchGeom,searchAttrEqual,searchAttrNotEqual
		
	def performSearch(self,provider,searchGeom,searchAttrEqual,searchAttrNotEqual):
		subset = []

		# register invalid geometry and count successed pipes 
		invalidGeomSubset = [];
		isGeomNeeded = False
		if len(searchGeom)>0:
			isGeomNeeded = True
		
		# browse all pipes
		f = QgsFeature()
		geom = []
		k = 0
		while (provider.nextFeature(f)):
			k+=1
			self.progressBar.setValue(k)
			fieldmap=f.attributeMap()
			success = True
			if isGeomNeeded:
				geom = f.geometry()
				if geom.isGeosValid():
					for [func,test,val] in searchGeom:
						if eval("geom.%s %s %f" % (func,test,val)) is not True:
							success = False
							break
				else:
					#print "error"
					#self.pipeSubset.append(f.id())
					invalidGeomSubset.append(f.id())
			if success is not True: continue				
			for [idx,val] in searchAttrEqual:
				if fieldmap[idx] != val:
					success = False
					break
			if success is not True:	continue
			for [idx,val] in searchAttrNotEqual:
				if fieldmap[idx] == val:
					success = False
					break
			if success is True:
				subset.append(f.id())

		return subset,invalidGeomSubset
		
		
		
			
			

	
        
        
