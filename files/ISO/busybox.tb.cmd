@echo off
pushd "%~dp0"
busybox.exe ash -c "./getLink.sh "%~1" "%~2""
goto:eof