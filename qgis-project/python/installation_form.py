
from PyQt4 import uic
from PyQt4.QtGui import QComboBox, QWidget

def formOpen(dialog, layer, feature):

	typeSelector = dialog.findChild(QComboBox, 'installation_type')
	insType = typeSelector.property('EWV2Wrapper').value()

	subForms = ['chamber',
	            'pressurecontrol',
	            'pump',
	            'source',
	            'tank',
	            'treatment']

	subForms.remove(insType)

	for sf in subForms:
		childWidget = dialog.findChild(QWidget, sf)
		childWidget.hide()

