# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui_connectLayers.ui'
#
# Created: Wed Jan 18 10:17:54 2012
#      by: PyQt4 UI code generator 4.8.5
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_connectLayers(object):
    def setupUi(self, connectLayers):
        connectLayers.setObjectName(_fromUtf8("connectLayers"))
        connectLayers.resize(266, 111)
        connectLayers.setWindowTitle(QtGui.QApplication.translate("connectLayers", "qWat :: connect layers", None, QtGui.QApplication.UnicodeUTF8))
        self.gridLayout = QtGui.QGridLayout(connectLayers)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(connectLayers)
        self.label.setText(QtGui.QApplication.translate("connectLayers", "Pipes", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.label_2 = QtGui.QLabel(connectLayers)
        self.label_2.setText(QtGui.QApplication.translate("connectLayers", "Valves", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.buttonBox = QtGui.QDialogButtonBox(connectLayers)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 2, 1, 1, 1)
        self.pipesCombo = QtGui.QComboBox(connectLayers)
        self.pipesCombo.setObjectName(_fromUtf8("pipesCombo"))
        self.gridLayout.addWidget(self.pipesCombo, 0, 1, 1, 1)
        self.valvesCombo = QtGui.QComboBox(connectLayers)
        self.valvesCombo.setObjectName(_fromUtf8("valvesCombo"))
        self.gridLayout.addWidget(self.valvesCombo, 1, 1, 1, 1)

        self.retranslateUi(connectLayers)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), connectLayers.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), connectLayers.reject)
        QtCore.QMetaObject.connectSlotsByName(connectLayers)
        connectLayers.setTabOrder(self.buttonBox, self.pipesCombo)
        connectLayers.setTabOrder(self.pipesCombo, self.valvesCombo)

    def retranslateUi(self, connectLayers):
        pass

