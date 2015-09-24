
from PyQt4 import uic
from PyQt4.QtGui import QComboBox, QWidget

subForms = None

def formOpen(dialog, layer, feature):

	typeSelector = dialog.findChild(QComboBox, 'installation_type')
	
	typeSelector.currentIndexChanged.connect(typeSelection)
	
	insType = typeSelector.property('EWV2Wrapper').value()

	subFormNames = ['chamber',
					'pressurecontrol',
					'pump',
					'source',
					'tank',
					'treatment']

	global subForms
	subForms = []	
	for sfn in subFormNames: 
		childWidget = dialog.findChild(QWidget, sfn)
		childWidget.hide()
		subForms.append(childWidget)
		
					
def typeSelection( index ):        
	for i, widget in enumerate(subForms):
		widget.setVisible( i == index )
