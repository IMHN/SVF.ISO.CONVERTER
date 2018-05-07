@echo off
pushd "%~dp0"
if [%~2]==[] if [%~3]==[] (
	busybox ash -c "./download.sh "%~1""
)
if not [%~2]==[] if [%~3]==[] (
	busybox ash -c "./download.sh "%~1" "%~2""
)

if not [%~3]==[] (
	if [%~3]==[x86] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20CLIENT%%20x86%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20CLIENT%%20x64%%20SVF/%~2""
	if [%~3]==[x86] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME%%20x86%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME%%20x64%%20SVF/%~2""
)
goto:eof
