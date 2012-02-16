"""
Triangulation QGIS plugin
Denis Rouzaud
denis.rouzaud@gmail.com
Jan. 2012

qWat - qgis water module
"""
def name():
    return "qWAT"
def description():
    return "Water networkmodule"
def version():
    return "Version 0.1"
def icon():
    return "icon.png"
def qgisMinimumVersion():
    return "1.0"
def classFactory(iface):
    # load Sige class from file Sige
    from qwat import qWat
    return qWat(iface)
