#!/bin/bash

if [ -z "$1" ]; then
   echo "Please specify sharelink"
   exit
fi

share="$1"
fileName="$2"

link="https://pcorakel.stackstorage.com/s/$share"
dlLink="https://pcorakel.stackstorage.com/public-share/$share/download"

output=`./curl "$link" -D- -s`
token=`echo "$output" | sed 's/>/>\n/g' | grep -i CSRF-TOKEN | sed 's/.*content="//g;s/">//g'`
cookie=`echo "$output" | grep -i Set-Cookie | sed 's/Set-Cookie: /Cookie: /g;s/;.*//g'`

download="archive=zip&all=false&query=&CSRF-Token=$token&paths[]=/$fileName"

./curl "$dlLink" -d "$download" -O -J -H"$cookie"