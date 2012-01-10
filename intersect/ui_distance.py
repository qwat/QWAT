# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui_distance.ui'
#
# Created: Tue Jan 10 13:53:30 2012
#      by: PyQt4 UI code generator 4.8.5
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_distanceDialog(object):
    def setupUi(self, distanceDialog):
        distanceDialog.setObjectName(_fromUtf8("distanceDialog"))
        distanceDialog.resize(201, 177)
        distanceDialog.setWindowTitle(QtGui.QApplication.translate("distanceDialog", "Distance", None, QtGui.QApplication.UnicodeUTF8))
        self.gridLayout = QtGui.QGridLayout(distanceDialog)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(distanceDialog)
        self.label.setText(QtGui.QApplication.translate("distanceDialog", "Distance", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 2, 1, 1, 1)
        self.distance = QtGui.QDoubleSpinBox(distanceDialog)
        self.distance.setDecimals(3)
        self.distance.setMaximum(999.99)
        self.distance.setSingleStep(1.0)
        self.distance.setObjectName(_fromUtf8("distance"))
        self.gridLayout.addWidget(self.distance, 2, 2, 1, 1)
        self.label_3 = QtGui.QLabel(distanceDialog)
        self.label_3.setText(QtGui.QApplication.translate("distanceDialog", "m", None, QtGui.QApplication.UnicodeUTF8))
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.gridLayout.addWidget(self.label_3, 2, 3, 1, 1)
        self.label_2 = QtGui.QLabel(distanceDialog)
        self.label_2.setText(QtGui.QApplication.translate("distanceDialog", "Precision", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 3, 1, 1, 1)
        self.precision = QtGui.QDoubleSpinBox(distanceDialog)
        self.precision.setDecimals(1)
        self.precision.setProperty("value", 5.0)
        self.precision.setObjectName(_fromUtf8("precision"))
        self.gridLayout.addWidget(self.precision, 3, 2, 1, 1)
        self.label_4 = QtGui.QLabel(distanceDialog)
        self.label_4.setText(QtGui.QApplication.translate("distanceDialog", "mm", None, QtGui.QApplication.UnicodeUTF8))
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.gridLayout.addWidget(self.label_4, 3, 3, 1, 1)
        self.buttonBox = QtGui.QDialogButtonBox(distanceDialog)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 5, 1, 1, 3)
        self.label_5 = QtGui.QLabel(distanceDialog)
        self.label_5.setText(QtGui.QApplication.translate("distanceDialog", "y", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.gridLayout.addWidget(self.label_5, 1, 1, 1, 1)
        self.label_6 = QtGui.QLabel(distanceDialog)
        self.label_6.setText(QtGui.QApplication.translate("distanceDialog", "x", None, QtGui.QApplication.UnicodeUTF8))
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.gridLayout.addWidget(self.label_6, 0, 1, 1, 1)
        self.x = QtGui.QLineEdit(distanceDialog)
        self.x.setEnabled(False)
        self.x.setObjectName(_fromUtf8("x"))
        self.gridLayout.addWidget(self.x, 0, 2, 1, 2)
        self.y = QtGui.QLineEdit(distanceDialog)
        self.y.setEnabled(False)
        self.y.setObjectName(_fromUtf8("y"))
        self.gridLayout.addWidget(self.y, 1, 2, 1, 2)

        self.retranslateUi(distanceDialog)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), distanceDialog.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), distanceDialog.reject)
        QtCore.QMetaObject.connectSlotsByName(distanceDialog)

    def retranslateUi(self, distanceDialog):
        pass

