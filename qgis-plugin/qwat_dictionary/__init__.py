# -*- coding: utf-8 -*-
"""
/***************************************************************************
 qwat_dictionary
                                 A QGIS plugin
 provide tranlation for qwat ui
                             -------------------
        begin                : 2014-12-15
        copyright            : (C) 2014 by Catalin Proteasa
        email                : iterator.office@gmail.com
        git sha              : $Format:%H$
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 This script initializes the plugin, making it known to QGIS.
"""


# noinspection PyPep8Naming
def classFactory(iface):  # pylint: disable=invalid-name
    """Load qwat_dictionary class from file qwat_dictionary.

    :param iface: A QGIS interface instance.
    :type iface: QgsInterface
    """
    #
    from .qwat_dictionary import qwat_dictionary
    return qwat_dictionary(iface)
