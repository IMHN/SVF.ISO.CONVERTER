#!/bin/bash

if [ -z "$1" ]; then
   echo "Please specify product ID"
   exit
elif  [ -z "$2" ]; then
   echo "Please specify file name"
   exit
fi

function uuidGen {
   local tmp
   local i=0
   local string=

   while [ $i -lt 32 ]; do
       i=$(( i+1 ))
       tmp=$(( $RANDOM%16 ))

       case $tmp in
       10) tmp='a' ;;
       11) tmp='b' ;;
       12) tmp='c' ;;
       13) tmp='d' ;;
       14) tmp='e' ;;
       15) tmp='f' ;;
       esac

       case $i in
       8|12|16|20) tmp=$tmp- ;;
       esac

       string=$string$tmp
   done

   printf "$string"
}

uuid=`uuidGen`

productId="$1"
fileName="$2"

getLangs="http://www.microsoft.com/en-us/api/controls/contentinclude/html?pageId=a8f8f489-4c7f-463a-9ca6-5cff94d8d041&host=www.microsoft.com&segments=software-download%2cwindows10ISO&query=&action=getskuinformationbyproductedition&sessionId=$uuid&productEditionId=$productId&sdVersion=2"
getLink="https://www.microsoft.com/en-us/api/controls/contentinclude/html?pageId=160bb813-f54e-4e9f-bffc-38c6eb56e061&host=www.microsoft.com&segments=software-download%2cwindows10ISO&query=&action=GetProductDownloadLinkForFriendlyFileName&sessionId=$uuid&friendlyFileName=$fileName&sdVersion=2"
postData="controlAttributeMapping="
errorText="We encountered a problem processing your request"

./curl "$getLangs" -d"$postData" > /dev/null
output=`./curl "$getLink" -d"$postData" -s`

if (echo $output | grep "$errorText" > /dev/null); then
   echo "ERROR"
   exit
fi

echo "$output" | grep -o 'http.*software-download.*"' | sed 's/",download.*//g'