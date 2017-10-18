from PyQt4.QtGui import QComboBox, QWidget

def formOpen(dialog, layer, feature):

    subForms = []

    typeSelector = dialog.findChild(QComboBox, 'installation_type')

    for i in range(0, typeSelector.count()):
        widgetName = typeSelector.itemData(i)
        childWidget = dialog.findChild(QWidget, widgetName)
        subForms.append(childWidget)

    def typeSelection(index):
        for i, widget in enumerate(subForms):
            widget.setVisible(i == index)

    typeSelector.currentIndexChanged.connect(typeSelection)
    typeSelection(typeSelector.currentIndex())


