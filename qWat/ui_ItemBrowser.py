# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file '/home/denis/Documents/qWat/qWat/ui_ItemBrowser.ui'
#
# Created: Tue Dec 20 11:06:31 2011
#      by: PyQt4 UI code generator 4.8.5
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_ItemBrowser(object):
    def setupUi(self, ItemBrowser):
        ItemBrowser.setObjectName(_fromUtf8("ItemBrowser"))
        ItemBrowser.resize(389, 254)
        ItemBrowser.setWindowTitle(_fromUtf8("Title"))
        self.dockWidgetContents = QtGui.QWidget()
        self.dockWidgetContents.setObjectName(_fromUtf8("dockWidgetContents"))
        self.gridLayout_3 = QtGui.QGridLayout(self.dockWidgetContents)
        self.gridLayout_3.setObjectName(_fromUtf8("gridLayout_3"))
        self.browseFrame = QtGui.QFrame(self.dockWidgetContents)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.browseFrame.sizePolicy().hasHeightForWidth())
        self.browseFrame.setSizePolicy(sizePolicy)
        self.browseFrame.setAutoFillBackground(False)
        self.browseFrame.setFrameShape(QtGui.QFrame.StyledPanel)
        self.browseFrame.setObjectName(_fromUtf8("browseFrame"))
        self.gridLayout_2 = QtGui.QGridLayout(self.browseFrame)
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.previousButton = QtGui.QPushButton(self.browseFrame)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.previousButton.sizePolicy().hasHeightForWidth())
        self.previousButton.setSizePolicy(sizePolicy)
        self.previousButton.setMaximumSize(QtCore.QSize(21, 16777215))
        self.previousButton.setText(QtGui.QApplication.translate("ItemBrowser", "<", None, QtGui.QApplication.UnicodeUTF8))
        self.previousButton.setObjectName(_fromUtf8("previousButton"))
        self.gridLayout_2.addWidget(self.previousButton, 0, 0, 1, 1)
        self.listCombo = QtGui.QComboBox(self.browseFrame)
        self.listCombo.setEditable(True)
        self.listCombo.setObjectName(_fromUtf8("listCombo"))
        self.gridLayout_2.addWidget(self.listCombo, 0, 1, 1, 1)
        self.nextButton = QtGui.QPushButton(self.browseFrame)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.nextButton.sizePolicy().hasHeightForWidth())
        self.nextButton.setSizePolicy(sizePolicy)
        self.nextButton.setMaximumSize(QtCore.QSize(21, 16777215))
        self.nextButton.setText(QtGui.QApplication.translate("ItemBrowser", ">", None, QtGui.QApplication.UnicodeUTF8))
        self.nextButton.setObjectName(_fromUtf8("nextButton"))
        self.gridLayout_2.addWidget(self.nextButton, 0, 4, 1, 1)
        self.currentPosLabel = QtGui.QLabel(self.browseFrame)
        self.currentPosLabel.setText(QtGui.QApplication.translate("ItemBrowser", "0/0", None, QtGui.QApplication.UnicodeUTF8))
        self.currentPosLabel.setAlignment(QtCore.Qt.AlignCenter)
        self.currentPosLabel.setObjectName(_fromUtf8("currentPosLabel"))
        self.gridLayout_2.addWidget(self.currentPosLabel, 0, 2, 1, 1)
        self.zoomCheck = QtGui.QCheckBox(self.browseFrame)
        self.zoomCheck.setText(QtGui.QApplication.translate("ItemBrowser", "zoom to current item", None, QtGui.QApplication.UnicodeUTF8))
        self.zoomCheck.setObjectName(_fromUtf8("zoomCheck"))
        self.gridLayout_2.addWidget(self.zoomCheck, 1, 0, 1, 3)
        self.colorButton = QtGui.QToolButton(self.browseFrame)
        font = QtGui.QFont()
        font.setStyleStrategy(QtGui.QFont.PreferDefault)
        self.colorButton.setFont(font)
        self.colorButton.setAutoFillBackground(False)
        self.colorButton.setStyleSheet(_fromUtf8(""))
        self.colorButton.setText(_fromUtf8(""))
        self.colorButton.setObjectName(_fromUtf8("colorButton"))
        self.gridLayout_2.addWidget(self.colorButton, 1, 4, 1, 1)
        self.gridLayout_3.addWidget(self.browseFrame, 0, 0, 1, 1)
        ItemBrowser.setWidget(self.dockWidgetContents)

        self.retranslateUi(ItemBrowser)
        QtCore.QMetaObject.connectSlotsByName(ItemBrowser)

    def retranslateUi(self, ItemBrowser):
        pass

