# -*- coding: utf-8 -*-
"""
/***************************************************************************
 qwat_dictionaryDialog
                                 A QGIS plugin
 provide tranlation for qwat ui
                             -------------------
        begin                : 2014-12-15
        git sha              : $Format:%H$
        copyright            : (C) 2014 by Catalin Proteasa
        email                : iterator.office@gmail.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

import os

from PyQt4 import QtGui, uic
from PyQt4 import QtCore
from PyQt4.QtGui import QMessageBox
from PyQt4.QtGui import QPixmap
from PyQt4.QtGui import QIcon

from qgis.core import QgsApplication
try:
    from PyQt4.QtCore import QString
except ImportError:
    # we are using Python3 so QString is not defined
    QString = str


import os,glob,sys


FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'qwat_dictionary_dialog_base.ui'))


def get_locale_from_dictionary_filename(sufix,ext,filename):
    filename = os.path.splitext(os.path.basename(filename))[0]
    filename = filename.replace(sufix,"")
    filename = filename.replace(ext,"")
    return filename



def get_denumire_tara(nume_file_qm):
    print nume_file_qm

    if nume_file_qm == "ro" :
        return 'Română'
    if nume_file_qm == "en" :
        return "English"
    if nume_file_qm == "fra" :
        return "Français"
    return nume_file_qm

def get_denumire_flag_from_locale(nume_file_qm):
    if nume_file_qm == "ro" :
        return "ro"
    if nume_file_qm == "en" :
        return "en"
    if nume_file_qm == "en_US" :
        return "en"
    if nume_file_qm == "fra" :
        return "fr"
    return nume_file_qm


def get_denumire_dictionar(denumire_tara,_file):
    localePath = os.path.dirname(_file)+'/i18n/'+denumire_tara+'.qm'
    return localePath



class qwat_dictionaryDialog(QtGui.QDialog, FORM_CLASS):
    def __init__(self, parent=None):
        """Constructor."""
        super(qwat_dictionaryDialog, self).__init__(parent)
        # Set up the user interface from Designer.
        # After setupUI you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect
        self.setupUi(self)

        reload(sys)
        sys.setdefaultencoding('utf8')

        #config_file - last language selected
        self.config_file =os.path.join(os.path.dirname(__file__), '')
        self.config_file =  self.config_file + "settings.cfg"

        self.lista_dictionare = []
        self.init_combo()

        self.f_get_start_option()

        self.translator = QtCore.QTranslator()

        localePath = self.lista_dictionare[self.m_comboBox_limbaj.currentIndex()]

        if os.path.exists(localePath):
            self.translator.load(localePath)
            QtCore.QCoreApplication.installTranslator(self.translator)
        else:
            print "Translator not found"


        self.retranslate_Ui()

        self.connect(self.m_comboBox_limbaj, QtCore.SIGNAL('currentIndexChanged(const QString &)'),
                     self.signal_m_comboBox_limbaj_changed)

        self.connect(self.m_checkBox_keep_changes,
                     QtCore.SIGNAL('clicked()'), self.signal_m_checkBox_keep_changes)


    def retranslate_Ui(self):
        self.setWindowTitle(QtGui.QApplication.translate("qwat_dictionaryDialogBase", "Qwat Dictionary", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox.setTitle(QtGui.QApplication.translate("qwat_dictionaryDialogBase", "Select language", None, QtGui.QApplication.UnicodeUTF8))
        self.m_checkBox_keep_changes.setText (QtGui.QApplication.translate("qwat_dictionaryDialogBase", "save settings at restart", None, QtGui.QApplication.UnicodeUTF8))


    def init_combo(self):
       self.m_comboBox_limbaj.clear()
       self.lista_dictionare = []
       localePath = os.path.join(os.path.dirname(__file__), 'i18n','*.qm')
       _index = 0
       for file_name in glob.glob(localePath):
            if file_name.endswith('.qm'):
                #print file_name
                _str_initial = os.path.splitext(os.path.basename(file_name))[0]
                _dict_name = get_denumire_dictionar(_str_initial,__file__)
                #QMessageBox.critical(self, "DICTIONAR NAME FAZA 1", _dict_name, QMessageBox.Ok)
                self.lista_dictionare.append(_dict_name)

                _icon = QIcon()
                _icon.addFile(self.f_get_icon_path(_index))
                _str = get_denumire_tara(get_locale_from_dictionary_filename("extradictionary_",".qm",file_name))
                self.m_comboBox_limbaj.addItem(_icon, unicode(_str))
                _index = _index + 1


    def f_get_start_option(self):
        self.m_checkBox_keep_changes.setChecked(True)
        print self.config_file
        _f = open(self.config_file,"r")
        _str = _f.read()
        _f.close()
       # QMessageBox.critical(self, "ASTE E IN CONFIG FILE", _str, QMessageBox.Ok)
        if(_str=="-"):
            #default is en
            print "load default"
        else:
            _dict_name = get_denumire_dictionar(os.path.splitext(os.path.basename(_str))[0],__file__)
            #QMessageBox.critical(self, "FICTIONAR DE CAUTAT", _dict_name, QMessageBox.Ok)

            if _dict_name in self.lista_dictionare:
                 self.m_comboBox_limbaj.setCurrentIndex (self.lista_dictionare.index(_dict_name))
            else:
                self.m_comboBox_limbaj.setCurrentIndex (0)
                _str_initial = os.path.splitext(os.path.basename(self.lista_dictionare[0]))[0]
                _str_initial = _str_initial
                self.f_save_curent_state(_str_initial)



    def signal_m_comboBox_limbaj_changed(self,current):
        new_translator_path = self.lista_dictionare[self.m_comboBox_limbaj.currentIndex()]

        new_translator_path_setings = os.path.splitext(os.path.basename(new_translator_path))[0] + '.qm'
        print new_translator_path_setings



        if os.path.exists(new_translator_path):
            self.translator.load(new_translator_path)
            QtCore.QCoreApplication.installTranslator(self.translator)
        else:
            print "signal_m_comboBox_limbaj_changed Translator not found"

        self.f_save_curent_state(new_translator_path_setings)
        self.retranslate_Ui()


    def f_get_icon_path(self,index_dictionar):
        icon_path =os.path.join(os.path.dirname(__file__), '')
        icon_path =  icon_path + "flags/"



        locale  = get_locale_from_dictionary_filename("extradictionary_",".qm",self.lista_dictionare[index_dictionar])
        icon_path = icon_path +get_denumire_flag_from_locale(locale)+".png"
        return icon_path


    def f_save_curent_state(self,text):
        _f = open(self.config_file,"w")
        #QMessageBox.critical(self, "CE SCRIU IN CFG FILE", text, QMessageBox.Ok)
        _f.write(text)
        _f.close()


    def signal_m_checkBox_keep_changes(self):
        if (self.m_checkBox_keep_changes.isChecked() == True):
            _str_initial = os.path.splitext(self.lista_dictionare[self.m_comboBox_limbaj.currentIndex()])[0] + '.qm'
            self.f_save_curent_state(_str_initial)
        else:
            self.f_save_curent_state("-")


