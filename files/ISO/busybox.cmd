@echo off
pushd "%~dp0"
if [%~2]==[] (
	busybox ash -c "./download.sh "%~1""
)
if not [%~2]==[] (
	busybox ash -c "./download.sh "%~1" "%~2""
)
goto:eof
