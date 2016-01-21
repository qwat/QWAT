#!/bin/bash

set -e


# make SVG parametrables

rm param_svg/*.svg

for f in *.svg ; do
	cp $f param_svg/$f
	sed -i 's/fill:\#0\+/fill:param(fill) \#000000/g' param_svg/$f
	sed -i 's/stroke:\#0\+/stroke:param(outline) #000000/g' param_svg/$f
done
