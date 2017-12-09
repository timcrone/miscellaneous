#!/bin/bash
FILE=`echo $1 | awk -F".aax" '{print $1}'`
ID=$RANDOM
ACTIVATION="YOU HAVE TO FIND THIS SOMEWHERE ELSE"
ffmpeg -activation_bytes $ACTIVATION -i $FILE.aax -vn -c:a copy $FILE.m4a
mv $FILE.m4{a,b}
#
#TITLE=`ffprobe -show_format $FILE.m4b 2> /dev/null | grep TAG:title | awk -F= '{print $2}' | awk -F\[ '{print $1}' | awk -F\( '{print $1}' | sed 's/[ \t]*$//'`

TITLE=`ffprobe -show_format $FILE.m4b 2> /dev/null | grep TAG:title | awk -F= '{print $2}' | sed 's/(Unabridged) //' | sed 's/[:\(\)]/-/g' | awk -F\[ '{print $1}' | sed 's/[ \t]*$//'`

AUTHOR=`ffprobe -show_format $FILE.m4b 2> /dev/null | grep TAG:artist | awk -F= '{print $2}' | awk -F' ' '{printf $NF ", " ; for (i=1; i<NF; i++) printf $i " " ; print ""}' | sed 's/[ \t]*$//'`
mv -f $FILE.m4b "$AUTHOR - $TITLE.m4b"
#if [ $? -eq 0 ]; then rm $FILE.aax ; fi

