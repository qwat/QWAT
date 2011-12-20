# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file '/home/denis/Documents/qWat/qWat/ui_ConnectLayers.ui'
#
# Created: Tue Dec 20 09:39:55 2011
#      by: PyQt4 UI code generator 4.8.5
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_ConnectLayers(object):
    def setupUi(self, ConnectLayers):
        ConnectLayers.setObjectName(_fromUtf8("ConnectLayers"))
        ConnectLayers.resize(244, 201)
        ConnectLayers.setWindowTitle(QtGui.QApplication.translate("ConnectLayers", "Dialog", None, QtGui.QApplication.UnicodeUTF8))
        self.gridLayout = QtGui.QGridLayout(ConnectLayers)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.pipeslabel = QtGui.QLabel(ConnectLayers)
        self.pipeslabel.setText(QtGui.QApplication.translate("ConnectLayers", "Pipes", None, QtGui.QApplication.UnicodeUTF8))
        self.pipeslabel.setObjectName(_fromUtf8("pipeslabel"))
        self.gridLayout.addWidget(self.pipeslabel, 0, 0, 1, 1)
        self.label_2 = QtGui.QLabel(ConnectLayers)
        self.label_2.setText(QtGui.QApplication.translate("ConnectLayers", "Valves", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        self.buttonBox = QtGui.QDialogButtonBox(ConnectLayers)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 2, 1, 1, 1)
        self.pipesCombo = QtGui.QComboBox(ConnectLayers)
        self.pipesCombo.setObjectName(_fromUtf8("pipesCombo"))
        self.gridLayout.addWidget(self.pipesCombo, 0, 1, 1, 1)
        self.valvesCombo = QtGui.QComboBox(ConnectLayers)
        self.valvesCombo.setObjectName(_fromUtf8("valvesCombo"))
        self.gridLayout.addWidget(self.valvesCombo, 1, 1, 1, 1)

        self.retranslateUi(ConnectLayers)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), ConnectLayers.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), ConnectLayers.reject)
        QtCore.QMetaObject.connectSlotsByName(ConnectLayers)
        ConnectLayers.setTabOrder(self.buttonBox, self.pipesCombo)
        ConnectLayers.setTabOrder(self.pipesCombo, self.valvesCombo)

    def retranslateUi(self, ConnectLayers):
        pass

