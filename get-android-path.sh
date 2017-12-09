#!/bin/sh
# $0 install-path
mkdir -p /tmp/$1/
cd /tmp/$1/
for i in `adb ls /sdcard/android/data/$1/files/ | awk '{print $4}' | grep \.aax\$`; do adb pull /sdcard/android/data/$1/files/$i ; if [ $? -ne 0 ] ; then rm $i; fi ; done
#find . -name \*.aax -exec ~/bin/aa-to-m4b.sh {} \;
