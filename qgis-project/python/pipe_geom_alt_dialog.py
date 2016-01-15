# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'pipe_geom_alt_dialog.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_PipeGeomAltDialog(object):
    def setupUi(self, PipeGeomAltDialog):
        PipeGeomAltDialog.setObjectName(_fromUtf8("PipeGeomAltDialog"))
        PipeGeomAltDialog.resize(461, 196)
        self.gridLayout = QtGui.QGridLayout(PipeGeomAltDialog)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.updateAlt2 = QtGui.QCheckBox(PipeGeomAltDialog)
        self.updateAlt2.setChecked(True)
        self.updateAlt2.setObjectName(_fromUtf8("updateAlt2"))
        self.gridLayout.addWidget(self.updateAlt2, 2, 0, 1, 1)
        self.updateAlt1 = QtGui.QCheckBox(PipeGeomAltDialog)
        self.updateAlt1.setChecked(True)
        self.updateAlt1.setTristate(False)
        self.updateAlt1.setObjectName(_fromUtf8("updateAlt1"))
        self.gridLayout.addWidget(self.updateAlt1, 1, 0, 1, 1)
        self.buttonBox = QtGui.QDialogButtonBox(PipeGeomAltDialog)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.gridLayout.addWidget(self.buttonBox, 4, 0, 1, 1)
        self.label = QtGui.QLabel(PipeGeomAltDialog)
        self.label.setWordWrap(True)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gridLayout.addItem(spacerItem, 3, 0, 1, 1)

        self.retranslateUi(PipeGeomAltDialog)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), PipeGeomAltDialog.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), PipeGeomAltDialog.reject)
        QtCore.QMetaObject.connectSlotsByName(PipeGeomAltDialog)

    def retranslateUi(self, PipeGeomAltDialog):
        PipeGeomAltDialog.setWindowTitle(_translate("PipeGeomAltDialog", "Dialog", None))
        self.updateAlt2.setText(_translate("PipeGeomAltDialog", "mettre à jour la la géométrie alternative 2 (schématique)", None))
        self.updateAlt1.setText(_translate("PipeGeomAltDialog", "mettre à jour la la géométrie alternative 1", None))
        self.label.setText(_translate("PipeGeomAltDialog", "Les géométries alternatives de la conduite éditée sont différentes de la géométrie principale. Voulez-vous les mettre à jour ?", None))

