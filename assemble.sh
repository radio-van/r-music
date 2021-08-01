#!/bin/sh

APP='music'

echo 'Assembling application.zip...'
[ -f application.zip ] && mv -f ./application.zip ./application.zip.bak
7z a application.zip assets icons index.html LICENSE.txt manifest.webapp

echo 'Assembling r-'"$APP"'.zip...'
[ -f r-${APP}.zip ] && mv -f ./r-${APP}.zip ./r-${APP}.zip.bak
7z a r-${APP}.zip application.zip metadata.json

echo 'Uploading r-'"$APP"'.zip...'
adb push r-${APP}.zip /storage/emulated/downloads/

echo 'Done'
