#!/bin/zsh
# Sets an icon on file or directory
# Usage setIcon.sh iconimage.jpg /path/to/[file|folder]
iconSource=$1
iconDestination=$2
icon=/tmp/`basename $iconSource`
rsrc=/tmp/icon.rsrc

cp $iconSource $icon # create icon from the source
sips -i $icon # add icon to image file, meaning use itself as the icon
DeRez -only icns $icon > $rsrc # take that icon and put it into a rsrc file
SetFile -a C $iconDestination # apply the rsrc file to
if [ -f $iconDestination ]; then # destination is a file
    Rez -append $rsrc -o $iconDestination
elif [ -d $iconDestination ]; then # destination is a directory
    touch $iconDestination/$'Icon\r' # create the magical Icon\r file
    Rez -append $rsrc -o $iconDestination/Icon?
    SetFile -a V $iconDestination/Icon?
fi
rm $rsrc $icon # remove temporary files 
