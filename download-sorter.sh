#!/bin/bash

DOWNLOADDIR="/home/dinusha/Downloads"

DOCUMENTDIR="/home/dinusha/Documents"
DOCUMENTS="*.pdf *.chm *.txt *.rtf"
COMPRESSED="*.tar *.gz *.zip *.bz2"
IMAGES="*.jpg *.jpeg *.png *.bmp *.gif *.tiff"
SOUND="*.mp3 *.ogg *.wma *.wav *.mid"
VIDEO="*.avi *.mp4"

#First replace all the files with spaces in the file name with a _
find ${DOWNLOADDIR} -maxdepth 0 -name "* *" -type f | rename 's/ /_/g'

#for file in `ls ${DOWNLOADDIR}`
for ftype in $DOCUMENTS 
do
    for file in `ls ${DOWNLOADDIR}/${ftype} 2>/dev/null`
    do
        echo "Moving file [${file}] to [${DOCUMENTDIR}]"
        mv  "${file}" "${DOCUMENTDIR}/"
        #echo
    done
done

