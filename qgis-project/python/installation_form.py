from PyQt4.QtGui import QComboBox, QWidget

subForms = []


def formOpen(dialog, layer, feature):

    typeSelector = dialog.findChild(QComboBox, 'installation_type')
    typeSelector.currentIndexChanged.connect(typeSelection)

    for i in range(0, typeSelector.count()):
        widgetName = typeSelector.itemData(i)
        childWidget = dialog.findChild(QWidget, widgetName)
        subForms.append(childWidget)

    typeSelection(typeSelector.currentIndex())


def typeSelection(index):
    for i, widget in enumerate(subForms):
        widget.setVisible(i == index)
