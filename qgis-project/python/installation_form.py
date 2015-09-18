
from PyQt4 import uic
from PyQt4.QtGui import QComboBox, QWidget
from qgis.core import QgsProject

def formOpen(dialog, layer, feature):
	
	typeSelector = dialog.findChild(QComboBox, 'installation_type')
	insType = typeSelector.property('EWV2Wrapper').value()
	
	childWidgetContent = uic.loadUi("%s/ui_forms/%s.ui" % (QgsProject.instance().readPath("./"), insType))
	childWidget = dialog.findChild(QWidget, 'childWidget')
	
	childWidget.layout().addWidget(childWidgetContent)
