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
from ui_PipeMerger import Ui_PipeMerger



try:
    _fromUtf8 = QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

# create the dialog for zoom to point
class PipeMerger( QDialog , Ui_PipeMerger ):
	def __init__(self , layer, iface ):
		self.iface = iface
		self.layer = layer
		QDialog.__init__(self)
		# Set up the user interface from Designer.
		self.setupUi(self)
		self.progressBar.hide()
		self.parentStatus.setCurrentIndex(2)
		self.schemaForceView.setCurrentIndex(3)

	@pyqtSignature("on_searchButton_clicked()")
	def on_searchButton_clicked(self):
	
		# Disable select button
		self.selectButton.setEnabled(False)
		self.selectButton.setText(QApplication.translate("PipeMerger", "Select", None, QApplication.UnicodeUTF8))
		
		# Provider setup
		provider = self.layer.dataProvider()
		provider.rewind()
		fieldmap = provider.fields()
		field_idparent           = provider.fieldNameIndex('id_parent')
		field_schemaFunctionView = provider.fieldNameIndex('function_schema_view')
		field_schemaForceView    = provider.fieldNameIndex('schema_force_view')
		
		# count pipes in layer
		nPipes = provider.featureCount()
			
		# Init progress bar
		self.progressBar.show()
		self.progressBar.setMinimum(0)
		self.progressBar.setMaximum(nPipes)
		self.progressBar.setValue(0)
	
		#for (k,attr) in fieldmap.iteritems():      
		#	print k,attr.name()
		
		# select elements
		provider.select([field_idparent,field_schemaFunctionView,field_schemaForceView])
		
		# initialize subset
		self.pipeSubset = []
		
		# schemaFunctionView: 0: visible, 1: invisible, 2: All
		schemaFunctionView = self.schemaFunctionView.currentIndex()
		# schema_force_view: 0: auto, 1: visible, 2: invisible, 3: All
		schemaForceView = self.schemaForceView.currentIndex()
		# parentStatus: 0: has a parent, 1: has no parent, 2: All
		parentStatus = self.parentStatus.currentIndex()
		distance_threshold = self.distanceBox.value()
		
		if schemaFunctionView == 2:
			VschemaFunctionView = ''
		elif schemaFunctionView == 0:
			VschemaFunctionView = 't'
		elif schemaFunctionView == 1:
			VschemaFunctionView = 'f'

		
		# register invalid geometry and count successed pipes 
		invalidPipes = [];
		k = 0;
		
		# browse all pipes
		f = QgsFeature()
		while (provider.nextFeature(f)):
			geom = f.geometry()
			k+=1;
			self.progressBar.setValue(k)
			
			if geom.isGeosValid():
				fieldmap=f.attributeMap()
				if schemaFunctionView == 2 or fieldmap[field_schemaFunctionView] == VschemaFunctionView:
					if (parentStatus == 2 ) or (parentStatus == 1 and fieldmap[field_idparent] != '') or (parentStatus == 2 and fieldmap[field_idparent] == ''):
						if schemaForceView == 3 or schemaForceView == fieldmap[field_schemaForceView]:
								if geom.length() < distance_threshold:
									self.pipeSubset.append(f.id())
			else:
				#print "error"
				#self.pipeSubset.append(f.id())
				invalidPipes.append(f.id())
		if len(invalidPipes)>0:
			QMessageBox.warning( self, "qWat Pipe Merger", QApplication.translate("PipeMerger", "The layer has %u pipes with an invalid geometry. IDs: %s" % (len(invalidPipes),str(invalidPipes)), None, QApplication.UnicodeUTF8) )

		# finishing
		self.progressBar.hide()
	
		
		if k-1 > 0:
			# Disable select button
			self.selectButton.setEnabled(True)
			self.selectButton.setText(QApplication.translate("PipeMerger", "Select %u pipes" % (len(self.pipeSubset)), None, QApplication.UnicodeUTF8))
		else:
			QMessageBox.warning( self, "qWat Pipe Merger", QApplication.translate("PipeMerger", "No pipe found with chosen criteria", None, QApplication.UnicodeUTF8) )


		
		
	@pyqtSignature("on_cancelButton_clicked()")
	def on_cancelButton_clicked(self):
		self.close()

	@pyqtSignature("on_selectButton_clicked()")
	def on_selectButton_clicked(self):
		if len(self.pipeSubset) > 0:
			self.layer.setSelectedFeatures(self.pipeSubset) # SELECT ALL SUBSET
			self.close()
		else:
			QMessageBox.warning( self, "qWat Pipe Merger", "No pipe found for chosen criteria" )
			return
			
			
	
        
        
