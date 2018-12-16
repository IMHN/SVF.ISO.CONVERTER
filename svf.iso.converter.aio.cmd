:================================================================================================================
::===============================================================================================================
:: Code by s1ave77 [frontend script] // [forums.mydigitallife.info]
:: Bash script for File download by mkuba50 // [forums.mydigitallife.info]
:: Win 7 source ISO decryption and download by mkuba50 // [forums.mydigitallife.info]
:: SVF Provider Enthousiast // [forums.mydigitallife.info]
:================================================================================================================
::===============================================================================================================
@echo off
pushd %~dp0
if NOT "%cd%"=="%cd: =%" (
	call :SpaceTest
    goto :EOF
)
setlocal EnableExtensions
setlocal EnableDelayedExpansion
:================================================================================================================
::===============================================================================================================
pushd %~dp0
::===============================================================================================================
::===============================================================================================================
for /f "tokens=2* delims= " %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do if "%%b"=="AMD64" (set vera=x64) else (set vera=x86)
::===============================================================================================================
::===============================================================================================================
set "database7ent=database.7ent.smrt"
set "database7ult=database.7ult.smrt"
set "database1809_1=database.1809.1.smrt"
set "database1803_1=database.1803.1.smrt"
set "database1803_2=database.1803.2.smrt"
set "database1803_3=database.1803.3.smrt"
set "databasetb1803=database.tb.1803.smrt"
set "databasetb18091=database.tb.18091.smrt"
set "databasetb18092=database.tb.18092.smrt"
set "databasetb81=database.tb.81.smrt"
set "database1709_1=database.1709.1.smrt"
set "database1709_2=database.1709.2.smrt"
set "databaseLTSB=database.LTSB.smrt"
set "databaseLTSB2=database.LTSB2.smrt"
set "databaseLTSB3=database.LTSB3.smrt"
set "databaseServer16=database.Server2016.smrt"
set "databaseServer19=database.Server2019.smrt"
set "databaseServer192=database.Server2019.2.smrt"
set "databasevlscLTSC=database.vlsc.LTSC.smrt"
set "databasevlsc18092=database.vlsc.18092.smrt"
set "aria2c=files\aria2c.exe"
set "smv=smv.exe"
:================================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
:SVFISOMainMenu
for /f %%I in ('powershell -noprofile ^(Get-Host^).UI.RawUI.WindowSize.width') do set "cw=%%I"
call :TITLE
cls
call :TITLE
call :MenuHeader "[HEADER] MAIN MENU [SYSTEM: %vera%]"
echo:
echo [CREDIT] Enthousiast for SVF Repo [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for SVF Download Script [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for Win 7 Source decryption/download [forums.mydigitallife.net]
echo:
call :MenuFooter
echo:
echo      [W] WINDOWS 7 DOWNLOADS
call :Footer
echo      [M] MY VISUAL STUDIO DOWNLOADS
call :Footer
echo      [V] VLSC DOWNLOADS
call :Footer
echo      [T] TECHBENCH DOWNLOAD [Win 8.1/10]
call :Footer
echo      [D] TOOLS MENU [Conversion/EVAL Downloads]
call :Footer
echo      [E] EXIT
echo:
call :MenuFooter
echo:
CHOICE /C WMVTDE /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 goto:SVFISOProcessWin7
if %errorlevel%==2 goto:SVFISODownMenu
if %errorlevel%==3 goto:VLSCISODownload
if %errorlevel%==4 goto:TBISODownload
if %errorlevel%==5 goto:SVFISOToolsMenu
if %errorlevel%==6 goto:EXIT
goto:SVFISOMainMenu
:================================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
:SVFISOToolsMenu
call :TITLE
cls
call :MenuHeader "[HEADER] MAIN MENU [SYSTEM: %vera%]"
echo:
echo [CREDIT] Enthousiast for SVF Repo [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for SVF Download Script [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for Win 7 Source decryption/download [forums.mydigitallife.net]
echo:
call :MenuFooter
echo:
echo      [C] CREATE SVF/ISO
call :Footer
echo      [D] DOWNLOAD/RESUME SOURCE ISO FILES
call :Footer
echo      [B] BACK
echo:
call :MenuFooter
echo:
CHOICE /C CDB /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 goto:SVFISOCreate
if %errorlevel%==2 goto:SourceISODownloadRefresh
if %errorlevel%==3 goto:SVFISOMainMenu
goto:SVFISOToolsMenu
:================================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
:SVFISODownMenu
call :TITLE
cls
call :MenuHeader "[HEADER] MVS DOWNLOAD MENU [SYSTEM: %vera%]"
echo:
echo [CREDIT] Enthousiast for SVF Repo [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for SVF Download Script [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for Win 7 Source decryption/download [forums.mydigitallife.net]
echo:
call :MenuFooter
echo:
echo      [0] START 1809 PROCESS 1 [17763.1]
echo:
echo      [1] START 1803 PROCESS 1 [17134.1]
echo:
echo      [2] START 1803 PROCESS 2 [17134.228]
echo:
echo      [3] START 1803 PROCESS 3 [17134.285]
echo:
echo      [4] START 1709 PROCESS 1 [16299.15]
echo:
echo      [5] START 1709 PROCESS 2 [16299.125]
echo:
echo      [6] START LTSC 2019 PROCESS [17763.1]
echo:
echo      [7] START LTSB 2016 PROCESS [14393.0]
echo:
echo      [8] START LTSB 2015 PROCESS [10240.0]
echo:
echo      [9] START SERVER 2016 PROCESS [14393.0]
echo:
echo      [A] START SERVER 2019 PROCESS 1 [17763.0]
echo:
echo      [C] START SERVER 2019 PROCESS 2 [17763.107]
call :Footer
echo      [B] BACK
echo:
call :MenuFooter
echo:
CHOICE /C 0123456789ACB /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 (
	set "show=1809"
	set "build=17763.1"
	goto:SVFISOProcess1809
)
if %errorlevel%==2 (
	set "show=1803"
	set "build=17134.1"
	goto:SVFISOProcess1803
)
if %errorlevel%==3 (
	set "show=1803"
	set "build=17134.228"
	goto:SVFISOProcess1803
)
if %errorlevel%==4 (
	set "show=1803"
	set "build=17134.285"
	goto:SVFISOProcess1803
)
if %errorlevel%==5 (
	set "show=1709"
	set "build=16299.15"
	goto:SVFISOProcess1803
)
if %errorlevel%==6 (
	set "show=1709"
	set "build=16299.125"
	goto:SVFISOProcess1803
)
if %errorlevel%==7 goto:SVFISOProcessLTSB19
if %errorlevel%==8 goto:SVFISOProcessLTSB16
if %errorlevel%==9 goto:SVFISOProcessLTSB15
if %errorlevel%==10 goto:SVFISOProcessServer16
if %errorlevel%==11 goto:SVFISOProcessServer19
if %errorlevel%==12 goto:SVFISOProcessServer19Refresh
if %errorlevel%==13 goto:SVFISOMainMenu
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
:VLSCISODownload
call :TITLE
cls
call :MenuHeader "[HEADER] VLSC DOWNLOAD MENU [SYSTEM: %vera%]"
echo:
echo [CREDIT] Enthousiast for SVF Repo [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for SVF Download Script [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for Win 7 Source decryption/download [forums.mydigitallife.net]
echo:
call :MenuFooter
echo:
echo      [1] START 1809 LTSC Oct Refresh PROCESS [17763.107]
echo:
echo      [2] START 1809 Business Oct Refresh PROCESS [17763.107]
call :Footer
echo      [B] BACK
echo:
call :MenuFooter
echo:
CHOICE /C 12B /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 (
	set "show=LTSC Oct Refresh"
	set "build=VLSCLTSC"
	goto:VLSCISOProcess
)
if %errorlevel%==2 (
	set "show=1809 Oct Refresh"
	set "build=VLSC18092"
	goto:VLSCISOProcess
)
if %errorlevel%==3 goto:SVFISOMainMenu
goto:VLSCISODownload
:================================================================================================================
::===============================================================================================================
::VLSC PROCESS
:VLSCISOProcess
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :LangChoiceVLSC
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
if "%build%"=="VLSCLTSC" (
	call :DBVLSCLTSC
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databasevlscLTSC%" ^| findstr /i "%tblang%" ^| findstr /i "%arch%"') do (
		set "fshare=D45Y9I1UWgw9jHV"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%arch%"=="x86" (
		set "siename=17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x86FRE_en-us"
		set "siehash=ba8e0184c61d88b92fb88046339f8ddc58a3b372"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x86FRE_en-us.iso"
		set "sishare=Oct_Refresh_LTSC_EVAL_2_ALL_LTSC_x86"
	)
	if "%arch%"=="x64" (
		set "siename=17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x64FRE_en-us"
		set "siehash=369e645a197bc2ca8309cb80467a85a16eacd1a7"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x64FRE_en-us.iso"
		set "sishare=Oct_Refresh_LTSC_EVAL_2_ALL_LTSC_x64"
))
if "%build%"=="VLSC18092" (
	call :DBVLSC18092
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databasevlsc18092%" ^| findstr /i "%tblang%" ^| findstr /i "%arch%"') do (
		set "fshare=D45Y9I1UWgw9jHV"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%arch%"=="x86" (
		set "siename=17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=eee2167b0ea9fe9654357c06d44a9c44eff62f1d"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "sishare=Oct_Refresh_Ent_EVAL_2_ALL_Bus_x86"
	)
	if "%arch%"=="x64" (
		set "siename=17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=164f022a22d2305e6fbd82f6e35d530b6bbadca8"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "sishare=Oct_Refresh_Ent_EVAL_2_ALL_Bus_x64"
))
call :Footer
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:VLSCISODownload
)
::===============================================================================================================
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		echo [ INFO ] Downloading Eval ISO.
		call :Footer
		pushd %~dp0
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.svf" (
		echo [ INFO ] Downloading Target ISO SVF.
		echo [ INFO ] Name  : %fname%
		call :Footer
		call :Busybox "%fshare%", "%sishare%/%fname%.svf"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Name  : %fname%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:VLSCISODownload
:================================================================================================================
::===============================================================================================================
::1803 PROCESS
:SVFISOProcess1803
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C CB /N /M "[ USER ] [C]onsumer or [B]usiness (VL) ISO ?:"
if %errorlevel%==1 (
	if "%build%"=="17134.1" set "type=consumer"
	if "%build%"=="17134.228" set "type=consumer"
	if "%build%"=="17134.285" set "type=consumer"
	if "%build%"=="16299.15" set "type=edition_version"
	if "%build%"=="16299.125" set "type=edition_version"
)
if %errorlevel%==2 (
	if "%build%"=="17134.1" set "type=business"
	if "%build%"=="17134.228" set "type=business"
	if "%build%"=="17134.285" set "type=business"
	if "%build%"=="16299.15" set "type=edition_vl_version"
	if "%build%"=="16299.125" set "type=edition_vl_version"
)
call :Footer
call :LangChoice
::===============================================================================================================
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
if "%build%"=="17134.1" (
	call :DB18031
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database1803_1%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=%%d"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="consumer" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063380"
		set "sihash=3f2063b7419675e98c8df82bc0607bbb1ce298bb"
		set "sishare=KtRGY6XX2kksnK6"
	)
	if "%type%"=="consumer" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063379"
		set "sihash=08fbb24627fa768f869c09f44c5d6c1e53a57a6f"
		set "sishare=H0ckQ69wcsFlIud"
	)
	if "%type%"=="business" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063341"
		set "sihash=a3becd56ba0df0b023a13fe0b3e85f45461fa7ea"
		set "sishare=wAqHUcjE6v3OAbr"
	)
	if "%type%"=="business" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333"
		set "sihash=28681742fe850aa4bfc7075811c5244b61d462cf"
		set "sishare=iAmZu6da4sFmKP9"
))
if "%build%"=="17134.228" (
	call :DB18032
	for /f "tokens=1,2,3* delims=|" %%a in ('type "%database1803_2%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=Xq6elBGSBdH9RQe"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="consumer" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_454b0be7"
		set "sihash=ca7861c6a41c0f377f1d7c64eb6c59fded843d8a"
		set "sishare=Consumer_EN_2_XX_x86/!fname!.svf"
	)
	if "%type%"=="consumer" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_f2764cf8"
		set "sihash=349c43fc744ef45d2cf85e7bef4131373216525d"
		set "sishare=Consumer_EN_2_XX_x64/!fname!.svf"
	)
	if "%type%"=="business" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_69a0bb10"
		set "sihash=533545aa095aa18824a9d1f81a95d8db3e23e154"
		set "sishare=Business_EN_2_XX_x86/!fname!.svf"
	)
	if "%type%"=="business" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_5d7e729e"
		set "sihash=2b15efd7926ab9db9181cd7b599452cccc3774de"
		set "sishare=Business_EN_2_XX_x64/!fname!.svf"
))
if "%build%"=="17134.285" (
	call :DB18033
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database1803_3%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=%%d"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="consumer" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_f5ff2c32"
		set "sihash=4c019f93732aaf9ab4e4d74bec3287b949c1aadf"
		set "sishare=fPAmBlUVTfdDsER
	)
	if "%type%"=="consumer" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_69339216"
		set "sihash=0208398915c08fe03f6c63faea9dcc9bbbd00532"
		set "sishare=fPAmBlUVTfdDsER"
	)
	if "%type%"=="business" if "%arch%"=="x86" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ddb496534203cb98284e5484e0ad60af3c0efce7"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_fb8c8fd4"
		set "sihash=e0fc7ab79c7e9ec7971fe3a9fd302531564e6dcb"
		set "sishare=fPAmBlUVTfdDsER"
	)
	if "%type%"=="business" if "%arch%"=="x64" (
		set "siename=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
		set "sielink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_37051f54"
		set "sihash=d302d2e752c01e53996ae292a8dd4cdf49916bad"
		set "sishare=fPAmBlUVTfdDsER"
))
if "%build%"=="16299.15" (
	call :DB17091
	for /f "tokens=1,2,3* delims=|" %%a in ('type "%database1709_1%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=Sc8UaS9CXJDKtXr"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="edition_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090818"
		set "sihash=93b317c82b69252027e57aa2d18b50825cdf443e"
		set "sishare=SbZp6LdwkWOwp3v"
	)
	if "%type%"=="edition_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090817"
		set "sihash=1ad928cfef439f6aa4044ddc3a96b0b6830bdd0f"
		set "sishare=SbZp6LdwkWOwp3v"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090759"
		set "sihash=8c274ce27b49d43216dfef115b811936880e6e06"
		set "sishare=SbZp6LdwkWOwp3v"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090741"
		set "sihash=1bbf886697a485c18d70ad294a09c08cb3c064ac"
		set "sishare=SbZp6LdwkWOwp3v"
))
::===============================================================================================================
::set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
::set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
::===============================================================================================================
if "%build%"=="16299.125" (
	call :DB17092
	for /f "tokens=1,2,3* delims=|" %%a in ('type "%database1709_2%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=MLATBBhtSajfaLz"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="edition_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406359"
		set "sihash=36005d054f732119bbb00fd9a0e141d54712d751"
		set "sishare=9JpXNkAkwCUsqcy"
	)
	if "%type%"=="edition_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406711"
		set "sihash=ea214ee684a5bb8230707104c54a3b74d92f1d69"
		set "sishare=Mfxoh7M2KNorBaE"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406182"
		set "sihash=6eeff9574366042ed5ad50c48f406ce10ef20e10"
		set "sishare=VRdCKPETWzFHOGH"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406172"
		set "sihash=1851a0007321fa084145ea24b8d30bf7a72bf1c6"
		set "sishare=SB0WYFMT6ZItmmc"
))
call :Footer
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%siname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%siname%.svf" (
		echo [ INFO ] Downloading Source ISO SVF.
		echo [ INFO ] Name  : %siname%
		call :Footer
		if "%build%"=="17134.1" call :Busybox "%sishare%", ""
		if "%build%"=="17134.228" call :Busybox "%fshare%", "%siname%.svf"
		if "%build%"=="17134.285" call :Busybox "%sishare%", "%siname%.svf"
		if "%build%"=="16299.15" call :Busybox "%sishare%", "%siname%.svf"
		if "%build%"=="16299.125" call :Busybox "%sishare%", ""
		call :Footer
	)
	echo [ INFO ] Creating Source ISO.
	echo [ INFO ] Name  : %siname%
	call :Footer
::===============================================================================================================
	smv x %siname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%sihash%", "%siname%"
if "%lang%"=="en-us" goto:SourceChoiceOTHER
echo [ INFO ] Downloading SVF ^(if not already pesent^).
echo [ INFO ] Name  : %fname%
call :Footer
if not exist "download.sh" call :DownShStream
xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
if not exist "%fname%.iso" (
	if not exist "%fname%.svf" (
		if "%build%"=="17134.1" call :Busybox "%fshare%", "%fname%.svf"
		if "%build%"=="17134.228" call :Busybox "%fshare%", "%sishare%"
		if "%build%"=="17134.285" call :Busybox "%fshare%", "%fname%.svf"
		if "%build%"=="16299.15" call :Busybox "%fshare%", "%fname%.svf", "%arch%", "%type%", "%build%"
		if "%build%"=="16299.125" call :Busybox "%fshare%", "%fname%.svf", "%arch%", "%type%"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Target: %fname%
	echo [ INFO ] Hash  : %fhash%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
:SourceChoiceOTHER
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::LTSC 2019 PROCESS
:SVFISOProcessLTSB19
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] LTSC 2019 SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
set "sishare=2019_LTSC_%arch%"
call :Footer
call :LangChoice
::===============================================================================================================
cls
call :Header "[HEADER] LTSC 2019 SVF ISO CONVERSION"
call :DBLTSB3
for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databaseLTSB3%" ^| findstr /i "%lang%" ^| findstr /i "%arch%"') do (
	set "fshare=%%d"
	set "fhash=%%b"
	set "fname=%%c"
)
if "%arch%"=="x86" (
	set "siename=17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x86FRE_en-us"
	set "siehash=b11efabfc38428b69042da841e1cb4b105be359b"
	set "sielink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x86FRE_en-us.iso"
)
if "%arch%"=="x64" (
	set "siename=17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x64FRE_en-us"
	set "siehash=fba7f17ffdf018e4cffd49a9819d719d3708cf09"
	set "sielink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x64FRE_en-us.iso"
)
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] LTSC 2019 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	echo [ INFO ] Downloading SVF ^(if not already pesent^).
	echo [ INFO ] Name  : %fname%
	call :Footer
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.iso" (
		if not exist "%fname%.svf" (
			call :Busybox "%fshare%", "%sishare%/%fname%.svf"
			call :Footer
		)
		echo [ INFO ] Creating Target ISO.
		echo [ INFO ] Target: %fname%
		echo [ INFO ] Hash  : %fhash%
		call :Footer
	::===============================================================================================================
		smv x %fname%.svf -br .
	::===============================================================================================================
		call :Footer
	)
)
call :ISOHashCheck "%fhash%", "%fname%"
:SourceChoiceLTSB3
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::1809_1 PROCESS
:SVFISOProcess1809
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C CB /N /M "[ USER ] [C]onsumer or [B]usiness (VL) ISO ?:"
if %errorlevel%==1 (
	if "%build%"=="17763.1" (set "type=consumer")&&(set "sishare=Ent_EVAL_2_ALL_Cons_%arch%")
)
if %errorlevel%==2 (
	if "%build%"=="17763.1" (set "type=business")&&(set "sishare=Ent_EVAL_2_ALL_Bus_%arch%")
)
call :Footer
call :LangChoice
::===============================================================================================================
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
if "%build%"=="17763.1" (
	call :DB18091
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database1809_1%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=%%d"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%arch%"=="x86" (
		set "siename=17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=ae31e79d3369c3df6842b1e21b7b07781a1dc4c7"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
	)
	if "%arch%"=="x64" (
		set "siename=17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=b8a6ffac9e15240c39f2ed2b16204341f564208d"
		set "sielink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
))
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
cls
call :Header "[HEADER] %show% [%build%] SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	echo [ INFO ] Downloading SVF ^(if not already pesent^).
	echo [ INFO ] Name  : %fname%
	call :Footer
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.iso" (
		if not exist "%fname%.svf" (
			call :Busybox "%fshare%", "%sishare%/%fname%.svf"
			call :Footer
		)
		echo [ INFO ] Creating Target ISO.
		echo [ INFO ] Target: %fname%
		echo [ INFO ] Hash  : %fhash%
		call :Footer
	::===============================================================================================================
		smv x %fname%.svf -br .
	::===============================================================================================================
		call :Footer
	)
)
call :ISOHashCheck "%fhash%", "%fname%"
pause
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::LTSB 2016 PROCESS
:SVFISOProcessLTSB16
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2016 SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C SN /N /M "[ USER ] [S]tandard or [N] Version ISO ?:"
if %errorlevel%==1 set "type=_ltsb_x"
if %errorlevel%==2 set "type=_ltsb_n"
call :Footer
if "%type%"=="_ltsb_x" call :LangChoice
if "%type%"=="_ltsb_n" call :LangChoiceN
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2016 SVF ISO CONVERSION"
call :DBLTSB
for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databaseLTSB%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
	set "fshare=%%d"
	set "fhash=%%b"
	set "fname=%%c"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x86" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=fd65bfe31af5fd59d8537210cd829fe3e83feeb2"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_x86_dvd_9060010"
	set "sihash=45e72d02ff17125c699558719eb946d8e140c9cc"
	set "siphash=f60802ce368c3e1ce29fa81630af1cb82f579ace"
	set "sipname=2016_LTSB_SVF/%arch%/%fname%.svf"
	set "silink=EVAL_LTSB_2_2016_LTSB/%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x64" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=ed6e357cba8d716a6187095e3abd016564670d5b"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_x64_dvd_9059483"
	set "sihash=031ed6acdc47b8f582c781b039f501d83997a1cf"
	set "siphash=f60802ce368c3e1ce29fa81630af1cb82f579ace"
	set "sipname=2016_LTSB_SVF/%arch%/%fname%.svf"
	set "silink=EVAL_LTSB_2_2016_LTSB/%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x86" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=fd65bfe31af5fd59d8537210cd829fe3e83feeb2"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058202"
	set "sihash=3f8f9811a7e72adf88215060e38ba81340dfb0c0"
	set "siphash=e3067f61491a87a8cf2d0873e43d340e24dcdc6e"
	set "sipname=2016_LTSB_N_SVF/%arch%/%fname%.svf"
	set "silink=EVAL_LTSB_2_2016_LTSB/%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x64" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=ed6e357cba8d716a6187095e3abd016564670d5b"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057894"
	set "sihash=b5d4911bd53ec5029781ade0937dad43c4ed90f6"
	set "siphash=c093f60e8d50794460f3ec5789f4e65e477fc047"
	set "sipname=2016_LTSB_N_SVF/%arch%/%fname%.svf"
	set "silink=EVAL_LTSB_2_2016_LTSB/%arch%/!siname!.svf"
)
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2016 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%siname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%siname%.svf" (
		echo [ INFO ] Downloading Source ISO SVF.
		echo [ INFO ] Name  : %siname%
		call :Footer
		call :Busybox "vZysMUyuP9nbx0s", "%silink%"
		call :Footer
	)
	echo [ INFO ] Creating Source ISO.
	echo [ INFO ] Name  : %siname%
	call :Footer
::===============================================================================================================
	smv x %siname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%sihash%", "%siname%"
if "%lang%"=="en-us" goto:SourceChoiceLTSB
echo [ INFO ] Downloading SVF ^(if not already pesent^).
echo [ INFO ] Name  : %fname%
call :Footer
if not exist "download.sh" call :DownShStream
xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
if not exist "%fname%.iso" (
	if not exist "%fname%.svf" (
		call :Busybox "%fshare%", "%sipname%"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Target: %fname%
	echo [ INFO ] Hash  : %fhash%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
:SourceChoiceLTSB
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::LTSB 2015 PROCESS
:SVFISOProcessLTSB15
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2015 SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C SN /N /M "[ USER ] [S]tandard or [N] Version ISO ?:"
if %errorlevel%==1 set "type=_ltsb_x"
if %errorlevel%==2 set "type=_ltsb_n"
call :Footer
if "%type%"=="_ltsb_x" call :LangChoice
if "%type%"=="_ltsb_n" call :LangChoiceN
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2015 SVF ISO CONVERSION"
call :DBLTSB2
for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databaseLTSB2%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
	set "fshare=%%d"
	set "fhash=%%b"
	set "fname=%%c"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x86" (
	set "siename=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=aa8ce9cc9b660b31245622e49e0d183db355558f"
	set "sielink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "sipname=%arch%/%fname%.svf"
	set "silink=%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x64" (
	set "siename=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=90e1c5bada5b96ab05a9fe2035cb26f5cb3cd4d2"
	set "sielink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "sipname=%arch%/%fname%.svf"
	set "silink=%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x86" (
	set "siename=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=aa8ce9cc9b660b31245622e49e0d183db355558f"
	set "sielink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "sipname=%arch%/%fname%.svf"
	set "silink=%arch%/!siname!.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x64" (
	set "siename=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=90e1c5bada5b96ab05a9fe2035cb26f5cb3cd4d2"
	set "sielink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "sipname=%arch%/%fname%.svf"
	set "silink=%arch%/!siname!.svf"
)

echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
echo [  TO  ]
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2015 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		echo [ INFO ] Downloading Eval ISO.
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if "%dhash%"=="" (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	echo [ INFO ] Downloading SVF ^(if not already pesent^).
	echo [ INFO ] Name  : %fname%
	call :Footer
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.iso" (
		if not exist "%fname%.svf" (
			call :Busybox "%fshare%", "%sipname%"
			call :Footer
		)
		echo [ INFO ] Creating Target ISO.
		echo [ INFO ] Target: %fname%
		echo [ INFO ] Hash  : %fhash%
		call :Footer
	::===============================================================================================================
		smv x %fname%.svf -br .
	::===============================================================================================================
		call :Footer
	)
)
call :ISOHashCheck "%fhash%", "%fname%"
:SourceChoiceLTSB2
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::SERVER 2016 PROCESS
:SVFISOProcessServer16
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2016 SVF ISO CONVERSION"
call :LangChoiceS
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2016 SVF ISO CONVERSION"
call :DBServer2016
for /f "tokens=1,2,3* delims=|" %%a in ('type "%databaseServer16%" ^| findstr /i "%lang%"') do (
	set "fhash=%%b"
	set "fname=%%c"
)
set "siename=14393.0.160715-1616.RS1_RELEASE_SERVER_EVAL_X64FRE_EN-US"
set "siehash=3bb1c60417e9aeb3f4ce0eb02189c0c84a1c6691"
set "sielink=https://download.microsoft.com/download/1/6/F/16FA20E6-4662-482A-920B-1A45CF5AAE3C/14393.0.160715-1616.RS1_RELEASE_SERVER_EVAL_X64FRE_EN-US.ISO"
set "fpshare=EVAL_Server_2016_enUS_2_XX_windows_server_2016_x64_dvd/%fname%.svf"
set "fshare=khsqusxKTVkJ0R6"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2016 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.svf" (
		echo [ INFO ] Downloading Target ISO SVF.
		echo [ INFO ] Name  : %fname%
		call :Footer
		call :Busybox "%fshare%", "%fpshare%"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Name  : %fname%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::SERVER 2019 PROCESS
:SVFISOProcessServer19
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 SVF ISO CONVERSION"
call :LangChoiceS
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 SVF ISO CONVERSION"
call :DBServer2019
for /f "tokens=1,2,3* delims=|" %%a in ('type "%databaseServer19%" ^| findstr /i "%lang%"') do (
	set "fhash=%%b"
	set "fname=%%c"
	set "fshare=%%d"
)
set "siename=17763.1.180914-1434.rs5_release_SERVER_EVAL_X64FRE_EN-US"
set "siehash=c4834f538a90bb41f625144c9a2e0edf8bb9b9b5"
set "sielink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_SERVER_EVAL_X64FRE_EN-US.ISO"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.svf" (
		echo [ INFO ] Downloading Target ISO SVF.
		echo [ INFO ] Name  : %fname%
		call :Footer
		call :Busybox "%fshare%", "%fname%.svf"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Name  : %fname%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::SERVER 2019 PROCESS 2
:SVFISOProcessServer19Refresh
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 Oct Refresh SVF ISO CONVERSION"
call :LangChoiceS
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 Oct Refresh SVF ISO CONVERSION"
call :DBServer20192
for /f "tokens=1,2,3* delims=|" %%a in ('type "%databaseServer192%" ^| findstr /i "%lang%"') do (
	set "fhash=%%b"
	set "fname=%%c"
	set "fshare=%%d"
)
set "siename=17763.107.101029-1455.rs5_release_svc_refresh_SERVERESSENTIALS_OEM_X64FRE_EN-US"
set "siehash=fbb32c6761640640e48d1652225e6af117eae0ad"
set "sielink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_SERVERESSENTIALS_OEM_X64FRE_EN-US.ISO"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISODownMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] SERVER 2019 Oct Refresh SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
set "dhash="
call :Footer
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		call :SourceISODownload "%siehash%", "%siename%", "%sielink%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source Eval ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.svf" (
		echo [ INFO ] Downloading Target ISO SVF.
		echo [ INFO ] Name  : %fname%
		call :Footer
		call :Busybox "%fshare%", "STD/%fname%.svf"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Name  : %fname%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:SVFISODownMenu
:================================================================================================================
::===============================================================================================================
::WINDOWS 7 PROCESS
:SVFISOProcessWin7
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] WINDOWS 7 SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C UE /N /M "[ USER ] [U]ltimate or [E]nterprise ?:"
if %errorlevel%==1 set "type=ult"
if %errorlevel%==2 set "type=ent"
call :Footer
call :LangChoice
if "%type%"=="ult" (
	call :DBWin7Ult
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database7ult%" ^| findstr /i "%lang%" ^| findstr /i "%arch%"') do (
		set "show=Ultimate"
		set "fshare=%%d"
		set "fhash=%%b"
		set "fname=%%c"
))
if "%type%"=="ent" (
	call :DBWin7Ent
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database7ent%" ^| findstr /i "%lang%" ^| findstr /i "%arch%"') do (
		set "show=Enterprise"
		set "fshare=%%d"
		set "fhash=%%b"
		set "fname=%%c"
))
if "%arch%"=="x86" (
	set "siename=en_windows_7_ultimate_with_sp1_x86_dvd_u_677460"
	set "siehash=65fce0f445d9bf7e78e43f17e441e08c63722657"
	if "%type%"=="ult" (
		set "silink=EN2XX_Ultimate_x86"
	)
	if "%type%"=="ent" (
		set "silink=Ultimate_en_US_2_Enterprise_XX_x86"
	)
)
if "%arch%"=="x64" (
	set "siename=en_windows_7_ultimate_with_sp1_x64_dvd_u_677332"
	set "siehash=36ae90defbad9d9539e649b193ae573b77a71c83"
	if "%type%"=="ult" (
		set "silink=EN2XX_Ultimate_x64"
	)
	if "%type%"=="ent" (
		set "silink=Ultimate_en_US_2_Enterprise_XX_x64"
	)
)
cls
call :Header "[HEADER] WINDOWS 7 %show% SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Target: %fname%
echo [ INFO ] Hash  : %fhash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.smrt" del /f /q "*.smrt" >nul 2>&1
	goto:SVFISOMainMenu
)
::===============================================================================================================
cls
call :Header "[HEADER] WINDOWS 7 %show% SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
set "dhash="
if not exist "%fname%.iso" (
	if not exist "%siename%.iso" (
		echo [ INFO ] Generating Link List.
		call :Footer
		if "%arch%"=="x64" (
			call :EncryptedStream64
			call :DownloadStream64
		)
		if "%arch%"=="x86" (
			call :EncryptedStream86
			call :DownloadStream86
		)
		call :GenerateList
		call :Footer
		echo [ INFO ] Downloading Source ISO.
		call :Footer
		if not exist "encrypted" md "encrypted" >nul 2>&1
		"%aria2c%" -x16 -s16 -dencrypted -iaria2.txt -R -c
		if not !errorlevel!==0 (
			xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
			busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
			echo [ INFO ] Hash  : !dhash!
			call :Footer
			echo [ INFO ] Please repeat the process.
			call :Footer
			if exist "*.txt" del /f /q "*.txt" >nul 2>&1
			if exist "*.exe" del /f /q "*.exe" >nul 2>&1
			pause
			goto:SVFISOMainMenu
		)
		call :Footer
		echo [ INFO ] Decrypting ISO file.
		call :Footer
		call :DecryptISO "%siename%.iso"
		call :Footer
		call :ISOHashCheck "%siehash%", "%siename%"
		call :Footer
	)
	if exist "%siename%.iso" if not defined dhash (
		echo [ INFO ] Source ISO present.
		call :ISOHashCheck "%siehash%", "%siename%"
	)
	if "%lang%"=="en-us" if "%type%"=="ult" (
		goto :USUltBreak
	)
	call :DownShStream
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
	xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
	if not exist "%fname%.svf" (
		echo [ INFO ] Downloading Target ISO SVF.
		echo [ INFO ] Name  : %fname%
		call :Footer
		call :Busybox "%fshare%", "%silink%/%fname%.svf"
		call :Footer
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Name  : %fname%
	call :Footer
::===============================================================================================================
	smv x %fname%.svf -br .
::===============================================================================================================
	call :Footer
)
call :ISOHashCheck "%fhash%", "%fname%"
:USUltBreak
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
if exist "encrypted" rd /s /q "encrypted" >nul 2>&1
pause
goto:SVFISOMainMenu
:================================================================================================================
::===============================================================================================================
::TECHBENCH DOWNLOAD
:TBISODownload
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] TECHBENCH DOWNLOAD"
echo      [1] WINDOWS 8.1 ^(Update 3^)
echo:
echo      [2] WINDOWS 8.1 N ^(Update 3^)
echo:
echo      [3] WINDOWS 10 1803 ^(contains N versions^)
echo:
echo      [4] WINDOWS 10 1809 [17763.1] ^(contains N versions^)
echo:
echo      [5] WINDOWS 10 1809 [17763.107] ^(contains N versions^)
call :Footer
echo      [B] BACK
call :Footer
CHOICE /C 12345B /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 (
	call :DBTB81
	call :Footer
	set "tbwin=Win8.1_"
	set "tbid=52"
)
if %errorlevel%==2 (
	call :DBTB81
	call :Footer
	set "tbwin=Win8.1_Pro_N_"
	set "tbid=55"
)
if %errorlevel%==3 (
	call :DBTB1803
	call :Footer
	set "tbwin=Win10_1803_"
	set "tbid=651"
)
if %errorlevel%==4 (
	call :DBTB18091
	call :Footer
	set "tbwin=Win10_1809_"
	set "tbid=1019"
)
if %errorlevel%==5 (
	call :DBTB18092
	call :Footer
	set "tbwin=Win10_1809Oct_"
	set "tbid=1060"
)
if %errorlevel%==6 goto:SVFISOMainMenu
call :Footer
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "tbarch=x64"
if %errorlevel%==2 set "tbarch=x32"
:ServerEssentials
if "%tbwin%"=="Win8.1_Pro_N_" call :LangChoice81N
if "%tbwin%"=="Win8.1_" call :LangChoice81
if "%tbwin%"=="Win10_1803_" call :LangChoiceTB
if "%tbwin%"=="Win10_1809_" call :LangChoiceTB
if "%tbwin%"=="Win10_1809Oct_" call :LangChoiceTB
call :Footer
::===============================================================================================================
cls
call :Header "[HEADER] TECHBENCH DOWNLOAD"
if "%tbwin%"=="Win10_1809_" (
	if "%tbarch%"=="x64" set "stbarch=x64"
	if "%tbarch%"=="x32" set "stbarch=x86"
)
if "%tbwin%"=="Win10_1809Oct_" (
	if "%tbarch%"=="x64" set "stbarch=x64"
	if "%tbarch%"=="x32" set "stbarch=x86"
)
if "%tbwin%"=="Win10_1803_" (
	if "%tbarch%"=="x64" set "stbarch=x64"
	if "%tbarch%"=="x32" set "stbarch=x86"
)
if "%tblang%"=="Korean" if "%tbwin%"=="Win8.1_" (
	set "tbwin=Win8.1_K_"
	set "tbid=61"
)
if "%tblang%"=="Korean" if "%tbwin%"=="Win8.1_Pro_N_" (
	set "tbwin=Win8.1_Pro_KN_"
	set "tbid=62"
)
set "tbfilename=%tbwin%%tblang%_%tbarch%.iso"
if "%tbwin%"=="Win10_1803_" for /f "tokens=1,2,3* delims=|" %%a in ('type "%databasetb1803%" ^| findstr /i "%tblang%" ^| findstr /i "_%stbarch%_"') do set "tbhash=%%b"
if "%tbwin%"=="Win10_1809_" for /f "tokens=1,2,3* delims=|" %%a in ('type "%databasetb18091%" ^| findstr /i "%tblang%" ^| findstr /i "%stbarch%"') do (
	set "tbhash=%%b"
	set "tbsize=%%c"
)
if "%tbwin%"=="Win10_1809Oct_" for /f "tokens=1,2,3* delims=|" %%a in ('type "%databasetb18092%" ^| findstr /i "%tblang%" ^| findstr /i "%stbarch%"') do (
	set "tbhash=%%b"
	set "tbsize=%%c"
)
if not "%tbwin%"=="Win10_1803_" if not "%tbwin%"=="Win10_1809_" if not "%tbwin%"=="Win10_1809Oct_" for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databasetb81%" ^| findstr /i "%tbfilename%"') do (
	set "tbhash=%%b"
	set "tbsize=%%c"
)
call :getLinkShStream
call :Footer
xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
xcopy "files\CURL.exe" /s ".\" /Q /Y >nul 2>&1
call :BusyboxTB
pushd %~dp0
set "busyboxtemp=busybox.cmd"
for /f "tokens=*" %%a in ('call %busyboxtemp% "%tbid%", "'%tbfilename%'"') do set "tblink=%%a"
if exist "_temp" rd /s /q "_temp" >nul 2>&1
if exist "busybox.cmd" del /f /q "busybox.cmd" >nul 2>&1
echo [ INFO ] TB ISO: %tbfilename%
echo [ INFO ] Hash  : %tbhash%
if not "%tbwin%"=="Win10_1803_" echo [ INFO ] Size  : %tbsize% GB
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 (
	if exist "*.txt" del /f /q "*.txt" >nul 2>&1
	if exist "*.exe" del /f /q "*.exe" >nul 2>&1
	if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
	if exist "*.sh" del /f /q "*.sh" >nul 2>&1
	goto:TBISODownload
)
::===============================================================================================================
cls
call :Header "[HEADER] TECHBENCH DOWNLOAD"
echo [ INFO ] TB ISO: %tbfilename%
echo [ INFO ] Hash  : %tbhash%
if not "%tbwin%"=="Win10_1803_" if not "%tbwin%"=="17763.107.101029-1455.rs5_release_svc_refresh_SERVERESSENTIALS_OEM_X64FRE_" echo [ INFO ] Size  : %tbsize% GB
if defined tbhash "%aria2c%" -x16 -s16 -d"%cd%" -o"%tbfilename%" --checksum=sha-1=%tbhash% "%tblink%" -R -c --file-allocation=none --check-certificate=false
if not defined tbhash "%aria2c%" -x16 -s16 -d"%cd%" -o"%tbfilename%" "%tblink%" -R -c --file-allocation=none --check-certificate=false
if not !errorlevel!==0 (
	call :Footer
	busybox echo -e "\033[31;1m[ WARN ] Something went wrong!\033[0m"
	call :Footer
	if exist "*.txt" del /f /q "*.txt" >nul 2>&1
	if exist "*.exe" del /f /q "*.exe" >nul 2>&1
	if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
	if exist "*.sh" del /f /q "*.sh" >nul 2>&1
	pause
	goto:TBISODownload
)
call :Footer
if exist "*.txt" del /f /q "*.txt" >nul 2>&1
if exist "*.exe" del /f /q "*.exe" >nul 2>&1
if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
if exist "*.sh" del /f /q "*.sh" >nul 2>&1
pause
goto:TBISODownload
:================================================================================================================
::===============================================================================================================
:: SVF/ISO CREATION
:SVFISOCreate
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] SVF/ISO CREATION"
echo      [S] CREATE SVF
echo:
echo      [I] CREATE ISO
echo:
call :Footer
echo      [B] BACK
call :Footer
CHOICE /C SIB /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 goto:CreateSVF
if %errorlevel%==2 goto:CreateISO
if %errorlevel%==3 goto:SVFISOToolsMenu
goto:SVFISOCreate
::===============================================================================================================
:CreateSVF
cls
call :Header "[HEADER] SVF CREATION"
echo Enter Source ISO name ^(no extension^)
echo Default: %siname%
call :Footer
set /p siname=Source ISO name ^>
call :Footer
echo Enter Target ISO name ^(no extension^)
echo Default: %tname%
call :Footer
set /p tname=Target ISO name ^>
call :Footer
cls
call :Header "[HEADER] SVF CREATION"
echo [ INFO ] Source: %siname%
echo [  TO  ]
echo [ INFO ] Target: %tname%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 goto:SVFISOCreate
call :Footer
xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
smv BuildPatch "%tname%" "%siname%.iso" "%tname%.iso" -nbhashbits 24 -compressratio 49 -sha1 -sha25
if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
call :Footer
pause
goto:SVFISOCreate
::===============================================================================================================
:CreateISO
cls
call :Header "[HEADER] ISO CREATION"
echo Enter SVF name ^(no extension^)
echo Default: %sname%
call :Footer
set /p sname=SVF name ^>
call :Footer
cls
call :Header "[HEADER] ISO CREATION"
echo [ INFO ] Target: %sname%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 goto:SVFISOCreate
call :Footer
xcopy "files\smv.exe" /s ".\" /Q /Y >nul 2>&1
smv x %sname%.svf -br .
if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
call :Footer
pause
goto:SVFISOCreate
:================================================================================================================
::===============================================================================================================
::SOURCE ISO DOWNLOAD
:SourceISODownloadRefresh
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] SOURCE EVAL ISO DOWNLOAD"
echo      [1] 1809
echo:
echo      [2] 1809 Refresh
echo:
echo      [3] 1803
echo:
echo      [4] 1709
echo:
echo      [5] LTSB 2015
echo:
echo      [6] LTSB 2016
echo:
echo      [7] LTSC 2019
echo:
echo      [8] LTSC 2019 Refresh
echo:
echo      [9] SERVER 2016
echo:
echo      [0] SERVER 2019
call :Footer
echo      [B] BACK
call :Footer
CHOICE /C 1234567890B /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 set "build=18091"
if %errorlevel%==2 set "build=18092"
if %errorlevel%==3 set "build=1803"
if %errorlevel%==4 set "build=1709"
if %errorlevel%==5 set "build=1607"
if %errorlevel%==6 set "build=LTSB15"
if %errorlevel%==7 set "build=LTSC19"
if %errorlevel%==8 set "build=LTSC192"
if %errorlevel%==9 set "build=Server2016"
if %errorlevel%==10 set "build=Server2019"
if %errorlevel%==11 goto:SVFISOToolsMenu
cls
call :Header "[HEADER] SOURCE ISO DOWNLOAD"
if "%build%"=="Server2016" goto:SourceServer2016
if "%build%"=="Server2019" goto:SourceServer2016
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
if "%build%"=="18091" if "%arch%"=="x86" (
	set "siname=17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
	set "sihash=ae31e79d3369c3df6842b1e21b7b07781a1dc4c7"
	set "silink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
)
if "%build%"=="18091" if "%arch%"=="x64" (
	set "siname=17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
	set "sihash=b8a6ffac9e15240c39f2ed2b16204341f564208d"
	set "silink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)
if "%build%"=="18092" if "%arch%"=="x86" (
	set "siname=17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
	set "sihash=eee2167b0ea9fe9654357c06d44a9c44eff62f1d"
	set "silink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
)
if "%build%"=="18092" if "%arch%"=="x64" (
	set "siname=17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
	set "sihash=164f022a22d2305e6fbd82f6e35d530b6bbadca8"
	set "silink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)
if "%build%"=="LTSC19" if "%arch%"=="x86" (
	set "siname=17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x86FRE_en-us"
	set "sihash=b11efabfc38428b69042da841e1cb4b105be359b"
	set "silink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x86FRE_en-us.iso"
)
if "%build%"=="LTSC19" if "%arch%"=="x64" (
	set "siname=17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x64FRE_en-us"
	set "sihash=fba7f17ffdf018e4cffd49a9819d719d3708cf09"
	set "silink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_CLIENT_LTSC_EVAL_x64FRE_en-us.iso"
)
if "%build%"=="LTSC192" if "%arch%"=="x86" (
	set "siname=17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x86FRE_en-us"
	set "sihash=ba8e0184c61d88b92fb88046339f8ddc58a3b372"
	set "silink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x86FRE_en-us.iso"
)
if "%build%"=="LTSC192" if "%arch%"=="x64" (
	set "siname=17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x64FRE_en-us"
	set "sihash=369e645a197bc2ca8309cb80467a85a16eacd1a7"
	set "silink=https://software-download.microsoft.com/download/pr/17763.107.101029-1455.rs5_release_svc_refresh_CLIENT_LTSC_EVAL_x64FRE_en-us.iso"
)
if "%build%"=="1803" if "%arch%"=="x86" (
	set "siname=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
	set "sihash=ddb496534203cb98284e5484e0ad60af3c0efce7"
	set "silink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
)
if "%build%"=="1803" if "%arch%"=="x64" (
	set "siname=17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
	set "sihash=a4ea45ec1282e85fc84af49acf7a8d649c31ac5c"
	set "silink=https://software-download.microsoft.com/download/pr/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)
if "%build%"=="1709" if "%arch%"=="x86" (
	set "siname=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
	set "sihash=4a75747a47eb689497fe57d64cec375c7949aa97"
	set "silink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
)
if "%build%"=="1709" if "%arch%"=="x64" (
	set "siname=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
	set "sihash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
	set "silink=https://download.microsoft.com/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)
if "%build%"=="1607" if "%arch%"=="x86" (
	set "siname=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "sihash=fd65bfe31af5fd59d8537210cd829fe3e83feeb2"
	set "silink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
)
if "%build%"=="1607" if "%arch%"=="x64" (
	set "siname=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "sihash=ed6e357cba8d716a6187095e3abd016564670d5b"
	set "silink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
)
if "%build%"=="LTSB15" if "%arch%"=="x86" (
	set "siname=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "sihash=aa8ce9cc9b660b31245622e49e0d183db355558f"
	set "silink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
)
if "%build%"=="LTSB15" if "%arch%"=="x64" (
	set "siname=10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "sihash=90e1c5bada5b96ab05a9fe2035cb26f5cb3cd4d2"
	set "silink=https://download.microsoft.com/download/6/2/4/624ECF83-38A6-4D64-8758-FABC099503DC/10240.16384.150709-1700.TH1_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
)
:SourceServer2016
if "%build%"=="Server2016" (
	set "siname=14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US"
	set "sihash=772700802951b36c8cb26a61c040b9a8dc3816a3"
	set "silink=https://download.microsoft.com/download/1/4/9/149D5452-9B29-4274-B6B3-5361DBDA30BC/14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US.ISO"
)
if "%build%"=="Server2019" (
	set "siname=17763.1.180914-1434.rs5_release_SERVER_EVAL_X64FRE_EN-US"
	set "sihash=c4834f538a90bb41f625144c9a2e0edf8bb9b9b5"
	set "silink=https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_SERVER_EVAL_X64FRE_EN-US.ISO"
)
cls
call :Header "[HEADER] SOURCE ISO DOWNLOAD"
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 goto:SourceISODownloadRefresh
call :Footer
echo [ INFO ] Downloading.
call :Footer
"%aria2c%" -x16 -s16 -d"%cd%" -o"%siname%.iso" --checksum=sha-1=%sihash% "%silink%" -R -c --file-allocation=none --check-certificate=false
call :Footer
pause
goto:SourceISODownloadRefresh
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
::EXIT
:EXIT
ENDLOCAL
exit
:================================================================================================================
::===============================================================================================================
::TITLE
:TITLE
title s1ave77s þ S-M-R-T SVF ISO CONVERTER þ v0.30.18
goto:eof
::===============================================================================================================
::VERSION
:VERSION
set "svfisoconverter=v0.30.18"
goto:eof
:================================================================================================================
::===============================================================================================================
::MENU HEADER
:MenuHeader
call :Graphics
echo:%~1
call :Graphics
goto:eof
:================================================================================================================
::===============================================================================================================
:: HEADER
:Header
call :Graphics
echo:%~1
call :Graphics
echo:
goto:eof
:================================================================================================================
::===============================================================================================================
::MENU FOOTER
:MenuFooter
call :Graphics
goto:eof
:================================================================================================================
::===============================================================================================================
:: FOOTER
:Footer
echo:
call :Graphics
echo:
goto:eof
:================================================================================================================
::===============================================================================================================
:: GRAPHICS
:Graphics
if %cw% geq 150 echo.
if %cw% geq 145 if %cw% lss 150 echo.
if %cw% geq 140 if %cw% lss 145 echo.
if %cw% geq 135 if %cw% lss 140 echo.
if %cw% geq 130 if %cw% lss 135 echo.
if %cw% geq 125 if %cw% lss 130 echo.
if %cw% geq 120 if %cw% lss 125 echo.
if %cw% geq 115 if %cw% lss 120 echo.
if %cw% geq 110 if %cw% lss 115 echo.
if %cw% geq 105 if %cw% lss 110 echo.
if %cw% geq 100 if %cw% lss 105 echo.
if %cw% geq 95 if %cw% lss 100 echo.
if %cw% geq 90 if %cw% lss 95 echo.
if %cw% geq 85 if %cw% lss 90 echo.
if %cw% geq 80 if %cw% lss 85 echo.
if %cw% lss 80 echo.
goto:eof
:================================================================================================================
::===============================================================================================================
:: ARIA SCRIPT
:AriaWrite
>> "aria.txt" (
	echo %~1
	echo 	out=%~2
	echo 	checksum=sha-1=%~3
	echo:
)
goto:eof
:================================================================================================================
::===============================================================================================================
:: ISO HASH CHECK
:ISOHashCheck
echo [ INFO ] Checking ISO Hash.
echo [ INFO ] Hash  : %~1
call :Footer
xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %~2.iso') do set "dhash=%%a"
if not !dhash! equ %~1 (
	busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : !dhash!
	call :Footer
	if exist "*.txt" del /f /q "*.txt" >nul 2>&1
	if exist "*.exe" del /f /q "*.exe" >nul 2>&1
	if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
	if exist "*.sh" del /f /q "*.sh" >nul 2>&1
	pause
	goto:SVFISOMainMenu
)
if !dhash! equ %~1 (
	busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
	echo [ INFO ] Hash  : !dhash!
	call :Footer
)
goto:eof
:================================================================================================================
::===============================================================================================================
:: SOURCE ISO DOWNLOAD
:SourceISODownload
echo [ INFO ] Downloading Eval ISO.
call :Footer
"%aria2c%" -x16 -s16 -d"%cd%" -o"%~2.iso" --checksum=sha-1=%~1 "%~3" -R -c --file-allocation=none --check-certificate=false
if !errorlevel!==0 set "dhash=%fhash%"
if not !errorlevel!==0 (
	xcopy "files\busybox.exe" /s ".\" /Q /Y >nul 2>&1
	busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : !dhash!
	call :Footer
	if exist "*.txt" del /f /q "*.txt" >nul 2>&1
	if exist "*.exe" del /f /q "*.exe" >nul 2>&1
	if exist "*.SMRT" del /f /q "*.SMRT" >nul 2>&1
	if exist "*.sh" del /f /q "*.sh" >nul 2>&1
	pause
	goto:SVFISOMainMenu
)
goto:eof
:================================================================================================================
::===============================================================================================================
:: DECRYPT ISO
:DecryptISO
if [%1] == [] echo No name of file provided && goto :EOF
set "file=%1"
if exist %file% echo %file% exists && goto :EOF
set "OPENSSL_CONF=%~dp0files\openssl.conf"
set "HOME=%~dp0"
pushd %~dp0
if not exist encrypted echo Directory "encrypted" does not exist && goto :EOF
if not exist encrypted.txt echo encrypted.txt does not exist && goto :EOF
for /F "tokens=1,2,3 delims=|" %%i in (encrypted.txt) do (
    if not exist "encrypted/%%i" echo Part %%i does not exist! Cannot continue. && exit /b 1
    call :DECRYPT_FILE "encrypted/%%i" %%j %%k
)
goto:eof
:================================================================================================================
::===============================================================================================================
:DECRYPT_FILE
if [%1] == [] goto :EOF
if [%2] == [] goto :EOF
if [%3] == [] goto :EOF
echo Decrypting %1...
"%~dp0files\openssl.exe" aes256 -d -K %2 -iv %3 -in "%1" >>%file%
goto:eof
:================================================================================================================
::===============================================================================================================
:: ARIA WIN 7SCRIPT
:GenerateList
pushd %~dp0
if not exist download.txt echo download.txt does not exist && goto :EOF
if exist aria2.txt del aria2.txt
for /F "tokens=1,2,3 delims=|" %%i in (download.txt) do call :GEN_ARIA2 %%i %%j "%%k"
goto:eof
:================================================================================================================
::===============================================================================================================
:GEN_ARIA2
if [%1] == [] goto :EOF
if [%2] == [] goto :EOF
if [%3] == [] goto :EOF
set "link="
set "link=%3"
set "link=%link:"=%"
echo %link%>>aria2.txt
echo   out=%1>>aria2.txt
echo   checksum=sha-1=%2>>aria2.txt
echo.>>aria2.txt
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE NON-N
:LangChoice
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] ar-sa = Arabic [Saudi Arabia]
echo [02] bg-bg = Bulgarian [Bulgaria]
echo [03] cs-cz = Czech [Czech Republic]
echo [04] da-dk = Danish [Denmark]
echo [05] de-de = German [Germany]
echo [06] el-gr = Greek [Greece]
echo [07] en-gb = English [United Kingdom]
echo [08] en-us = English [United States]
echo [09] es-es = Spanish [Spain]
echo [10] es-mx = Spanish [Mexico]
echo [11] et-ee = Estonian [Estonia]
echo [12] fi-fi = Finnish [Finland]
echo [13] fr-ca = French [Canada]
echo [14] fr-fr = French [France]
echo [15] he-il = Hebrew [Israel]
echo [16] hr-hr = Croatian [Croatia]
echo [17] hu-hu = Hungarian [Hungary]
echo [18] it-it = Italian [Italy]
echo [19] ja-jp = Japanese [Japan]
echo [20] ko-kr = Korean [Korea]
echo [21] lt-lt = Lithuanian [Lithuania]
echo [22] lv-lv = Latvian [Latvia]
echo [23] nb-no = Norwegian [Norway]
echo [24] nl-nl = Dutch [Netherlands]
echo [25] pl-pl = Polish [Poland]
echo [26] pt-br = Portuguese [Brazil]
echo [27] pt-pt = Portuguese [Portugal]
echo [28] ro-ro = Romanian [Romania]
echo [29] ru-ru = Russian [Russia]
echo [30] sr-latn-rs = Serbian [Serbia]
echo [31] sk-sk = Slovak [Slovakia]
echo [32] sl-si = Slovenian [Slovenia]
echo [33] sv-se = Swedish [Sweden]
echo [34] th-th = Thai [Thailand]
echo [35] tr-tr = Turkish [Turkey]
echo [36] uk-ua = Ukrainian [Ukraine]
echo [37] zh-cn = Chinese [PRC]
echo [38] zh-tw = Chinese [Taiwan]
call :Footer
CHOICE /C 0123 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
if %errorlevel%==4 set "number=30"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "lang=ar-sa"
if %number%==2 set "lang=bg-bg"
if %number%==3 set "lang=cs-cz"
if %number%==4 set "lang=da-dk"
if %number%==5 set "lang=de-de"
if %number%==6 set "lang=el-gr"
if %number%==7 set "lang=en-gb"
if %number%==8 set "lang=en-us"
if %number%==9 set "lang=es-es"
if %number%==10 set "lang=es-mx"
if %number%==11 set "lang=et-ee"
if %number%==12 set "lang=fi-fi"
if %number%==13 set "lang=fr-ca"
if %number%==14 set "lang=fr-fr"
if %number%==15 set "lang=he-il"
if %number%==16 set "lang=hr-hr"
if %number%==17 set "lang=hu-hu"
if %number%==18 set "lang=it-it"
if %number%==19 set "lang=ja-jp"
if %number%==20 set "lang=ko-kr"
if %number%==21 set "lang=lt-lt"
if %number%==22 set "lang=lv-lv"
if %number%==23 set "lang=nb-no"
if %number%==24 set "lang=nl-nl"
if %number%==25 set "lang=pl-pl"
if %number%==26 set "lang=pt-br"
if %number%==27 set "lang=pt-pt"
if %number%==28 set "lang=ro-ro"
if %number%==29 set "lang=ru-ru"
if %number%==30 set "lang=sr-latn-rs"
if %number%==31 set "lang=sk-sk"
if %number%==32 set "lang=sl-si"
if %number%==33 set "lang=sv-se"
if %number%==34 set "lang=th-th"
if %number%==35 set "lang=tr-tr"
if %number%==36 set "lang=uk-ua"
if %number%==37 set "lang=zh-cn"
if %number%==38 set "lang=zh-tw"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE TECHBENCH 10
:LangChoiceTB
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] ar-sa = Arabic [Saudi Arabia]
echo [02] bg-bg = Bulgarian [Bulgaria]
echo [03] cs-cz = Czech [Czech Republic]
echo [04] da-dk = Danish [Denmark]
echo [05] de-de = German [Germany]
echo [06] el-gr = Greek [Greece]
echo [07] en-gb = English [United Kingdom]
echo [08] en-us = English [United States]
echo [09] es-es = Spanish [Spain]
echo [10] es-mx = Spanish [Mexico]
echo [11] et-ee = Estonian [Estonia]
echo [12] fi-fi = Finnish [Finland]
echo [13] fr-ca = French [Canada]
echo [14] fr-fr = French [France]
echo [15] he-il = Hebrew [Israel]
echo [16] hr-hr = Croatian [Croatia]
echo [17] hu-hu = Hungarian [Hungary]
echo [18] it-it = Italian [Italy]
echo [19] ja-jp = Japanese [Japan]
echo [20] ko-kr = Korean [Korea]
echo [21] lt-lt = Lithuanian [Lithuania]
echo [22] lv-lv = Latvian [Latvia]
echo [23] nb-no = Norwegian [Norway]
echo [24] nl-nl = Dutch [Netherlands]
echo [25] pl-pl = Polish [Poland]
echo [26] pt-br = Portuguese [Brazil]
echo [27] pt-pt = Portuguese [Portugal]
echo [28] ro-ro = Romanian [Romania]
echo [29] ru-ru = Russian [Russia]
echo [30] sr-latn-rs = Serbian [Serbia]
echo [31] sk-sk = Slovak [Slovakia]
echo [32] sl-si = Slovenian [Slovenia]
echo [33] sv-se = Swedish [Sweden]
echo [34] th-th = Thai [Thailand]
echo [35] tr-tr = Turkish [Turkey]
echo [36] uk-ua = Ukrainian [Ukraine]
echo [37] zh-cn = Chinese [PRC]
echo [38] zh-tw = Chinese [Taiwan]
call :Footer
CHOICE /C 0123 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
if %errorlevel%==4 set "number=30"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "tblang=Arabic"
if %number%==2 set "tblang=Bulgarian"
if %number%==3 set "tblang=Czech"
if %number%==4 set "tblang=Danish"
if %number%==5 set "tblang=German"
if %number%==6 set "tblang=Greek"
if %number%==7 set "tblang=EnglishInternational"
if %number%==8 set "tblang=English"
if %number%==9 set "tblang=Spanish"
if %number%==10 set "tblang=Spanish(Mexico)"
if %number%==11 set "tblang=Estonian"
if %number%==12 set "tblang=Finnish"
if %number%==13 set "tblang=FrenchCanadian"
if %number%==14 set "tblang=French"
if %number%==15 set "tblang=Hebrew"
if %number%==16 set "tblang=Croatian"
if %number%==17 set "tblang=Hungarian"
if %number%==18 set "tblang=Italian"
if %number%==19 set "tblang=Japanese"
if %number%==20 set "tblang=Korean"
if %number%==21 set "tblang=Lithuanian"
if %number%==22 set "tblang=Latvian"
if %number%==23 set "tblang=Norwegian"
if %number%==24 set "tblang=Dutch"
if %number%==25 set "tblang=Polish"
if %number%==26 set "tblang=BrazilianPortuguese"
if %number%==27 set "tblang=Portuguese"
if %number%==28 set "tblang=Romanian"
if %number%==29 set "tblang=Russian"
if %number%==30 set "tblang=SerbianLatin"
if %number%==31 set "tblang=Slovak"
if %number%==32 set "tblang=Slovenian"
if %number%==33 set "tblang=Swedish"
if %number%==34 set "tblang=Thai"
if %number%==35 set "tblang=Turkish"
if %number%==36 set "tblang=Ukrainian"
if %number%==37 set "tblang=Chinese(Simplified)"
if %number%==38 set "tblang=Chinese(Traditional)"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE VLSC
:LangChoiceVLSC
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] ar-sa = Arabic [Saudi Arabia]
echo [02] bg-bg = Bulgarian [Bulgaria]
echo [03] cs-cz = Czech [Czech Republic]
echo [04] da-dk = Danish [Denmark]
echo [05] de-de = German [Germany]
echo [06] el-gr = Greek [Greece]
echo [07] en-gb = English [United Kingdom]
echo [08] en-us = English [United States]
echo [09] es-es = Spanish [Spain]
echo [10] es-mx = Spanish [Mexico]
echo [11] et-ee = Estonian [Estonia]
echo [12] fi-fi = Finnish [Finland]
echo [13] fr-ca = French [Canada]
echo [14] fr-fr = French [France]
echo [15] he-il = Hebrew [Israel]
echo [16] hr-hr = Croatian [Croatia]
echo [17] hu-hu = Hungarian [Hungary]
echo [18] it-it = Italian [Italy]
echo [19] ja-jp = Japanese [Japan]
echo [20] ko-kr = Korean [Korea]
echo [21] lt-lt = Lithuanian [Lithuania]
echo [22] lv-lv = Latvian [Latvia]
echo [23] nb-no = Norwegian [Norway]
echo [24] nl-nl = Dutch [Netherlands]
echo [25] pl-pl = Polish [Poland]
echo [26] pt-br = Portuguese [Brazil]
echo [27] pt-pt = Portuguese [Portugal]
echo [28] ro-ro = Romanian [Romania]
echo [29] ru-ru = Russian [Russia]
echo [30] sr-latn-rs = Serbian [Serbia]
echo [31] sk-sk = Slovak [Slovakia]
echo [32] sl-si = Slovenian [Slovenia]
echo [33] sv-se = Swedish [Sweden]
echo [34] th-th = Thai [Thailand]
echo [35] tr-tr = Turkish [Turkey]
echo [36] uk-ua = Ukrainian [Ukraine]
echo [37] zh-cn = Chinese [PRC]
echo [38] zh-tw = Chinese [Taiwan]
call :Footer
CHOICE /C 0123 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
if %errorlevel%==4 set "number=30"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "tblang=Arabic"
if %number%==2 set "tblang=Bulgarian"
if %number%==3 set "tblang=Czech"
if %number%==4 set "tblang=Danish"
if %number%==5 set "tblang=German"
if %number%==6 set "tblang=Greek"
if %number%==7 set "tblang=English_International"
if %number%==8 set "tblang=English_MLF"
if %number%==9 set "tblang=Spanish_MLF"
if %number%==10 set "tblang=Spanish_Latam"
if %number%==11 set "tblang=Estonian"
if %number%==12 set "tblang=Finnish"
if %number%==13 set "tblang=French_Canadian"
if %number%==14 set "tblang=French_MLF"
if %number%==15 set "tblang=Hebrew"
if %number%==16 set "tblang=Croatian"
if %number%==17 set "tblang=Hungarian"
if %number%==18 set "tblang=Italian"
if %number%==19 set "tblang=Japanese"
if %number%==20 set "tblang=Korean"
if %number%==21 set "tblang=Lithuanian"
if %number%==22 set "tblang=Latvian"
if %number%==23 set "tblang=Norwegian"
if %number%==24 set "tblang=Dutch"
if %number%==25 set "tblang=Polish"
if %number%==26 set "tblang=Brazilian_MLF"
if %number%==27 set "tblang=Portuguese_MLF"
if %number%==28 set "tblang=Romanian"
if %number%==29 set "tblang=Russian"
if %number%==30 set "tblang=Serbian_Latin"
if %number%==31 set "tblang=Slovak"
if %number%==32 set "tblang=Slovenian"
if %number%==33 set "tblang=Swedish"
if %number%==34 set "tblang=Thai"
if %number%==35 set "tblang=Turkish"
if %number%==36 set "tblang=Ukrainian"
if %number%==37 set "tblang=Chinese_Simplified"
if %number%==38 set "tblang=Chinese_Traditional"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE TB 8.1
:LangChoice81
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] ar-sa = Arabic [Saudi Arabia]
echo [02] bg-bg = Bulgarian [Bulgaria]
echo [03] cs-cz = Czech [Czech Republic]
echo [04] da-dk = Danish [Denmark]
echo [05] de-de = German [Germany]
echo [06] el-gr = Greek [Greece]
echo [07] en-gb = English [United Kingdom]
echo [08] en-us = English [United States]
echo [09] es-es = Spanish [Spain]
echo [10] et-ee = Estonian [Estonia]
echo [11] fi-fi = Finnish [Finland]
echo [12] fr-fr = French [France]
echo [13] he-il = Hebrew [Israel]
echo [14] hr-hr = Croatian [Croatia]
echo [15] hu-hu = Hungarian [Hungary]
echo [16] it-it = Italian [Italy]
echo [17] ja-jp = Japanese [Japan]
echo [18] ko-kr = Korean [Korea]
echo [19] lt-lt = Lithuanian [Lithuania]
echo [20] lv-lv = Latvian [Latvia]
echo [21] nb-no = Norwegian [Norway]
echo [22] nl-nl = Dutch [Netherlands]
echo [23] pl-pl = Polish [Poland]
echo [24] pt-br = Portuguese [Brazil]
echo [25] pt-pt = Portuguese [Portugal]
echo [26] ro-ro = Romanian [Romania]
echo [27] ru-ru = Russian [Russia]
echo [28] sr-latn-rs = Serbian [Serbia]
echo [29] sk-sk = Slovak [Slovakia]
echo [30] sl-si = Slovenian [Slovenia]
echo [31] sv-se = Swedish [Sweden]
echo [32] th-th = Thai [Thailand]
echo [33] tr-tr = Turkish [Turkey]
echo [34] uk-ua = Ukrainian [Ukraine]
echo [35] zh-cn = Chinese [PRC]
echo [36] zh-tw = Chinese [Taiwan]
echo [37] zh-hk = Chinese [Hong Kong]
call :Footer
CHOICE /C 0123 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
if %errorlevel%==4 set "number=30"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "tblang=Arabic"
if %number%==2 set "tblang=Bulgarian"
if %number%==3 set "tblang=Czech"
if %number%==4 set "tblang=Danish"
if %number%==5 set "tblang=German"
if %number%==6 set "tblang=Greek"
if %number%==7 set "tblang=EnglishInternational"
if %number%==8 set "tblang=English"
if %number%==9 set "tblang=Spanish"
if %number%==10 set "tblang=Estonian"
if %number%==11 set "tblang=Finnish"
if %number%==12 set "tblang=French"
if %number%==13 set "tblang=Hebrew"
if %number%==14 set "tblang=Croatian"
if %number%==15 set "tblang=Hungarian"
if %number%==16 set "tblang=Italian"
if %number%==17 set "tblang=Japanese"
if %number%==18 set "tblang=Korean"
if %number%==19 set "tblang=Lithuanian"
if %number%==20 set "tblang=Latvian"
if %number%==21 set "tblang=Norwegian"
if %number%==22 set "tblang=Dutch"
if %number%==23 set "tblang=Polish"
if %number%==24 set "tblang=BrazilianPortuguese"
if %number%==25 set "tblang=Portuguese"
if %number%==26 set "tblang=Romanian"
if %number%==27 set "tblang=Russian"
if %number%==28 set "tblang=SerbianLatin"
if %number%==29 set "tblang=Slovak"
if %number%==30 set "tblang=Slovenian"
if %number%==31 set "tblang=Swedish"
if %number%==32 set "tblang=Thai"
if %number%==33 set "tblang=Turkish"
if %number%==34 set "tblang=Ukrainian"
if %number%==35 set "tblang=Chinese(Simplified)"
if %number%==36 set "tblang=Chinese(Traditional)"
if %number%==37 set "tblang=Chinese(TraditionalHongKong)"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE TB 8.1 N
:LangChoice81N
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] bg-bg = Bulgarian [Bulgaria]
echo [02] cs-cz = Czech [Czech Republic]
echo [03] da-dk = Danish [Denmark]
echo [04] de-de = German [Germany]
echo [05] el-gr = Greek [Greece]
echo [06] en-gb = English [United Kingdom]
echo [07] en-us = English [United States]
echo [08] es-es = Spanish [Spain]
echo [09] et-ee = Estonian [Estonia]
echo [10] fi-fi = Finnish [Finland]
echo [11] fr-fr = French [France]
echo [12] hr-hr = Croatian [Croatia]
echo [13] hu-hu = Hungarian [Hungary]
echo [14] it-it = Italian [Italy]
echo [15] ko-kr = Korean [Korea]
echo [16] lt-lt = Lithuanian [Lithuania]
echo [17] lv-lv = Latvian [Latvia]
echo [18] nb-no = Norwegian [Norway]
echo [19] nl-nl = Dutch [Netherlands]
echo [20] pl-pl = Polish [Poland]
echo [21] pt-pt = Portuguese [Portugal]
echo [22] ro-ro = Romanian [Romania]
echo [23] sk-sk = Slovak [Slovakia]
echo [24] sl-si = Slovenian [Slovenia]
echo [25] sv-se = Swedish [Sweden]
call :Footer
CHOICE /C 012 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "tblang=Bulgarian"
if %number%==2 set "tblang=Czech"
if %number%==3 set "tblang=Danish"
if %number%==4 set "tblang=German"
if %number%==5 set "tblang=Greek"
if %number%==6 set "tblang=EnglishInternational"
if %number%==7 set "tblang=English"
if %number%==8 set "tblang=Spanish"
if %number%==9 set "tblang=Estonian"
if %number%==10 set "tblang=Finnish"
if %number%==11 set "tblang=French"
if %number%==12 set "tblang=Croatian"
if %number%==13 set "tblang=Hungarian"
if %number%==14 set "tblang=Italian"
if %number%==15 set "tblang=Korean"
if %number%==16 set "tblang=Lithuanian"
if %number%==17 set "tblang=Latvian"
if %number%==18 set "tblang=Norwegian"
if %number%==19 set "tblang=Dutch"
if %number%==20 set "tblang=Polish"
if %number%==21 set "tblang=Portuguese"
if %number%==22 set "tblang=Romanian"
if %number%==23 set "tblang=Slovak"
if %number%==24 set "tblang=Slovenian"
if %number%==25 set "tblang=Swedish"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE SERVER 2016
:LangChoiceS
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] cs-cz = Czech [Czech Republic]
echo [02] de-de = German [Germany]
echo [03] en-us = English [United States]
echo [04] es-es = Spanish [Spain]
echo [05] fr-fr = French [France]
echo [06] hu-hu = Hungarian [Hungary]
echo [07] it-it = Italian [Italy]
echo [08] ja-jp = Japanese [Japan]
echo [09] ko-kr = Korean [Korea]
echo [10] nl-nl = Dutch [Netherlands]
echo [11] pl-pl = Polish [Poland]
echo [12] pt-br = Portuguese [Brazil]
echo [13] pt-pt = Portuguese [Portugal]
echo [14] ru-ru = Russian [Russia]
echo [15] sv-se = Swedish [Sweden]
echo [16] tr-tr = Turkish [Turkey]
echo [17] zh-cn = Chinese [PRC]
echo [18] zh-tw = Chinese [Taiwan]
call :Footer
CHOICE /C 01 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "lang=cs-cz"
if %number%==2 set "lang=de-de"
if %number%==3 set "lang=en-us"
if %number%==4 set "lang=es-es"
if %number%==5 set "lang=fr-fr"
if %number%==6 set "lang=hu-hu"
if %number%==7 set "lang=it-it"
if %number%==8 set "lang=ja-jp"
if %number%==9 set "lang=ko-kr"
if %number%==10 set "lang=nl-nl"
if %number%==11 set "lang=pl-pl"
if %number%==12 set "lang=pt-br"
if %number%==13 set "lang=pt-pt"
if %number%==14 set "lang=ru-ru"
if %number%==15 set "lang=sv-se"
if %number%==16 set "lang=tr-tr"
if %number%==17 set "lang=zh-cn"
if %number%==18 set "lang=zh-tw"
goto:eof
:================================================================================================================
::===============================================================================================================
:: LANGUAGE CHOICE N
:LangChoiceN
echo Enter chosen language Number.
echo:
echo Available:
echo:
echo [01] bg-bg = Bulgarian [Bulgaria]
echo [02] cs-cz = Czech [Czech Republic]
echo [03] da-dk = Danish [Denmark]
echo [04] de-de = German [Germany]
echo [05] el-gr = Greek [Greece]
echo [06] en-gb = English [United Kingdom]
echo [07] en-us = English [United States]
echo [08] es-es = Spanish [Spain]
echo [09] et-ee = Estonian [Estonia]
echo [10] fi-fi = Finnish [Finland]
echo [11] fr-fr = French [France]
echo [12] hr-hr = Croatian [Croatia]
echo [13] hu-hu = Hungarian [Hungary]
echo [14] it-it = Italian [Italy]
echo [15] lt-lt = Lithuanian [Lithuania]
echo [16] lv-lv = Latvian [Latvia]
echo [17] nb-no = Norwegian [Norway]
echo [18] nl-nl = Dutch [Netherlands]
echo [19] pl-pl = Polish [Poland]
echo [20] pt-pt = Portuguese [Portugal]
echo [21] ro-ro = Romanian [Romania]
echo [22] sk-sk = Slovak [Slovakia]
echo [23] sl-si = Slovenian [Slovenia]
echo [24] sv-se = Swedish [Sweden]
call :Footer
CHOICE /C 012 /N /M "[ USER ] Enter Digit One:"
if %errorlevel%==1 set "number=0"
if %errorlevel%==2 set "number=10"
if %errorlevel%==3 set "number=20"
call :Footer
CHOICE /C 1234567890 /N /M "[ USER ] Enter Digit Two:"
if %errorlevel%==1 set /a number+=1
if %errorlevel%==2 set /a number+=2
if %errorlevel%==3 set /a number+=3
if %errorlevel%==4 set /a number+=4
if %errorlevel%==5 set /a number+=5
if %errorlevel%==6 set /a number+=6
if %errorlevel%==7 set /a number+=7
if %errorlevel%==8 set /a number+=8
if %errorlevel%==9 set /a number+=9
if %errorlevel%==10 set /a number+=0
if %number%==1 set "lang=bg-bg"
if %number%==2 set "lang=cs-cz"
if %number%==3 set "lang=da-dk"
if %number%==4 set "lang=de-de"
if %number%==5 set "lang=el-gr"
if %number%==6 set "lang=en-gb"
if %number%==7 set "lang=en-us"
if %number%==8 set "lang=es-es"
if %number%==9 set "lang=et-ee"
if %number%==10 set "lang=fi-fi"
if %number%==11 set "lang=fr-fr"
if %number%==12 set "lang=hr-hr"
if %number%==13 set "lang=hu-hu"
if %number%==14 set "lang=it-it"
if %number%==15 set "lang=lt-lt"
if %number%==16 set "lang=lv-lv"
if %number%==17 set "lang=nb-no"
if %number%==18 set "lang=nl-nl"
if %number%==19 set "lang=pl-pl"
if %number%==20 set "lang=pt-pt"
if %number%==21 set "lang=ro-ro"
if %number%==22 set "lang=sk-sk"
if %number%==23 set "lang=sl-si"
if %number%==24 set "lang=sv-se"
goto:eof
:================================================================================================================
::===============================================================================================================
:BusyBox
pushd %~dp0
cd /d "%~dp0"
if [%~2]==[] if [%~3]==[] (
	busybox ash -c "./download.sh "%~1""
)
if not [%~2]==[] if [%~3]==[] (
	busybox ash -c "./download.sh "%~1" "%~2""
)

if not [%~3]==[] if [%~5]==[] (
	if [%~3]==[x86] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20CLIENT%%20x86%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20CLIENT%%20x64%%20SVF/%~2""
	if [%~3]==[x86] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME%%20x86%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME%%20x64%%20SVF/%~2""
)
if not [%~3]==[] if [%~5]==[16299.15] (
	if [%~3]==[x86] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20Client/EN2XX%%20x86%%20Multi%%20Client%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20Client/EN2XX%%20x64%%20Multi%%20Client%%20SVF/%~2""
	if [%~3]==[x86] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME/EN2XX%%20x86%%20Multi%%20VOLUME%%20SVF/%~2""
	if [%~3]==[x64] if [%~4]==[edition_vl_version] busybox ash -c "./download.sh "%~1" "EN2XX%%20Multi%%20VOLUME/EN2XX%%20x64%%20Multi%%20VOLUME%%20SVF/%~2""
)
goto:eof
:================================================================================================================
::===============================================================================================================
:BusyBoxTB
>>busybox.cmd (
echo @echo off
echo pushd %%~dp0
echo cd /d "%%~dp0"
echo busybox ash -c "./getLink.sh "%%~1" "%%~2""
echo goto:eof
)
goto:eof
:================================================================================================================
::===============================================================================================================
:SpaceTest
	echo:
	echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	echo:
    echo Current directory contains spaces in its path.
	echo:
    echo Please move or rename the directory to one not containing spaces.
	echo:
	echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	echo:
    pause
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBWin7Ent STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBWin7Ent
>>database.7ent.smrt (
echo ar-sa^|5f7e81a84e64270764c3c649598370015e341c7b^|ar_windows_7_enterprise_with_sp1_x64_dvd_u_677643^|pK8rKq5r5c6vcDw
echo bg-bg^|663cc5c033349edb33d249dc027bc5dcc662cdbf^|bg_windows_7_enterprise_with_sp1_x64_dvd_u_677644^|pK8rKq5r5c6vcDw
echo cs-cz^|15eabd7c46b6056bc4a64bd48fe7b0d782cd3d79^|cs_windows_7_enterprise_with_sp1_x64_dvd_u_677646^|pK8rKq5r5c6vcDw
echo da-dk^|940959e3588175fea0fad5dcb90b4601a7bac412^|da_windows_7_enterprise_with_sp1_x64_dvd_u_677648^|pK8rKq5r5c6vcDw
echo de-de^|08b453546e193a65d13d436e3c37ced7256e1988^|de_windows_7_enterprise_with_sp1_x64_dvd_u_677649^|pK8rKq5r5c6vcDw
echo el-gr^|0c597523ecbca195d0cbaf2fb4ff9213b4c739e2^|el_windows_7_enterprise_with_sp1_x64_dvd_u_677650^|pK8rKq5r5c6vcDw
echo en-us^|a491f985dccfb5863f31b728dddbedb2ff4df8d1^|en_windows_7_enterprise_with_sp1_x64_dvd_u_677651^|pK8rKq5r5c6vcDw
echo es-es^|71e51e3acde2a3285a62498200faff2fd2ef961f^|es_windows_7_enterprise_with_sp1_x64_dvd_u_677652^|pK8rKq5r5c6vcDw
echo et-ee^|a43031cb06c3ba05826b2e178fa5c1050d02e82f^|et_windows_7_enterprise_with_sp1_x64_dvd_u_677653^|pK8rKq5r5c6vcDw
echo fi-fi^|52d26df3e42e36c9a0bcc6810ebca8a5a896efb6^|fi_windows_7_enterprise_with_sp1_x64_dvd_u_677655^|pK8rKq5r5c6vcDw
echo fr-fr^|f4ce88f05859c3ce37f6bbd3bc1afa70f0c28312^|fr_windows_7_enterprise_with_sp1_x64_dvd_u_677656^|pK8rKq5r5c6vcDw
echo he-il^|3bf6f38c6dd4457d2d72075fbb02c916d9b79f0f^|he_windows_7_enterprise_with_sp1_x64_dvd_u_677657^|pK8rKq5r5c6vcDw
echo hr-hr^|1041c3acaa85f0a6f584c35e72681b11c98f1039^|hr_windows_7_enterprise_with_sp1_x64_dvd_u_677658^|pK8rKq5r5c6vcDw
echo hu-hu^|26071dfc510e6cee01e7cfdacd062d5e25f455cb^|hu_windows_7_enterprise_with_sp1_x64_dvd_u_677659^|pK8rKq5r5c6vcDw
echo it-it^|a7957da67d5fd9cd3ee95b9d0299a330c66651d4^|it_windows_7_enterprise_with_sp1_x64_dvd_u_677660^|pK8rKq5r5c6vcDw
echo ja-jp^|97b7ac0f639da75763c781bb2c07d0d73eb7ba03^|ja_windows_7_enterprise_with_sp1_x64_dvd_u_677662^|pK8rKq5r5c6vcDw
echo ko-kr^|fd0b96e2e133e65e3243811fefc1d6bdf74e9c75^|ko_windows_7_enterprise_k_with_sp1_x64_dvd_u_677728^|pK8rKq5r5c6vcDw
echo lt-lt^|055e331287038c78e3bd535bb646d213ff93b5f3^|lt_windows_7_enterprise_with_sp1_x64_dvd_u_677663^|pK8rKq5r5c6vcDw
echo lv-lv^|f2b002a74fe0b90967f7f4cf2ff50f7a1fbd9e05^|lv_windows_7_enterprise_with_sp1_x64_dvd_u_677664^|pK8rKq5r5c6vcDw
echo nl-nl^|75ba5e17fec17bd478bd67752b99e4341eb27752^|nl_windows_7_enterprise_with_sp1_x64_dvd_u_677666^|pK8rKq5r5c6vcDw
echo pl-pl^|b1d896a54035fcadad98bfd1d5a05bc71b393a70^|pl_windows_7_enterprise_with_sp1_x64_dvd_u_677667^|pK8rKq5r5c6vcDw
echo pt-br^|1e92c1edf09ccd15312316121797a91c0a7ffb78^|pt_windows_7_enterprise_with_sp1_x64_dvd_u_677668^|pK8rKq5r5c6vcDw
echo pt-pt^|3083e2b7b4e6ae0ca383f33153cb5f385b90d364^|pp_windows_7_enterprise_with_sp1_x64_dvd_u_677669^|pK8rKq5r5c6vcDw
echo ro-ro^|16b4cd8ed50c527372c554cd6255aa03d8cc24ed^|ro_windows_7_enterprise_with_sp1_x64_dvd_u_677670^|pK8rKq5r5c6vcDw
echo ru-ru^|5d73a18d79aa78f85f68e98cc4abdeba801f9b7f^|ru_windows_7_enterprise_with_sp1_x64_dvd_u_677671^|pK8rKq5r5c6vcDw
echo sk-sk^|864dcb281e6b9a7b8a01a93c8bf04335f8555ce3^|sk_windows_7_enterprise_with_sp1_x64_dvd_u_677673^|pK8rKq5r5c6vcDw
echo sl-si^|11ea1a91225fb9412454c4dca62b3206df7d34b7^|sl_windows_7_enterprise_with_sp1_x64_dvd_u_677674^|pK8rKq5r5c6vcDw
echo sv-se^|fd77e0b50d82c3b5cb45f0c79aad36856ce262ee^|sv_windows_7_enterprise_with_sp1_x64_dvd_u_677676^|pK8rKq5r5c6vcDw
echo th-th^|dc8d7f935fdba1a85145f3b9b730f54197accfec^|th_windows_7_enterprise_with_sp1_x64_dvd_u_677678^|pK8rKq5r5c6vcDw
echo tr-tr^|409b4815133025ac2adfa293a25a0f3cc8881b52^|tr_windows_7_enterprise_with_sp1_x64_dvd_u_677681^|pK8rKq5r5c6vcDw
echo uk-ua^|320e9cab51bf8dbf6f6b7f2e609824dcb36951d8^|uk_windows_7_enterprise_with_sp1_x64_dvd_u_677683^|pK8rKq5r5c6vcDw
echo zh-cn^|9ba5e85596c2f25be59f7e96139d83d4cb261a62^|cn_windows_7_enterprise_with_sp1_x64_dvd_u_677685^|pK8rKq5r5c6vcDw
echo zh-tw^|863842bbef9af66fdd088d4825e5a30961ea6f36^|hk_windows_7_enterprise_with_sp1_x64_dvd_u_677687^|pK8rKq5r5c6vcDw
echo ar-sa^|11bb8461c3d69d8fb35498e1ca0ed5a3b99a60d3^|ar_windows_7_enterprise_with_sp1_x86_dvd_u_677691^|pK8rKq5r5c6vcDw
echo bg-bg^|4db6291b66a4fee786640bfd9ac904a0b714d400^|bg_windows_7_enterprise_with_sp1_x86_dvd_u_677693^|pK8rKq5r5c6vcDw
echo cs-cz^|124fd95d7cf60f4e7ebf2ab5d63c4e5aafb37b5e^|cs_windows_7_enterprise_with_sp1_x86_dvd_u_677695^|pK8rKq5r5c6vcDw
echo da-dk^|58afdf7dc272582bad080c105d974897055e8d8a^|da_windows_7_enterprise_with_sp1_x86_dvd_u_677698^|pK8rKq5r5c6vcDw
echo de-de^|5e17ca17724b8f5bd1c541dbe75f3a8723090e2f^|de_windows_7_enterprise_with_sp1_x86_dvd_u_677702^|pK8rKq5r5c6vcDw
echo el-gr^|5c3e6254d1f2c64d777d495b20d2f96d9ba7778f^|el_windows_7_enterprise_with_sp1_x86_dvd_u_677706^|pK8rKq5r5c6vcDw
echo en-us^|4e0450ac73ab6f9f755eb422990cd9c7a1f3509c^|en_windows_7_enterprise_with_sp1_x86_dvd_u_677710^|pK8rKq5r5c6vcDw
echo es-es^|41711171154772e3ac66bbb00078b809baf961a5^|es_windows_7_enterprise_with_sp1_x86_dvd_u_677714^|pK8rKq5r5c6vcDw
echo et-ee^|8424b0533b1124a0f5f3dd4df277378331b55460^|et_windows_7_enterprise_with_sp1_x86_dvd_u_677718^|pK8rKq5r5c6vcDw
echo fi-fi^|327f5065065ff60202c66f793000460a758f0f73^|fi_windows_7_enterprise_with_sp1_x86_dvd_u_677722^|pK8rKq5r5c6vcDw
echo fr-fr^|e88abe98bd4fc0f6219aef923e9745cd81c4cd94^|fr_windows_7_enterprise_with_sp1_x86_dvd_u_677727^|pK8rKq5r5c6vcDw
echo he-il^|5bfb7badd54d75b6fabdd4c44685932cf1d97da1^|he_windows_7_enterprise_with_sp1_x86_dvd_u_677733^|pK8rKq5r5c6vcDw
echo hr-hr^|ed3d9e26402d5a0d902b3f222458712008c43346^|hr_windows_7_enterprise_with_sp1_x86_dvd_u_677739^|pK8rKq5r5c6vcDw
echo hu-hu^|5824c48d2ed4644462563984e9be8c7f0fa01c2e^|hu_windows_7_enterprise_with_sp1_x86_dvd_u_677744^|pK8rKq5r5c6vcDw
echo it-it^|ae3fee1cf2964fd4dd95bb21f0780e8ab0fd9a02^|it_windows_7_enterprise_with_sp1_x86_dvd_u_677749^|pK8rKq5r5c6vcDw
echo ja-jp^|b7ae126c5fb6abeef7cc56e5baf5913257d5b693^|ja_windows_7_enterprise_with_sp1_x86_dvd_u_677757^|pK8rKq5r5c6vcDw
echo ko-kr^|c4d5c1f991cf65e38b44fc43b8fdb74e605443db^|ko_windows_7_enterprise_k_with_sp1_x86_dvd_u_677732^|pK8rKq5r5c6vcDw
echo lt-lt^|ab04ae24bd8514ca16cf39be9831254540626243^|lt_windows_7_enterprise_with_sp1_x86_dvd_u_677764^|pK8rKq5r5c6vcDw
echo lv-lv^|968bd4c52758d4b4e1143532689449cc33af9cfb^|lv_windows_7_enterprise_with_sp1_x86_dvd_u_677677^|pK8rKq5r5c6vcDw
echo nl-nl^|9259a5adbb59fc99b74c6609b3b89010a254fd66^|nl_windows_7_enterprise_with_sp1_x86_dvd_u_677682^|pK8rKq5r5c6vcDw
echo pl-pl^|35667652d3f4bf81c2994b8d5bedf8d2f78de3b2^|pl_windows_7_enterprise_with_sp1_x86_dvd_u_677684^|pK8rKq5r5c6vcDw
echo pt-br^|2f9e8aa71cb0c27e3cf51d4a3876c1f171a58d0e^|pt_windows_7_enterprise_with_sp1_x86_dvd_u_677686^|pK8rKq5r5c6vcDw
echo pt-pt^|db75c08c692637b38dc2e3650758c234e14834fe^|pp_windows_7_enterprise_with_sp1_x86_dvd_u_677688^|pK8rKq5r5c6vcDw
echo ro-ro^|dde10495b24456322a540678f9b0462c8468f151^|ro_windows_7_enterprise_with_sp1_x86_dvd_u_677690^|pK8rKq5r5c6vcDw
echo ru-ru^|0ffcd21535224490583507867573b4c7caba4b7d^|ru_windows_7_enterprise_with_sp1_x86_dvd_u_677692^|pK8rKq5r5c6vcDw
echo sk-sk^|99747289b7cb6817bdba4316d3540e60aa50dd72^|sk_windows_7_enterprise_with_sp1_x86_dvd_u_677694^|pK8rKq5r5c6vcDw
echo sl-si^|003573c586f1240cbbcf21e593e95c35a331dcf3^|sl_windows_7_enterprise_with_sp1_x86_dvd_u_677696^|pK8rKq5r5c6vcDw
echo sv-se^|0703215113ab4255b521a7b1e19f75e5a54d7602^|sv_windows_7_enterprise_with_sp1_x86_dvd_u_677701^|pK8rKq5r5c6vcDw
echo th-th^|d13d7a3cfcaee311305deb8a14969a0366a15a17^|th_windows_7_enterprise_with_sp1_x86_dvd_u_677705^|pK8rKq5r5c6vcDw
echo tr-tr^|f8345c921b2837f8f38860dac2517f2fe02433d4^|tr_windows_7_enterprise_with_sp1_x86_dvd_u_677708^|pK8rKq5r5c6vcDw
echo uk-ua^|4f1a557280b28d60a9433510ab5cd5e5505f4ad9^|uk_windows_7_enterprise_with_sp1_x86_dvd_u_677712^|pK8rKq5r5c6vcDw
echo zh-cn^|c488b3d72ddc4ac63bcdca36820bb986a1e670ac^|cn_windows_7_enterprise_with_sp1_x86_dvd_u_677716^|pK8rKq5r5c6vcDw
echo zh-tw^|4f2a1bb30cb90c0fab4b543a80488b4ce723b93b^|hk_windows_7_enterprise_with_sp1_x86_dvd_u_677720^|pK8rKq5r5c6vcDw
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBWin7Ult STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBWin7Ult
>>database.7ult.smrt (
echo ar-sa^|25565487abef877ebc6688c20a65e1c670b1f92d^|ar_windows_7_ultimate_with_sp1_x64_dvd_u_677345^|pK8rKq5r5c6vcDw
echo bg-bg^|f408a16822a0445b68db294707a06cbe874704ec^|bg_windows_7_ultimate_with_sp1_x64_dvd_u_677363^|pK8rKq5r5c6vcDw
echo cs-cz^|ccf08ed048978ff7f902b76a19288d3b6f7fa901^|cs_windows_7_ultimate_with_sp1_x64_dvd_u_677376^|pK8rKq5r5c6vcDw
echo da-dk^|324c85b0d952ec267b2ddb5a9760ede1497e775c^|da_windows_7_ultimate_with_sp1_x64_dvd_u_677294^|pK8rKq5r5c6vcDw
echo de-de^|0388de83934b51f44447e1435ca0ff5eb99d20b6^|de_windows_7_ultimate_with_sp1_x64_dvd_u_677306^|pK8rKq5r5c6vcDw
echo el-gr^|88fa98c86c9b919501f71bbbc559c8565d808832^|el_windows_7_ultimate_with_sp1_x64_dvd_u_677318^|pK8rKq5r5c6vcDw
echo en-us^|36ae90defbad9d9539e649b193ae573b77a71c83^|en_windows_7_ultimate_with_sp1_x64_dvd_u_677332^|pK8rKq5r5c6vcDw
echo es-es^|af4b835557b5f15b574a3a643eecaf922fc1236c^|es_windows_7_ultimate_with_sp1_x64_dvd_u_677350^|pK8rKq5r5c6vcDw
echo et-ee^|a276277be05b62154965e9be2c80665cab91e213^|et_windows_7_ultimate_with_sp1_x64_dvd_u_677368^|pK8rKq5r5c6vcDw
echo fi-fi^|23c57b632d12e5de40543334be3dc56cdc4f9fd9^|fi_windows_7_ultimate_with_sp1_x64_dvd_u_677378^|pK8rKq5r5c6vcDw
echo fr-fr^|5370bb44f497e1b19114c7cf70f5cdef9f3a2582^|fr_windows_7_ultimate_with_sp1_x64_dvd_u_677299^|pK8rKq5r5c6vcDw
echo he-il^|e0f821d1d24504747f725950aa6ff5db706d3767^|he_windows_7_ultimate_with_sp1_x64_dvd_u_677312^|pK8rKq5r5c6vcDw
echo hr-hr^|f725ea9bc7f63c504ef88abf40958fe7111d8e10^|hr_windows_7_ultimate_with_sp1_x64_dvd_u_677324^|pK8rKq5r5c6vcDw
echo hu-hu^|28249fc2426245c4bb43649091614ccfb294d2ed^|hu_windows_7_ultimate_with_sp1_x64_dvd_u_677338^|pK8rKq5r5c6vcDw
echo it-it^|9af84e5a557c30f9d0c10bdc5fed339a7159f830^|it_windows_7_ultimate_with_sp1_x64_dvd_u_677356^|pK8rKq5r5c6vcDw
echo ja-jp^|643f7d12ff4b412e40c35bbb17b5bc11379e8c73^|ja_windows_7_ultimate_with_sp1_x64_dvd_u_677372^|pK8rKq5r5c6vcDw
echo ko-kr^|deabc2b531ec84fb0c962aca9a89bdac6b141dc0^|ko_windows_7_ultimate_k_with_sp1_x64_dvd_u_677502^|pK8rKq5r5c6vcDw
echo lt-lt^|7bbf0f48937f4fcbbca63dce2cf2945cec1d6bc5^|lt_windows_7_ultimate_with_sp1_x64_dvd_u_677379^|pK8rKq5r5c6vcDw
echo lv-lv^|436af00fcf6e026ba7ef9861b74d67643269c2e5^|lv_windows_7_ultimate_with_sp1_x64_dvd_u_677302^|pK8rKq5r5c6vcDw
echo nl-nl^|8ea95845447abcc0a7bccee6df5142779e19fa58^|nl_windows_7_ultimate_with_sp1_x64_dvd_u_677325^|pK8rKq5r5c6vcDw
echo pl-pl^|c6620ae85d42fca40c202b68c0e7124bc0eda7c2^|pl_windows_7_ultimate_with_sp1_x64_dvd_u_677341^|pK8rKq5r5c6vcDw
echo pt-br^|2a015945685da102c2601af463b474a343985ef7^|pt_windows_7_ultimate_with_sp1_x64_dvd_u_677358^|pK8rKq5r5c6vcDw
echo pt-pt^|03686f4e838102220aa9925c3f2c067a6c7dc46e^|pp_windows_7_ultimate_with_sp1_x64_dvd_u_677373^|pK8rKq5r5c6vcDw
echo ro-ro^|3d52a0b34af2f8151a40aedcb967d0e088f51c94^|ro_windows_7_ultimate_with_sp1_x64_dvd_u_677380^|pK8rKq5r5c6vcDw
echo ru-ru^|106caf0695318ad0d82e441a54be8460bf099b09^|ru_windows_7_ultimate_with_sp1_x64_dvd_u_677391^|pK8rKq5r5c6vcDw
echo sk-sk^|d096a8aa881d90e65be9a57d49c23dfb16ac01b1^|sk_windows_7_ultimate_with_sp1_x64_dvd_u_677393^|pK8rKq5r5c6vcDw
echo sl-si^|b9e29e1905335a7109234f339b860109e954e172^|sl_windows_7_ultimate_with_sp1_x64_dvd_u_677396^|pK8rKq5r5c6vcDw
echo sv-se^|839c4132d5169cfa2cfca76f1e71d92f5cfc6117^|sv_windows_7_ultimate_with_sp1_x64_dvd_u_677400^|pK8rKq5r5c6vcDw
echo th-th^|6e409e5174bbf83e62a5dfe91b952d11c8a078a3^|th_windows_7_ultimate_with_sp1_x64_dvd_u_677402^|pK8rKq5r5c6vcDw
echo tr-tr^|86a6b3b55e7fc2cec798806a80263ca59b77a992^|tr_windows_7_ultimate_with_sp1_x64_dvd_u_677404^|pK8rKq5r5c6vcDw
echo uk-ua^|9fe311e57d626901e4a6205e345ebaa5ff9c2c5f^|uk_windows_7_ultimate_with_sp1_x64_dvd_u_677406^|pK8rKq5r5c6vcDw
echo zh-cn^|2ce0b2db34d76ed3f697ce148cb7594432405e23^|cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408^|pK8rKq5r5c6vcDw
echo zh-tw^|7dc2db86f2c2304f4f71bc651da49add77076dc6^|hk_windows_7_ultimate_with_sp1_x64_dvd_u_677411^|pK8rKq5r5c6vcDw
echo ar-sa^|302dfd114e2bf89ee69efb3b6ce9c982f84c9f91^|ar_windows_7_ultimate_with_sp1_x86_dvd_u_677448^|pK8rKq5r5c6vcDw
echo bg-bg^|94885a1482db7fcc00eed5460ec32b75b4db0a86^|bg_windows_7_ultimate_with_sp1_x86_dvd_u_677450^|pK8rKq5r5c6vcDw
echo cs-cz^|7b9488356ad3ac0444c421326d6c69fa96abb2f1^|cs_windows_7_ultimate_with_sp1_x86_dvd_u_677452^|pK8rKq5r5c6vcDw
echo da-dk^|8b0a1d5a5de47f5d508807db5893b97b1a4e78b4^|da_windows_7_ultimate_with_sp1_x86_dvd_u_677454^|pK8rKq5r5c6vcDw
echo de-de^|4de8a4198529b60d57e17e377efabb42b7b4f3a9^|de_windows_7_ultimate_with_sp1_x86_dvd_u_677456^|pK8rKq5r5c6vcDw
echo el-gr^|3f08ce8a74e0cccaee7f946dcf250dc0712c2b1b^|el_windows_7_ultimate_with_sp1_x86_dvd_u_677458^|pK8rKq5r5c6vcDw
echo en-us^|65fce0f445d9bf7e78e43f17e441e08c63722657^|en_windows_7_ultimate_with_sp1_x86_dvd_u_677460^|pK8rKq5r5c6vcDw
echo es-es^|5c1d3e8cfdc70dc44dc5ac1cb89cacc3c515b1e8^|es_windows_7_ultimate_with_sp1_x86_dvd_u_677462^|pK8rKq5r5c6vcDw
echo et-ee^|a8b00577f1370b7411e821e4a1f65aaf7fb2b15c^|et_windows_7_ultimate_with_sp1_x86_dvd_u_677464^|pK8rKq5r5c6vcDw
echo fi-fi^|593ab48ed74d7fb3ac85168ed488af2743934ee9^|fi_windows_7_ultimate_with_sp1_x86_dvd_u_677466^|pK8rKq5r5c6vcDw
echo fr-fr^|6a4d873e82698f7bf157c67a69c2db9bce6c769e^|fr_windows_7_ultimate_with_sp1_x86_dvd_u_677434^|pK8rKq5r5c6vcDw
echo he-il^|548e0937927193cc6e336e41c429cf401c4ef9e3^|he_windows_7_ultimate_with_sp1_x86_dvd_u_677436^|pK8rKq5r5c6vcDw
echo hr-hr^|2809bcef53fcf04fe410c16f5dd6be33c29cf1c9^|hr_windows_7_ultimate_with_sp1_x86_dvd_u_677438^|pK8rKq5r5c6vcDw
echo hu-hu^|bb1e5b2055511861196cbb4526d04b15a7e3ebe6^|hu_windows_7_ultimate_with_sp1_x86_dvd_u_677441^|pK8rKq5r5c6vcDw
echo it-it^|3378d4bfdbab850407ab6047b68fa9cbb2275b75^|it_windows_7_ultimate_with_sp1_x86_dvd_u_677443^|pK8rKq5r5c6vcDw
echo ja-jp^|19e0b9f78165731fc862eacca7f1801d6eca7980^|ja_windows_7_ultimate_with_sp1_x86_dvd_u_677445^|pK8rKq5r5c6vcDw
echo ko-kr^|d7153a39d4377807b94ca4f7be22225785013bcf^|ko_windows_7_ultimate_k_with_sp1_x86_dvd_u_677508^|pK8rKq5r5c6vcDw
echo lt-lt^|a49b13daeaf462b05756e0d6d45aa29da0bd142c^|lt_windows_7_ultimate_with_sp1_x86_dvd_u_677447^|pK8rKq5r5c6vcDw
echo lv-lv^|32d05111a894cf4dcaab8ad4359cd4e1f6b54799^|lv_windows_7_ultimate_with_sp1_x86_dvd_u_677449^|pK8rKq5r5c6vcDw
echo nl-nl^|730e312b1a27deaed174841d9d4b562e3d81fcd7^|nl_windows_7_ultimate_with_sp1_x86_dvd_u_677453^|pK8rKq5r5c6vcDw
echo pl-pl^|38dc423de68dd73fae600096ab82a1c5b63fa0ca^|pl_windows_7_ultimate_with_sp1_x86_dvd_u_677455^|pK8rKq5r5c6vcDw
echo pt-br^|95c625d1c6a80cd8f4a188bc8547a436a108efce^|pt_windows_7_ultimate_with_sp1_x86_dvd_u_677457^|pK8rKq5r5c6vcDw
echo pt-pt^|8bd12c1a0925d77b3ef8c0dbf966f5b0b22a8a9e^|pp_windows_7_ultimate_with_sp1_x86_dvd_u_677459^|pK8rKq5r5c6vcDw
echo ro-ro^|142ce0e9af47753629a1060ed377472587f54fe7^|ro_windows_7_ultimate_with_sp1_x86_dvd_u_677461^|pK8rKq5r5c6vcDw
echo ru-ru^|d224888cfa62847faa3505630a206bdcd10a9930^|ru_windows_7_ultimate_with_sp1_x86_dvd_u_677463^|pK8rKq5r5c6vcDw
echo sk-sk^|5234ecee1bbe1b60b91a75795388ca73ea300337^|sk_windows_7_ultimate_with_sp1_x86_dvd_u_677465^|pK8rKq5r5c6vcDw
echo sl-si^|eb1a70a198e97c5d3fce1efb8fe684ad9b6af873^|sl_windows_7_ultimate_with_sp1_x86_dvd_u_677467^|pK8rKq5r5c6vcDw
echo sv-se^|cd875f8f0f72d8e6a2c9c617461990a67faeddbd^|sv_windows_7_ultimate_with_sp1_x86_dvd_u_677482^|pK8rKq5r5c6vcDw
echo th-th^|aa9b3c5ddf2196cdaf002bb5dc2a1459dadfb041^|th_windows_7_ultimate_with_sp1_x86_dvd_u_677483^|pK8rKq5r5c6vcDw
echo tr-tr^|c352f8b7071a7893edecacc02af1421f1cb6bf32^|tr_windows_7_ultimate_with_sp1_x86_dvd_u_677484^|pK8rKq5r5c6vcDw
echo uk-ua^|15c8de9014c9ec511878fb9bd4704a54d81a4d4f^|uk_windows_7_ultimate_with_sp1_x86_dvd_u_677485^|pK8rKq5r5c6vcDw
echo zh-cn^|b92119f5b732ece1c0850eda30134536e18ccce7^|cn_windows_7_ultimate_with_sp1_x86_dvd_u_677486^|pK8rKq5r5c6vcDw
echo zh-tw^|66cd3d00631df7ede1d94331a49b842e1c2d37ef^|hk_windows_7_ultimate_with_sp1_x86_dvd_u_677487^|pK8rKq5r5c6vcDw
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB17091 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB17091
>>database.1709.1.smrt (
echo ar-sa^|e2edcb078f2ad8aee092ac2f26d53bc453e791e5^|ar_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090874
echo ar-sa^|7827a4a1628a5964e202a88c2bac4517f4cda8dc^|ar_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090800
echo bg-bg^|c9ed8db26862930546312c239132f049e20e1701^|bg_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090802
echo bg-bg^|3bf8655e1d80d7ccccfff72ef5dd909e09d39f81^|bg_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090801
echo zh-cn^|9306895149f9328cdb77ff28368f83ee984bdc30^|cn_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090804
echo zh-cn^|00d8d32cbf5d1ca78055eccfc258691b126be3d5^|cn_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090805
echo cs-cz^|182f40ce8b620969686f571081fda19c3aecec86^|cs_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090810
echo cs-cz^|662328f748e77ed0de9dd31adc0fd40bcf654ea2^|cs_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090811
echo zh-tw^|3e1b8a332077a3e120dda89dabbdb71fb430f23f^|ct_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090806
echo zh-tw^|0f3641323451a3859390d2c3d2e4a600bc0a4144^|ct_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090807
echo da-dk^|3a5a948585cda102e4dc8e23ce15312835ad2c9e^|da_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090812
echo da-dk^|4a3ce8d41eea515568fad8c7bcf0d2f987540095^|da_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090813
echo de-de^|d88d6b6fac57e03a50cacc896e14c410de8695db^|de_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090829
echo de-de^|8da36007351ca70f03069160b432f2581b448df7^|de_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090830
echo el-gr^|15fea1aeb0baa6929aa2a1485b880da25ee84a83^|el_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090831
echo el-gr^|2d7d195e120e0675f704a455cf9a5397e7b9b99e^|el_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090832
echo en-gb^|ca8065dd7df4507f3031af2676fe8fcbf9255849^|en-gb_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090819
echo en-gb^|59f8f4750db3a473d1e2f73f997533d73a3a7ade^|en-gb_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090820
echo en-us^|1ad928cfef439f6aa4044ddc3a96b0b6830bdd0f^|en_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090817
echo en-us^|93b317c82b69252027e57aa2d18b50825cdf443e^|en_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090818
echo es-mx^|5326132605543773ddc4af07a3c1ac55e072238c^|es-mx_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090865
echo es-mx^|906c19444a93fb21f669dad5efece090e4fb1ea7^|es-mx_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090866
echo es-es^|6d72891ff8c4abdfa43b16979677f33b5e81aa61^|es_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090863
echo es-es^|9cf2c88b54096bbd1518eb161246809b62388e7c^|es_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090864
echo et-ee^|7103acb01e0d2cfbe45c837db3867318c1155dd9^|et_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090821
echo et-ee^|f6763617cc1ca135774704b03f3a8ec0eaafa348^|et_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090822
echo fi-fi^|2db695b837b644814eba600b5efc54046a669f51^|fi_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090823
echo fi-fi^|63edd6009a18b85151e5fc6fe5ec88ffafe13ffa^|fi_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090824
echo fr-ca^|52f46de308cc700fe7e981efd48bad805794254a^|fr-ca_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090826
echo fr-ca^|c766fb7b110321e03ce50384bb773888baea4e3f^|fr-ca_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090828
echo fr-fr^|45810f491bff44f4f9df21f8e062d4be316f88e1^|fr_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090825
echo fr-fr^|000b0972259ffda6ff384039cfcb390569fbd4c6^|fr_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090827
echo he-il^|a6ca46a19f97728f045bc79764830a3411b4247d^|he_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090833
echo he-il^|150019cbbfcc557aa061f060c97b46992eb3acf7^|he_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090706
echo hr-hr^|a6145afa1663ad54caa678c07fc2eeba166aa873^|hr_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090808
echo hr-hr^|245c1540099e4bd41af175ad10f9b273360a6301^|hr_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090809
echo hu-hu^|a5ca81598380fc14e2c055ab4b66015b8cb8ec5a^|hu_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090834
echo hu-hu^|91f17dfe52044a4adad958b61577f046c0d0c8c9^|hu_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090835
echo it-it^|4dc20941be67591a7d87aeffcc57e1edcaa8b625^|it_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090836
echo it-it^|474474b93522b0c791f116f8e8e336a1bfb8c2e2^|it_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090837
echo ja-jp^|a8cf1482b0d464f1d0918d1e1656f9e38f708899^|ja_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090838
echo ja-jp^|29afe0d9883e2c9d42de670587300f8d782dcde3^|ja_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090839
echo ko-kr^|f3bcac5f84118a47f805a5023314630b801e0b88^|ko_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090840
echo ko-kr^|c01a7ffa39404e355db8b368843c4adf5d21dbb0^|ko_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090841
echo lt-lt^|dbf45ea8a68af5b536b2bb5a494f8c2099667cfa^|lt_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090844
echo lt-lt^|b87536c5c4d04ccc42201fc2aefb572e461d51f7^|lt_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090845
echo lv-lv^|bd581f03f92a0a3c1abcd13d50b5678e9832e985^|lv_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090842
echo lv-lv^|b61aa37bfc6acab1b63342dbd17ee8c3bd2e3083^|lv_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090843
echo nb-no^|4241e69a471af9fbdaeca0eafa4cc320de0c4768^|nb_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090846
echo nb-no^|a1f6112290a5d832176778de68970941c73dd8ac^|nb_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090847
echo nl-nl^|c922ca1d479c494c09f1af9e8004b04a3ad83891^|nl_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090814
echo nl-nl^|5819df355526094ef14bbbc4734979b7e37b0c45^|nl_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090815
echo pl-pl^|567ec71d491a461dd85c75c0d1c1703de0ad0982^|pl_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090848
echo pl-pl^|8dc29e988fffb6839a8f342c61a142ce5afabc15^|pl_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090849
echo pt-pt^|50bdb9332a8016f83ede70ea15c64c4fdf2014ff^|pp_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090852
echo pt-pt^|d2bcc2a45b1316c7a9ab8f6d86b6498f028dcf54^|pp_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090853
echo pt-br^|8c763bf03d3293e03bfbab9a27ecfc508864df77^|pt_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090850
echo pt-br^|ea550203a9ff15506f9ab35263a7d6d1654464a8^|pt_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090851
echo ro-ro^|d63cccb86e01360520455a2d8afae833af9df907^|ro_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090854
echo ro-ro^|a6e8850af0fe920cea6129f084633cdcc66963a9^|ro_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090855
echo ru-ru^|9b0e1e66c27c57aed35fb761b3d33a1bdb5c41ac^|ru_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090856
echo ru-ru^|e2d136fa47183ef7411f6f684fc3ad5c9d76fedd^|ru_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090857
echo sk-sk^|fafa093b77bbd8445ca65920552decd422b56238^|sk_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090859
echo sk-sk^|e23ca288adfea8cb07122c617981c819f25bd584^|sk_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090860
echo sl-si^|ebd784746534aec009ba34690d6b54def25144ab^|sl_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090861
echo sl-si^|03b724ee28cf0b94ed5bc0b6c99f94d96de65ed2^|sl_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090862
echo sr-latn-rs^|921cc1a29bddbc8f7fd8f7aa3246370245207cd7^|sr-latn_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090858
echo sr-latn-rs^|a633d0b61c0ed280bd29fb4ec5b811a4b5f3b66a^|sr-latn_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090876
echo sv-se^|f88c5fd906afce9f0766c149a9de844de58cebab^|sv_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090867
echo sv-se^|2d7653a7f87e2cf646fe5931ceb8d4c10fe8df9c^|sv_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090868
echo th-th^|7e4b28f871527cca4ee0b20f4134af74843d475b^|th_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100092265
echo th-th^|6a4e99e435ff37712279fde3dcec274dd399c693^|th_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090870
echo tr-tr^|e05ff76665401393a40298d1baf5fbee07ee29c0^|tr_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090871
echo tr-tr^|386292d80514a54fe0d5823085dcacbbfa908680^|tr_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090872
echo uk-ua^|64cdb7a3d64176963b1b7bcd23d1ea0e658d39d6^|uk_windows_10_multi-edition_version_1709_updated_sept_2017_x64_dvd_100090873
echo uk-ua^|f7bc3c431c2944cfd8720223ec94d0b1c79d01fd^|uk_windows_10_multi-edition_version_1709_updated_sept_2017_x86_dvd_100090875
echo ar-sa^|242e624993092f33d44ec9c31ed4c03916db6b53^|ar_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090767
echo ar-sa^|b8ca0f5dcec7c89542e4c4a2a9ea65df4dd0616c^|ar_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090771
echo bg-bg^|e1eca71af376951cb9f13ba76c513efe2783b35e^|bg_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090770
echo bg-bg^|6defbdc912daac78e675a7017f78246f1cfc56f1^|bg_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090893
echo zh-cn^|6a4335595675099d9164c0cf3ba5f4a09eceed91^|cn_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090774
echo zh-cn^|47f54bc2f44b2783bb441cdb8d730eeb7c7ad0bf^|cn_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090775
echo cs-cz^|97c20cb672e19bd7ebb222b4eb708cfea8d8a574^|cs_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090742
echo cs-cz^|fb01e06db377b6d6d9570636bd5a4b2e1414d3ac^|cs_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090750
echo zh-tw^|bafcb3edeb1c24ffc801c06d3c4ad37b3bae9f1d^|ct_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090725
echo zh-tw^|df2befa35a625642dc21738b9214c01ccd0a7e79^|ct_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090731
echo da-dk^|5bf167d5c82b48f15b61d127f76b689e79c99fab^|da_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090721
echo da-dk^|46f9b1a8c075a19879866a3ddc6db1a33be9a4b8^|da_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090890
echo de-de^|4503c9bdf6b31fb62160edc5759b1552fc8fd82e^|de_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090752
echo de-de^|145c8fa082385dc95f101391637d57c2ef79a0f8^|de_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090765
echo el-gr^|92da0f9ba057174cdeb01dd931b681503b0696aa^|el_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090740
echo el-gr^|c272a808c954233b7fc28cb89f802335c4f79108^|el_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090760
echo en-gb^|1d599c4bf401e6614634c9785669018747b47e8e^|en-gb_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090748
echo en-gb^|b023d4f958b3cb7ff567e6d7ca65fcb22191d544^|en-gb_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090747
echo en-us^|1bbf886697a485c18d70ad294a09c08cb3c064ac^|en_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090741
echo en-us^|8c274ce27b49d43216dfef115b811936880e6e06^|en_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090759
echo es-mx^|8dada372961d7e9aa2b3633d52bc6ad0267d0e46^|es-mx_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090788
echo es-mx^|1ffb333ef94d55f880939e5fe80f88ac5723ac5c^|es-mx_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090789
echo es-es^|9ee0eb67e8c5741aaf5e7d67d1ff74f9add2537d^|es_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090786
echo es-es^|b5ff09141850f1eb0c910a0dab449a79fd8ce5db^|es_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090887
echo et-ee^|d749b33a161faf73497f864ea2dc72c9070fb58d^|et_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090744
echo et-ee^|31dff0311a93a386bc4fc6109c7d8a46c3240bf9^|et_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090719
echo fi-fi^|64bc6f43bf64d04b88328e44a608b9907eedce28^|fi_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090730
echo fi-fi^|a17ae2fdd11ed60a5f90023d67df3bdf3d5c2b77^|fi_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090733
echo fr-ca^|24d33b1393b38458e8987741ccac3fd15c22e906^|fr-ca_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090718
echo fr-ca^|9435976d88ea638ece9a10e59154b2e0d4412daa^|fr-ca_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090715
echo fr-fr^|5315759ed113221dc64cf14f99cb1f4d8861f69b^|fr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090758
echo fr-fr^|ab3953330e3346ae6e0590c0dc7f1469d92f9056^|fr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090720
echo he-il^|aff173a527229b7bc043a01ded7e27c816085977^|he_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090728
echo he-il^|71bd7ef6b8a115633f282ca3d881b1629e211857^|he_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090735
echo hr-hr^|ae8533f647b902c87a8cc4d2cc90dc0fe7265273^|hr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090891
echo hr-hr^|91662ebe37d95325b5d80c3d6fc646eaf69a2c5d^|hr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090777
echo hu-hu^|5a0d896c7e21254b4186d3c9175a800f7243e092^|hu_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090726
echo hu-hu^|0eb0faab76d7e1da3e39fc64887566523704cd22^|hu_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090888
echo it-it^|73cee3ace3d63f13ffea3755f029ee958a437e4e^|it_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090723
echo it-it^|122fc2ee8c23ef62a10dad0387e4fd1eea8d4e30^|it_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090739
echo ja-jp^|52ad77f0568f83678c0142d676736749f495bf62^|ja_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090738
echo ja-jp^|2680b6b6c985592041859ad6fe8d382d1b433ec4^|ja_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090745
echo ko-kr^|7b76c970eea5feb8121a06cc824c0d5c540d0762^|ko_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090722
echo ko-kr^|b80782d4376835da0791caa3e70cc14fd28618a8^|ko_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090729
echo lt-lt^|59248aafd716d1d06b9f084092e9f44ffe3bae6a^|lt_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090779
echo lt-lt^|fa88c4e843faa594cadeac28655ae1fde1cf7421^|lt_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090727
echo lv-lv^|b01d1dd6b7d37b860a782d6cb14f5c735abdbb45^|lv_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090734
echo lv-lv^|a201e46dbe7167d305a078baceaf6c426ed27084^|lv_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090778
echo nb-no^|b62ba57d2ca587cdb0eaeeff99289ad929010480^|nb_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090724
echo nb-no^|156baddeb011975778b6e641b1e7f97d7ab120ba^|nb_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090780
echo nl-nl^|80cf785716531652eeb5ce6c5650d519bbbd8d65^|nl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090751
echo nl-nl^|f0da6b4e1e582875c890167fce2cf94d6c083873^|nl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090753
echo pl-pl^|cb00e193a0ae3b351162b0b51f97e4df069a4534^|pl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090883
echo pl-pl^|b7a48e5e6b08b5d81c1acfd717b3831b7f95efaf^|pl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090737
echo pt-pt^|262fa9079907d1e01b936f9d89c97d64c6eb8faa^|pp_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090783
echo pt-pt^|938d979b0e3c2db95b5e9f05ea68f71705c7e8b0^|pp_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090784
echo pt-br^|670fa3fd483f1c04c556dfd207135d2e10fb26d5^|pt_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090746
echo pt-br^|a01be11ee52fa8f192b7f6fff7735c4f0661518c^|pt_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090782
echo ro-ro^|3722103d24c5d626737a286bc9223301af6b7a3c^|ro_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090762
echo ro-ro^|28fe697bfbde0e2612c92c79e8778a4ad4e1e9de^|ro_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090882
echo ru-ru^|7374e6a52c1a30317e3444bf416857ed26770ce0^|ru_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090714
echo ru-ru^|3d5512f20bd68f5e763066ef4df1e6d162f5aad8^|ru_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090785
echo sk-sk^|1c777a84f4cb881951a08cc31191091a7cd926d5^|sk_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090717
echo sk-sk^|1373c069c918ec4c3d9f5fd74a69a51e43380059^|sk_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090736
echo sl-si^|7c7e74be6313805ef712afcd8152cf840ade1e5f^|sl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090764
echo sl-si^|1808a87bc1ede2703dd7016d2c85aec76fd81767^|sl_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090763
echo sr-latn-rs^|5e89f778738bae5445932b0e67c81db2fa75c1ad^|sr-latn_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090761
echo sr-latn-rs^|971cea97e0c38fd5e91021fbada61aad6284fdc7^|sr-latn_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090766
echo sv-se^|f794540a1d022105edd8ee7092854d1a2590576b^|sv_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090790
echo sv-se^|a6f54ce505bfd6d4d1065855b3306c1ed8293046^|sv_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090791
echo th-th^|1fa69f37847c2001e0648b93e42baaade15521b7^|th_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090792
echo th-th^|937e38e203aa416efe343964ea97936fb14ddc61^|th_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090705
echo tr-tr^|930db8103bd4cccf58137ee64bff20944ed66e23^|tr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090906
echo tr-tr^|8fe222af78ef24834c60f1ed0a2b07202a48b1ea^|tr_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090795
echo uk-ua^|c60a06e64622db8f6347487d17d053bc496f5219^|uk_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x64_dvd_100090794
echo uk-ua^|796eb4d9abcb8aa27471a8b5f19366054cd9ebfe^|uk_windows_10_multi-edition_vl_version_1709_updated_sept_2017_x86_dvd_100090796
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB17092 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB17092
>>database.1709.2.smrt (
echo ar-sa^|25f8809a7672c3c3fbac9f726a0ffe6498f2ad1b^|ar_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406175
echo ar-sa^|7a5e70d4275ce6b88dc2fd4e55050ee60cb7ae2c^|ar_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406317
echo bg-bg^|cbbd25877926b143dcf42fb75986a68308da6013^|bg_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406195
echo bg-bg^|f43ac13dd407ed94c34a8e3cdfe653b5ee40c090^|bg_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406318
echo zh-cn^|69dc07e7b7940121027be4c9b51648fa31d2b6ad^|cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406208
echo zh-cn^|efcf3b81076990951dcfea08ab387e9099813ceb^|cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406319
echo cs-cz^|f8582aab0146f0313ffa95f2e29951a1a968ea03^|cs_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406210
echo cs-cz^|3d40c3219877f65633e8bb1da69c7adaddc557c5^|cs_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406550
echo zh-tw^|af1f013fe053d2bef42eb36d2f7c12890157cba3^|ct_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406212
echo zh-tw^|9e597fa89d9af0868eeaf9ae4909411f561fcfa8^|ct_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406322
echo da-dk^|efc8f27dc820450dadd49096f0bfdafd47ab51dd^|da_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406223
echo da-dk^|fbd9b5bf0480500ad63b0b6bd606ff165f4522f5^|da_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406325
echo de-de^|2f2878458f7c2bf6748d32d0723f15a46eb094c8^|de_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406245
echo de-de^|6df8a778b7489068a58df36a088d8dc2b0423c44^|de_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406336
echo el-gr^|cb6d8b97a66395c0d86a898d2158a3ba5f990b83^|el_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406239
echo el-gr^|44a9413f06848a28fc117180eae15310a04cbe2f^|el_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406338
echo en-gb^|5c62faadd5debc21f8b017a5c92a547cb7de44b9^|en-gb_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406231
echo en-gb^|3d7cae010909b4bf159664e1fe5266de1866ddc5^|en-gb_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406329
echo en-us^|1851a0007321fa084145ea24b8d30bf7a72bf1c6^|en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406172
echo en-us^|6eeff9574366042ed5ad50c48f406ce10ef20e10^|en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406182
echo es-mx^|feca25d30771af158c31ef41f5d0545d10eb95bc^|es-mx_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406365
echo es-mx^|1d9ded74f9164a3abd8b9cddf26d74a54dacc8c0^|es-mx_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406563
echo es-es^|482ff21c3d0ee2718ced1cb623f81b08a6636e57^|es_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406361
echo es-es^|56a7e501b3cea628e8b863996ae30c173e20cca5^|es_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406566
echo et-ee^|fba1e6640688cde46c460878e26e886e7355419d^|et_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406228
echo et-ee^|23d6a31ff5f08e683bc24699873a1957684c93ef^|et_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406332
echo fi-fi^|64c362613f5ba51f5236590a33510b764549c948^|fi_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406232
echo fi-fi^|2bef4486214406b47c5e21b8100f6328e892266e^|fi_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406333
echo fr-ca^|976c1c7ede5d41864d4b421386b6aa83538f3515^|fr-ca_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406251
echo fr-ca^|7e0b2b2aef54ca28b41e587fafd1da3e4e5362a0^|fr-ca_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406334
echo fr-fr^|168f5babdbd33651388369aa4a113764df932d5f^|fr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406240
echo fr-fr^|218b1eaa56ffeb345e2f5b0525d2a0cbcee4e8ec^|fr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406335
echo he-il^|300e830169bdc818d33f9101dcab048161c48f0a^|he_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406252
echo he-il^|eeac73ae73d45a0653f46e9feec3f745b641c0a3^|he_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406343
echo hr-hr^|97786128b196c6c3d4a543eb59340cb10fd98013^|hr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406203
echo hr-hr^|d45815df47fd89b362ec7cae420c7d1cb9d2a945^|hr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406323
echo hu-hu^|55875352004a11860ddc83464b2d679005e2b6a7^|hu_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406260
echo hu-hu^|176655d701e3aaff569ecb896cc27c7e429045e3^|hu_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406345
echo it-it^|aada1ee0b256a048376ee1b50e9ce1d607244afa^|it_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406547
echo it-it^|5227666f28b9b15e9940be242c1e95c83eaee182^|it_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406344
echo ja-jp^|320205083a9f4fffa6c356959497b59dc42ccb8a^|ja_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406300
echo ja-jp^|335696e7ef93bc657362c0e9a16ee0759131f182^|ja_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406346
echo ko-kr^|59ed5a1bed39ef92379a674955d2ae0921c52ade^|ko_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406304
echo ko-kr^|811bb3a7ebc78e2c8249988f920ab0cd7ae594a8^|ko_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406551
echo lt-lt^|23ec26f1d716af9817812653fddb870fdeb3e5c5^|lt_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100408587
echo lt-lt^|171270c50b018ec82bdd47b14711758efc2b4369^|lt_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406385
echo lv-lv^|47330c2b3741fd1fc993ca19d87ead45ee32ded1^|lv_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406309
echo lv-lv^|6ae6ed7ad09ac2e59ed934024f3a445a8b0aac3b^|lv_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406383
echo nb-no^|366823d96395628cf3610549e578e6227c2b82e5^|nb_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406315
echo nb-no^|406b7712e4dd2a8424d7d39a7f263edce7eba321^|nb_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406387
echo nl-nl^|a7fb98d5556e709eea230241043df24379368310^|nl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406226
echo nl-nl^|45c0642bbe0d95dae15425e8bde8d4d77457cca0^|nl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406328
echo pl-pl^|a889c1d6fde5ad7e120a17be7b06e7b8e8b12011^|pl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406316
echo pl-pl^|f285ac5bb03e6e88b36f61fe9e88a4e8a6aa59bc^|pl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100408802
echo pt-pt^|189bf84d0271c0c82b8fd148fc7ac983439a3fec^|pp_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406348
echo pt-pt^|28245ae857e017a782838d50bead9f0561d30b00^|pp_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406392
echo pt-br^|c0ea37b94d2b245950759a1a59dc44e8806ae954^|pt_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406347
echo pt-br^|ab9ef8f6d6afa17d02f9041bdcaffe5da2168e22^|pt_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406390
echo ro-ro^|b79706bd0e6450431359c07ae1cd938e3713b9b7^|ro_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406350
echo ro-ro^|74d7d20a9617023bca99243b3c4ff95d53e4db98^|ro_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406394
echo ru-ru^|2750d02be68043aa27d5b20e022aceaec86b5a39^|ru_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406352
echo ru-ru^|64db95c1619461b54f86772958b5465b0fd6e21b^|ru_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406558
echo sk-sk^|c01f37757f4fbd6ac3c20c2ddfe858fafff6f1d7^|sk_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406356
echo sk-sk^|c5f75099461da24d6f0e38465319fb5cd867caed^|sk_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406400
echo sl-si^|5e28ccecc6dbfc82ee50b49cd78d9cdab6ec08d9^|sl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406358
echo sl-si^|13fbc8235d7feb37347a9fc2e3f3f7664aeecafb^|sl_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406403
echo sr-latn-rs^|2b35e3ba23edd93a2c1d7af8a2ab3d859903a8bc^|sr-latn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406353
echo sr-latn-rs^|7bd47ecc02d1ca57abeb5ef70e85c03e83106ba5^|sr-latn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406399
echo sv-se^|387716968025feca8d7eec7a5facd2b477f78301^|sv_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406366
echo sv-se^|0aacc54b7982538a4db5224ef8190b2822edac6e^|sv_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406409
echo th-th^|f3641535966498780045d737115021ea5498b972^|th_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406368
echo th-th^|8d72689e5f0bd94d4d607e232a81872b2354e544^|th_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406567
echo tr-tr^|5e2eb9a68c0d950589c1f6be69029e851e7f3b1d^|tr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406375
echo tr-tr^|b8bbda2384c7e345f3c332fea6ea873bdc280de2^|tr_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406413
echo uk-ua^|46593b23e9e7d8bef5f5cd4b3f1fb29306e957a8^|uk_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406378
echo uk-ua^|e2ae25275daaf4ab2b439237d3b97cedaec57fad^|uk_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406569
echo ar-sa^|8637fffb19cb57767d19d95e33bacc49ddf8fb17^|ar_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100411150
echo ar-sa^|27f25fe367c1a4d763e2d7a95180f6ae71606b15^|ar_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406740
echo bg-bg^|612a4bb002763588fe84cd1a942c6ac652b42564^|bg_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406695
echo bg-bg^|ff066bcdb18fdb8ad6c4794e55f5c56dd5ebb872^|bg_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406741
echo zh-cn^|5cc6e158a9d90b9c474ace8a55b66f88bd16221d^|cn_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406696
echo zh-cn^|6f1aaf615a78cb0c01b5a5d9fd3ba148f6dea74b^|cn_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406742
echo cs-cz^|c5b6222b26a9458a476f9b6d221fb8ff35a5699e^|cs_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406699
echo cs-cz^|665e57db46779635e517ce07228367dd97921750^|cs_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406354
echo zh-tw^|01eb0f22c55a0322654268ffc2703804aea9af0a^|ct_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406800
echo zh-tw^|9f3dbc6597e056acfdd92fb7f5bd7c5d233b49c7^|ct_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406349
echo da-dk^|ed5577030d7d9f87cc2e64a411242cec93e3e502^|da_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406705
echo da-dk^|cbc4c16e7468aa7cf766f682eee26bfb3b84bd03^|da_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406355
echo de-de^|9dd7b2b61921a384c47da2f1ec9721b6c7360461^|de_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100410672
echo de-de^|5d4337ce7fdc562dee3d1a4a04df3eea019f454c^|de_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406369
echo el-gr^|6bf06be37185f89798d6eee9d45b516109fe0b43^|el_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406730
echo el-gr^|feedd0cae80100561427b463e2922ed82593c1d4^|el_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406372
echo en-gb^|3efb9174b7fe997509b89d0ff8ce6bddc6000c5a^|en-gb_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406720
echo en-gb^|deff101ea96a944fb6d737c28b75535eebb05775^|en-gb_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406360
echo en-us^|ea214ee684a5bb8230707104c54a3b74d92f1d69^|en_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406711
echo en-us^|36005d054f732119bbb00fd9a0e141d54712d751^|en_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406359
echo es-mx^|67076179c89fdc76867bf3e332902644a0e17189^|es-mx_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406424
echo es-mx^|e80804c794cec90b610cc07767688754cb4de519^|es-mx_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406427
echo es-es^|85232d13e90896a9824cf575d772378bb7e6aa8b^|es_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406587
echo es-es^|73402cc9b05925c8f9f3b9e4fc80f0cccb77f003^|es_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406422
echo et-ee^|0eef287434dacb40d5ba3094effadf5e012c6887^|et_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406721
echo et-ee^|89b2bdb217fc912d7f122df64201ad64897f972e^|et_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406362
echo fi-fi^|388f093c6b737892864a7fa82091832ec88fa8ed^|fi_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406722
echo fi-fi^|97afa34a4fda123236a33b7bf95dd0dcd4e9e789^|fi_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406363
echo fr-ca^|1a793ba2101fd11f7b2764ce49cd3fea32fef9e5^|fr-ca_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406725
echo fr-ca^|1af72e8bbe6deb97563c2f3bf5f375a93f7feafe^|fr-ca_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406548
echo fr-fr^|53e25b60980e6c97531c08e0a313e2d8b22266f2^|fr_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406723
echo fr-fr^|7623f74a60554ed563ccb04af5fee64c657bb457^|fr_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406364
echo he-il^|1644cd12a1f6564c03eec58c2f6b66cfd396580c^|he_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406732
echo he-il^|bed5edc0aacda939904172747a4e5680e4f240d0^|he_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406370
echo hr-hr^|a3540204ed47a2111f557245e14c30f12b8cea76^|hr_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406698
echo hr-hr^|0334e74a13f2f208dec3e1b7972f21f17fc998fb^|hr_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406351
echo hu-hu^|f5b843a88d3344d6dc4baceb60157cf43ea7a897^|hu_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406733
echo hu-hu^|acced1dff0dd873c7e69797c7812f8356616a62c^|hu_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406371
echo it-it^|1b72708a8bcd6e96cf264663d0445b5669a53c07^|it_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100410907
echo it-it^|97794485422a980cbf9db1ab8a4c3ea9ae78f0b0^|it_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406373
echo ja-jp^|2a985b4b6a2b5da433ccafc5f3eedc67dd1f68cc^|ja_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406736
echo ja-jp^|42f30e4228fc87c10ea1653d2061d4397072ab93^|ja_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406374
echo ko-kr^|5a339e3396350979a988008513f373708f12743c^|ko_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100410908
echo ko-kr^|b4bd89df990c66abfe1fa1b41c603dde6718d64f^|ko_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406377
echo lt-lt^|f4667e870ab8445b5fb02a8ebf25675c05e566b1^|lt_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406381
echo lt-lt^|93435dcffe4183ed540af2d70747bd6087cd5607^|lt_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406556
echo lv-lv^|b8513df4336482a4dd3fc086acc85e6364987b4e^|lv_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406738
echo lv-lv^|52a0e8873500bd224ab5d1303103b7602f8d6b5b^|lv_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406379
echo nb-no^|61e1cbd185223277a44586b4e32fd51e944ee43e^|nb_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406557
echo nb-no^|27bf8275f3233866830886b1df58fe2c8bdac88a^|nb_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406386
echo nl-nl^|57788220f896dfbcafe97784c33e8d70a708bec4^|nl_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406707
echo nl-nl^|73c28b70b84381b2e6cdb9a09f6783b5e6031368^|nl_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406357
echo pl-pl^|0e4b5eab08114149ae01aff96f6c2539aa0a3905^|pl_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406388
echo pl-pl^|0862a3abf5d26ce06b29553d568ae7f9ff840f3d^|pl_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406391
echo pt-pt^|1b57b7a01c6768d7ec98e780956e32ce41e2b3a0^|pp_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406397
echo pt-pt^|df339a036f6eeea1b58a51a4a62e9d1c03e503da^|pp_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406398
echo pt-br^|ac61bd9da94941c45ff633414d5141db215bf67f^|pt_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406393
echo pt-br^|152ed760679a9ef4537523005fdca8db26307c07^|pt_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406395
echo ro-ro^|cba6c87fd8bc4644225389760254376da59607ad^|ro_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406560
echo ro-ro^|9bf4cefe543ba3ead527e4d4f4588a6f401260be^|ro_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406402
echo ru-ru^|df3aa3dae12d3fafc6f28462d5ab6cd494887626^|ru_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406404
echo ru-ru^|94e012407bc1cd092e1af998dfc74a46fd954306^|ru_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406406
echo sk-sk^|1edc96bde505f88e687c2640945dbbbb219a81da^|sk_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406568
echo sk-sk^|f980dd57e762753b21160239bce4b7d3b1fd15ed^|sk_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406412
echo sl-si^|dada50c8f9964f6c6ad1252526b7a68e36a1d735^|sl_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406562
echo sl-si^|826d4db405c8fc7e61cc84cb8f8b9be9b37e0e1f^|sl_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406417
echo sr-latn-rs^|64fa27abc35dc251f4f3d1da44ed753eee24f255^|sr-latn_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406564
echo sr-latn-rs^|8aa61a778cde92ea1b683f7ef988196ad4f6c49f^|sr-latn_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406452
echo sv-se^|3547c3cfc99f5ea73f3aa4e2bd74b9dcc784bf37^|sv_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406439
echo sv-se^|15df97249ca7cb9a68972924e76c42b0eacbf84a^|sv_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406440
echo th-th^|0d29e7e13a58c8e3b425015eb29a509965544b27^|th_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406448
echo th-th^|6e30823f7b82f62898e9e4aa89bfcbcd280593df^|th_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406632
echo tr-tr^|1f8ce3218c3163155bc9d58cc22a42f99841fd9d^|tr_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406430
echo tr-tr^|b4a794ac88b6e0f84b8886c38a9c80c25cccd210^|tr_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406434
echo uk-ua^|f1d5c54a394b4c04c8354f589d683a8fc6eb733f^|uk_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406438
echo uk-ua^|9bfcd732c4678d4d3107abbdc9d2ff5027e5a924^|uk_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406446
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB18031 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB18031
>>database.1803.1.smrt (
echo ar-sa^|4225f6be22d8e6db86d35cb175ef64f29efc8828^|ar_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063707^|ZC4fjDyapVIecPv
echo ar-sa^|abc9562097ece338615d4b7f2b804526562bafaf^|ar_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063330^|U8ITzCzFWPIapT1
echo bg-bg^|900749785ff6bb5d805efd4702f3c6680bbe774a^|bg_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063709^|ZC4fjDyapVIecPv
echo bg-bg^|06ab692e8018d90216169a9c61a51fa21b6a69fc^|bg_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063332^|U8ITzCzFWPIapT1
echo zh-cn^|e39b9347fc5be4a0548fb15e666fb92e0a965c6e^|cn_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063730^|ZC4fjDyapVIecPv
echo zh-cn^|6250fdf0b91f64e114f4cfec7a75546974cf6feb^|cn_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063369^|U8ITzCzFWPIapT1
echo cs-cz^|548f5244b5a3d6577a5316db680374da135d2bac^|cs_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063704^|ZC4fjDyapVIecPv
echo cs-cz^|60bce0af51b79072cd784e87e3afd34566cdf687^|cs_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063331^|U8ITzCzFWPIapT1
echo zh-tw^|417e1bdd2beeac35e2375035e37b8cc13c5a0aed^|ct_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063731^|ZC4fjDyapVIecPv
echo zh-tw^|79da8c8afba2524c5770cf86aad48c9d7f12548f^|ct_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063367^|U8ITzCzFWPIapT1
echo da-dk^|8833d9dab1aae73e4e7f9b444567e6b636c8c50c^|da_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063712^|ZC4fjDyapVIecPv
echo da-dk^|6a1ee741b7debe96f7f74dc5348f8c9dfa06a5f3^|da_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063334^|U8ITzCzFWPIapT1
echo de-de^|a4f94b8a4a8dc8f1136d2bb35717a4b432bd9e83^|de_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063706^|ZC4fjDyapVIecPv
echo de-de^|583bff66f871e5be015cc8ebff3348a0f3086bf7^|de_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063328^|U8ITzCzFWPIapT1
echo el-gr^|bd10a1ce4efb229981863eab7cd20405ccd50103^|el_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063711^|ZC4fjDyapVIecPv
echo el-gr^|8e1c2c88690586ed9c2856bb9ef407649d105f37^|el_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063329^|U8ITzCzFWPIapT1
echo en-gb^|6abf0c67712ced499a61298fe239de4f2d47e556^|en-gb_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063708^|ZC4fjDyapVIecPv
echo en-gb^|9b13fd4da3ac103edbf039416f4b944280385732^|en-gb_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063335^|U8ITzCzFWPIapT1
echo en-us^|28681742fe850aa4bfc7075811c5244b61d462cf^|en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333^|ZC4fjDyapVIecPv
echo en-us^|a3becd56ba0df0b023a13fe0b3e85f45461fa7ea^|en_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063341^|U8ITzCzFWPIapT1
echo es-mx^|5bd36523dbada198fa51742450f7fdbbe3d9386b^|es-mx_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063714^|ZC4fjDyapVIecPv
echo es-mx^|a768161a54ece07f621412a6464977ab6ce1e8e7^|es-mx_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063336^|U8ITzCzFWPIapT1
echo es-es^|70c3f69a55cc3ea07d79d0cc31dee57440f77443^|es_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063713^|ZC4fjDyapVIecPv
echo es-es^|89a63c19c213bd208ac7c8cea134c6230ad28e46^|es_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063337^|U8ITzCzFWPIapT1
echo et-ee^|3d23f3940733918eec9f575c3824c4a0429fe2af^|et_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063705^|ZC4fjDyapVIecPv
echo et-ee^|b26d81cea91b1de8a9b07c1c33f288886984a418^|et_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063338^|U8ITzCzFWPIapT1
echo fi-fi^|e7ac3ca4daa3e442939c0cc95ff77a48979852cc^|fi_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063710^|ZC4fjDyapVIecPv
echo fi-fi^|e121c11a03e413de49a6dc9c498991d805a13efd^|fi_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063339^|U8ITzCzFWPIapT1
echo fr-ca^|f2db818ffc9eaf54e82bfa03f2d5fe3be054bd3b^|fr-ca_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063715^|ZC4fjDyapVIecPv
echo fr-ca^|2226e539e2c31f3ddc9a59f13f5b7cb730e4b24c^|fr-ca_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063340^|U8ITzCzFWPIapT1
echo fr-fr^|f7236bbe11a029d57426bf5e8b6e2b4b6907ef78^|fr_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064240^|ZC4fjDyapVIecPv
echo fr-fr^|e1a15061d6681b630074fc86dcb4c65b159e5e4f^|fr_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063343^|U8ITzCzFWPIapT1
echo he-il^|dadb1b5ac064c71fa14288a0c88cd4cf09c13715^|he_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063716^|ZC4fjDyapVIecPv
echo he-il^|140a780484f8858ee25bb201c0569bd250c8e735^|he_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063345^|U8ITzCzFWPIapT1
echo hr-hr^|3cd057ab6e76fd1277b58e8f743f72e878740d3b^|hr_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063717^|ZC4fjDyapVIecPv
echo hr-hr^|21c3c65dc78990fae331be51d10a2df7bac51e7e^|hr_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063344^|U8ITzCzFWPIapT1
echo hu-hu^|8e187708e33fa05be7f28bfed17fe70398fd6944^|hu_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064241^|ZC4fjDyapVIecPv
echo hu-hu^|3c1e3039c52365b83bb9252abb9506120a6e9eac^|hu_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063349^|U8ITzCzFWPIapT1
echo it-it^|ad6173b9ad4a71bcbd686f40e8888aadb4462e1d^|it_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063718^|ZC4fjDyapVIecPv
echo it-it^|00ffff2947b48978368eb06c1b528c4a068b3e25^|it_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063347^|U8ITzCzFWPIapT1
echo ja-jp^|902cde26e04776d953d347d25fa9f185078c0e38^|ja_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064243^|ZC4fjDyapVIecPv
echo ja-jp^|9c4187fa529b3b70ace49076ea63756d2c11e482^|ja_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063348^|U8ITzCzFWPIapT1
echo ko-kr^|58115420cd61296a00703a0628c6226ef07ed27c^|ko_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063719^|ZC4fjDyapVIecPv
echo ko-kr^|2bcbef4ebd5b7e045087d827d34713e982191a0b^|ko_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063350^|U8ITzCzFWPIapT1
echo lt-lt^|8f8ee7e896a3f4b5f221eae7f8c17a4cb99ac1cf^|lt_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064242^|ZC4fjDyapVIecPv
echo lt-lt^|31e308f9e0ff57c09fc7f2e38962b84f2a21b887^|lt_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063351^|U8ITzCzFWPIapT1
echo lv-lv^|eeb3d4c555f8fd8eee3b8bcdd6b3239a88d9dcd1^|lv_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063721^|ZC4fjDyapVIecPv
echo lv-lv^|52c63fad5d6186c6f26b31c4a32c63cf78a993f2^|lv_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063354^|U8ITzCzFWPIapT1
echo nb-no^|b915f988375f5846de1c8773c2e87f0f92a4e1d3^|nb_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063720^|ZC4fjDyapVIecPv
echo nb-no^|86009721ef9633bd50de65a8b27542e02c60749d^|nb_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063353^|U8ITzCzFWPIapT1
echo nl-nl^|cdf21dd0235ea64fb89f29c2b8ffae732e497a84^|nl_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063722^|ZC4fjDyapVIecPv
echo nl-nl^|3ddf21dc2c8bf24b631e0f600a3621c99bc36f97^|nl_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063352^|U8ITzCzFWPIapT1
echo pl-pl^|76a196e64c7cebb67bf533ae1ab4206375157b2f^|pl_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063723^|ZC4fjDyapVIecPv
echo pl-pl^|a65097fd9fac1292f4d0d4fb00f3e11ca8198b56^|pl_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063356^|U8ITzCzFWPIapT1
echo pt-pt^|78c082793cec23d5026500c32ea39de3553cfbd8^|pp_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064244^|ZC4fjDyapVIecPv
echo pt-pt^|79da38a87af0a1939c353bc4b5a09acaf61367d8^|pp_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063357^|U8ITzCzFWPIapT1
echo pt-br^|de4829b9769940ef319bb2fbee3a48f54ddf1513^|pt_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063724^|ZC4fjDyapVIecPv
echo pt-br^|83854443e6303853018c5d2f1682f6690b188b87^|pt_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063355^|U8ITzCzFWPIapT1
echo ro-ro^|d7b29d2af896df35867b27be9dd8016753cc7468^|ro_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064245^|ZC4fjDyapVIecPv
echo ro-ro^|3b2ae5bf621190670cbd9eaeeba07948115da70f^|ro_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063358^|U8ITzCzFWPIapT1
echo ru-ru^|1bdbd2116f521dce35d79da20910d9a9b9537e98^|ru_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064250^|ZC4fjDyapVIecPv
echo ru-ru^|3db3b95f38afbdaa213c6b677a4e7fe97658537f^|ru_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063359^|U8ITzCzFWPIapT1
echo sk-sk^|a17ca8c145f5613e4789e87d6c8e1e95de63c310^|sk_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064251^|ZC4fjDyapVIecPv
echo sk-sk^|8e79504902e83f305cf5fe444a5570071114e6ae^|sk_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063360^|U8ITzCzFWPIapT1
echo sl-si^|dc5a210ca2910211f9a50c7ab80fa165c28962e7^|sl_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12064252^|ZC4fjDyapVIecPv
echo sl-si^|b23f898659fffd3963ef0e13576482123e086c3a^|sl_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063361^|U8ITzCzFWPIapT1
echo sr-latn-rs^|f87e25afac7f54de312c422d4a7d759ed5267ebd^|sr-latn_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063726^|ZC4fjDyapVIecPv
echo sr-latn-rs^|c3ca33548b1ff2215565fb7ef58bd2a9629af0f1^|sr-latn_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063362^|U8ITzCzFWPIapT1
echo sv-se^|350f633bc3844c101228d92fc5fe774dcbd125b3^|sv_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063725^|ZC4fjDyapVIecPv
echo sv-se^|3afd63c7b4fb1b2dc42d2a00c3af047396d32654^|sv_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063364^|U8ITzCzFWPIapT1
echo th-th^|838eb6645609d4c9ab21739ddeed3cf3319baf73^|th_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063727^|ZC4fjDyapVIecPv
echo th-th^|6f0ac65b177bfad838997fee62a2e7132b63ecb7^|th_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063363^|U8ITzCzFWPIapT1
echo tr-tr^|6ce0ab090d444aa4692557c0e246bd33d0f4c59d^|tr_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063728^|ZC4fjDyapVIecPv
echo tr-tr^|0b4681620baaca9b57b81ba8383f60c7382aef94^|tr_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063365^|U8ITzCzFWPIapT1
echo uk-ua^|cbc8e75f92acffe09b0147c3dff9e402bd378d87^|uk_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063729^|ZC4fjDyapVIecPv
echo uk-ua^|f13d03b5f8cb24062da90f5cfd4e242df0bec126^|uk_windows_10_business_editions_version_1803_updated_march_2018_x86_dvd_12063366^|U8ITzCzFWPIapT1
echo ar-sa^|5db2b4bee4f68ec5377d277281bbaa23cfab46fa^|ar_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064254^|tBdN3MvyqgO7Eg8
echo ar-sa^|78ed4931032348a3748c0b2d40a588d6ec2b6cf6^|ar_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063370^|dFjG5R259hAlkf3
echo bg-bg^|fdf9c914611e4f7065fc8b55a7bd839a111d4790^|bg_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064334^|tBdN3MvyqgO7Eg8
echo bg-bg^|6a495230b4d83823c471ee8b02a78c16d6bb369b^|bg_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063372^|dFjG5R259hAlkf3
echo zh-cn^|82091d67fff5b49726ffc22d35d9c1cbe81dc443^|cn_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063766^|tBdN3MvyqgO7Eg8
echo zh-cn^|d5e89fb54169f5a2e610c75813ce833a4cb9a4e4^|cn_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063452^|dFjG5R259hAlkf3
echo cs-cz^|06c5e10c969b03b99734f4b5c5ee9ec571e2f96f^|cs_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063734^|tBdN3MvyqgO7Eg8
echo cs-cz^|f80db91e842f276a6d0ade5c723ccadcd994be84^|cs_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063373^|dFjG5R259hAlkf3
echo zh-tw^|db56ca8415c6f597df7cb916c958180fca549e21^|ct_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063769^|tBdN3MvyqgO7Eg8
echo zh-tw^|dad11416c8bd69f0e855990eff2bca2bd01a090a^|ct_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063453^|dFjG5R259hAlkf3
echo da-dk^|e1e957d3bd8eb4014da244f6c85f8975da602632^|da_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063737^|tBdN3MvyqgO7Eg8
echo da-dk^|1f95a80a3f40b9c8576dca91946e54776ff2b730^|da_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063374^|dFjG5R259hAlkf3
echo de-de^|537f817703323d28f673b4e36e377919e1ee034e^|de_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063739^|tBdN3MvyqgO7Eg8
echo de-de^|2440c7c38a8342f6c075fd17685e86da3fd5d40c^|de_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063375^|dFjG5R259hAlkf3
echo el-gr^|79422a3e1cef23e09c5eaf41d70a6f86e70f4392^|el_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064255^|tBdN3MvyqgO7Eg8
echo el-gr^|981ad20ee8e630e8a392fd73c497626d8e6a5152^|el_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063381^|dFjG5R259hAlkf3
echo en-gb^|2f8910ce2cfaf61f094dfd49fe87ac004a6200af^|en-gb_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063738^|tBdN3MvyqgO7Eg8
echo en-gb^|e12e5d860b73e14424503372eee39895a55cad9a^|en-gb_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063377^|dFjG5R259hAlkf3
echo en-us^|08fbb24627fa768f869c09f44c5d6c1e53a57a6f^|en_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063379^|tBdN3MvyqgO7Eg8
echo en-us^|3f2063b7419675e98c8df82bc0607bbb1ce298bb^|en_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063380^|dFjG5R259hAlkf3
echo es-mx^|412421bb1cea4e373849f66b4073303103861e0b^|es-mx_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063741^|tBdN3MvyqgO7Eg8
echo es-mx^|be534b157c38b2ccc627009c4e80689c21fefd3d^|es-mx_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063413^|dFjG5R259hAlkf3
echo es-es^|8909d21adcdb2ee15a48cdd941711b351133f87d^|es_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064257^|tBdN3MvyqgO7Eg8
echo es-es^|9f5df1360cb0b4fc4a8ecb8517f80fbd0ae5f28d^|es_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063390^|dFjG5R259hAlkf3
echo et-ee^|c35128538bc2def7bbdd170f0e429f9419392b6b^|et_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063740^|tBdN3MvyqgO7Eg8
echo et-ee^|a2ba3f0e28bc04713a58df0b8853bbe3ed689cf7^|et_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063415^|dFjG5R259hAlkf3
echo fi-fi^|f62635feb63904cfb588c1faac0b9fdbbd9f517d^|fi_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063746^|tBdN3MvyqgO7Eg8
echo fi-fi^|39f0058d814d76135bfc3c9c128482fdf4b57468^|fi_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064463^|dFjG5R259hAlkf3
echo fr-ca^|7b38cf3de9e1cbda7a4880314dfc92dc5a969aaf^|fr-ca_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064258^|tBdN3MvyqgO7Eg8
echo fr-ca^|ec4d16e74ab99b8736fae10020f709da76439cfb^|fr-ca_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064465^|dFjG5R259hAlkf3
echo fr-fr^|62564786f5568b40385abb40a1a9bb889f3576c7^|fr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064260^|tBdN3MvyqgO7Eg8
echo fr-fr^|730d7834aa90b3e3ffa0a8fb0d0144a3a7b1c43c^|fr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064466^|dFjG5R259hAlkf3
echo he-il^|38fa10c7054416e5189017dc712a2c5104167d87^|he_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063750^|tBdN3MvyqgO7Eg8
echo he-il^|ce63c53e0edd21eae59e271b93c096e7327d686a^|he_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063422^|dFjG5R259hAlkf3
echo hr-hr^|ee8d311750ba2be4d9b078f1e2ef0c682e9aafd4^|hr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063751^|tBdN3MvyqgO7Eg8
echo hr-hr^|f95a65fc6b9d3944748e5f71b903dd690aae5489^|hr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063423^|dFjG5R259hAlkf3
echo hu-hu^|2c9d96591073fab7a1464e1af8ca7c74a865848c^|hu_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064263^|tBdN3MvyqgO7Eg8
echo hu-hu^|5396aeb43c37f5c9eed8d9954e9230056884cfa7^|hu_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063425^|dFjG5R259hAlkf3
echo it-it^|2226a27470aadd3897963a6b14b1a82ab2766918^|it_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064265^|tBdN3MvyqgO7Eg8
echo it-it^|84af39d466955ee9ed09988ed6b45e8a59049dbe^|it_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063426^|dFjG5R259hAlkf3
echo ja-jp^|a3dad3fe7886aaf33dd950191eed776e4ee79717^|ja_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064266^|tBdN3MvyqgO7Eg8
echo ja-jp^|1dc3154c7213239e3629893a08954f5141e9a733^|ja_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063427^|dFjG5R259hAlkf3
echo ko-kr^|83b391c8d0238a37c880197ab3720c1d064a9f61^|ko_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064336^|tBdN3MvyqgO7Eg8
echo ko-kr^|74a9b0cd58fac42d80e8728dd70dbe9aa6d73545^|ko_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064467^|dFjG5R259hAlkf3
echo lt-lt^|1f160da0a2b51b732b57c03a7a97e05db795e459^|lt_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064269^|tBdN3MvyqgO7Eg8
echo lt-lt^|5e7ef1d3b6a27bfd492b55d9427ca5b57c4e4b21^|lt_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063432^|dFjG5R259hAlkf3
echo lv-lv^|6faa8c8640fd4f76d1a1a0a5e687e3238610e4b3^|lv_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063754^|tBdN3MvyqgO7Eg8
echo lv-lv^|683c6fe93c389ffb79652a4e0c185be8b910929c^|lv_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063433^|dFjG5R259hAlkf3
echo nb-no^|5e093a98a3787a85a2d7330edc1c6bf91b13207d^|nb_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063756^|tBdN3MvyqgO7Eg8
echo nb-no^|ecf9dc1030f064f27a4b4594c771a3e19fb410af^|nb_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063434^|dFjG5R259hAlkf3
echo nl-nl^|1eaafb03d19a87bc955843d81693897bf4156f26^|nl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063757^|tBdN3MvyqgO7Eg8
echo nl-nl^|fb4b1e6f643814bf51e5678f62597385031b2f90^|nl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063435^|dFjG5R259hAlkf3
echo pl-pl^|3e097b4ee1c011845f72963ecbbe96afd6d9494f^|pl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063758^|tBdN3MvyqgO7Eg8
echo pl-pl^|1e88c8d6ca678e43395e64a3e24115429526a120^|pl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063437^|dFjG5R259hAlkf3
echo pt-pt^|76aa50207e1927fca80b0d8a2311d075551745b1^|pp_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064735^|tBdN3MvyqgO7Eg8
echo pt-pt^|f4b3a3157a3224a29ec9db7608ab3aa7b7bf436d^|pp_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063438^|dFjG5R259hAlkf3
echo pt-br^|7c855dcc37d1c40631f84c830b382bc4934fdb2f^|pt_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064271^|tBdN3MvyqgO7Eg8
echo pt-br^|527a581da2bcdfd3ad8788ee288890a4a21c5e30^|pt_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063436^|dFjG5R259hAlkf3
echo ro-ro^|01bf23d8a277ef4d6c207b38b9493695e2828dbc^|ro_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064276^|tBdN3MvyqgO7Eg8
echo ro-ro^|8180b61a6a83231fe2aaeb2efacc241d2a9dcc22^|ro_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063439^|dFjG5R259hAlkf3
echo ru-ru^|21758e6046c5adc3b485219aeebc46ed93ae68a4^|ru_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064277^|tBdN3MvyqgO7Eg8
echo ru-ru^|6b6f75060d4a18761951a533143af5145772d839^|ru_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064736^|dFjG5R259hAlkf3
echo sk-sk^|7ffd9ae5ab2893e0ce59664ab6099513d8607418^|sk_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064278^|tBdN3MvyqgO7Eg8
echo sk-sk^|734086f531c8b0670af73d1dd8276940c71db89d^|sk_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063442^|dFjG5R259hAlkf3
echo sl-si^|61e1b5beee0d002f6ad2dbc77991ab2867dfe956^|sl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064280^|tBdN3MvyqgO7Eg8
echo sl-si^|d4f321695e4644e16b70a855a3f64a8b252886db^|sl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063445^|dFjG5R259hAlkf3
echo sr-latn-rs^|ad6d807aad81ef4e06bcc98d96bbbf92d5391e92^|sr-latn_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064281^|tBdN3MvyqgO7Eg8
echo sr-latn-rs^|5b6acb34a43fe02cb95b6f1a6636a03f8e679d8b^|sr-latn_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063448^|dFjG5R259hAlkf3
echo sv-se^|9ce38a862b067c1ab445591f4d0f01d137982cee^|sv_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064284^|tBdN3MvyqgO7Eg8
echo sv-se^|ee45fe5c914415c71671838acfda9f18b17dee9b^|sv_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064475^|dFjG5R259hAlkf3
echo th-th^|4e42a197dc55b06cb5ac10a173d5403786bb8cab^|th_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063760^|tBdN3MvyqgO7Eg8
echo th-th^|662095cf81d861f8b19f0311886359b394019abe^|th_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064474^|dFjG5R259hAlkf3
echo tr-tr^|37ff7a7a649db4fd3b528762ec3eec7a51488bd6^|tr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063761^|tBdN3MvyqgO7Eg8
echo tr-tr^|2274a98571e93b1bcd1d4368f766b579a3cbd116^|tr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064476^|dFjG5R259hAlkf3
echo uk-ua^|aa53674d84e5beeaf4cab80329aa9f996b3b4738^|uk_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063765^|tBdN3MvyqgO7Eg8
echo uk-ua^|49aef067ffc76fe6d2c059e1519851e6369a3b85^|uk_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063451^|dFjG5R259hAlkf3
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB18032 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB18032
>>database.1803.2.smrt (
echo ar-sa^|7e3e24a093fcf52fd83bb3dfa98418e29961322d^|ar_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_bd50168e
echo bg-bg^|7cd7fceac24f0ddf2a726e029bbfde23a598b76a^|bg_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_c8802f67
echo zh-cn^|533a5c7a732aefc7025f2128ffe0a4f0e5b0ed46^|cn_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_57e5b984
echo zh-tw^|9375162abd972935d1dffb45edebf13d0e15340a^|ct_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_33ca2ecc
echo hr-hr^|a38de33acf3243fd0deadc950337956f6da31c8c^|hr_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_a1c04a19
echo cs-cz^|2735220a61519c907460ad3e85be07b447332e47^|cs_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_2ff69a6d
echo da-dk^|aaeb1d6902650ca0daea0df241fa1307a2cd7ec1^|da_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_3add02e1
echo nl-nl^|621e35a8878e0a6837c8b3120196a5552347e49d^|nl_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_e7905ffa
echo en-us^|2b15efd7926ab9db9181cd7b599452cccc3774de^|en_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_5d7e729e
echo en-gb^|367d2706350f90351ffea5a52d5cf5ed3fff6168^|en-gb_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_de527f8b
echo et-ee^|2cf6ba0589394bf01b06d153566795df60d9f969^|et_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_f687979e
echo fi-fi^|30580de19bfce06e340336021edd9d577d315a31^|fi_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_e731e785
echo fr-fr^|9f53192ca12db193e180335d326caba729839cfe^|fr_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_d973cb8a
echo fr-ca^|c02d264c8c0312efd5054bc8665f804af908e321^|fr-ca_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_f883ac21
echo de-de^|a0ff3df3b834b57b39ba0940a13f4e25f1e72a38^|de_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_dd83486c
echo el-gr^|1bd22453efe02720dfbc9bc4743a8bd70967cfaa^|el_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_6eddca3b
echo he-il^|d29e6ab62a6d6d35b8f78039154097f0a6b01bcc^|he_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_c07f9f94
echo hu-hu^|5ccb33ed26e914afb6ebce9c38cd78c6c32dae26^|hu_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_6764bbbc
echo it-it^|be9b133ee8f75e8757d284c551f604ef58d9c890^|it_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_13b4c784
echo ja-jp^|d2b5353f21419894ea0c8234204ba9ab6d51c6cb^|ja_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_93a35ecd
echo ko-kr^|10aa2764c7b8ccfb624f0515616e2a60a608a0ba^|ko_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_b258555c
echo lv-lv^|5145abe765e0d7edff6b373e132dbce252d9fbd2^|lv_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_270e7ab4
echo lt-lt^|2fb2ac6b7cd4ee80d6d7f4930bfa6ee02002a145^|lt_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_0b383aed
echo nb-no^|c9d60c6ba78e461a41088ab0f8c107f5e1bd7a70^|nb_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_ce26febc
echo pl-pl^|a08edeb8f745e43e30305e414b8178eef43f1864^|pl_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_d8f131c1
echo pt-br^|816605d2c7e4a86cde5e5fc6d38cfa7732aacb4a^|pt_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_1b954d64
echo pt-pt^|d3f154ffd50c8e5713516666e60e2af1358e8970^|pp_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_7faf4949
echo ro-ro^|ac29c0b918595ce470870684df0740b1de74190e^|ro_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_c5e3db01
echo ru-ru^|e3073dad14052332557cfa35cb1c01a97aaca89e^|ru_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_a27d1185
echo sr-latn-rs^|8219e5ec060b0bbf2bdbaa9362bf33eb4a8adca3^|sr-latn_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_252c631c
echo sk-sk^|6648748b7934292081ea6bfcf9d5166b5aac0dba^|sk_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_83555beb
echo sl-si^|0ab077f58be98cfde40b1fa6fdee3e1a7bac49e4^|sl_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_658e5111
echo es-es^|5810029722a76f42c37dcf8d6274d19345929d0d^|es_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_3401c0f5
echo es-mx^|14f7bfc28249bfcc0ed73b8ac2fc17ee568b4209^|es-mx_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_2ed191b2
echo sv-se^|8651e969fa565cd4af9548051fb6d30c30388b05^|sv_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_564fd4a2
echo th-th^|585f0162666cea453486815962c3b2b536288084^|th_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_84530cb6
echo tr-tr^|b9805695190dc3a43423a29e1698060f05c6cd28^|tr_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_39d31e69
echo uk-ua^|a903123de6293f7f5a163c9ed73a05446bd862c0^|uk_windows_10_business_edition_version_1803_updated_aug_2018_x64_dvd_2f6039c4
echo ar-sa^|0797a73c46c70e92506d9e9bf24dc284c8452d45^|ar_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_50f8270c
echo bg-bg^|2327d00f7bc12f9dd30989a5acfe4903971ff681^|bg_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_ca07331a
echo zh-cn^|809bbd9645c64757ae50da9d866315f03a4e8126^|cn_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_c24c79a8
echo cs-cz^|960e64bf5db8a1764ae133bc8959db01e4e6b1b1^|cs_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_3727a7f1
echo zh-tw^|aba9e3fbe6f70d9eb8655a5c63867bf2e242600d^|ct_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_52a1d6ba
echo da-dk^|ec12c6a51a0484dedeff560a54515990189cf588^|da_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_2f932a32
echo de-de^|66b180f0d1503056111c89ef6eac0fb154006523^|de_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_68e4dd73
echo el-gr^|263d58a82dc066d508d353e9bde6a103721872b1^|el_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_450d406e
echo en-us^|533545aa095aa18824a9d1f81a95d8db3e23e154^|en_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_69a0bb10
echo en-gb^|71f5a53e2c3a8e4ecb75e0d07f1fff4300d1e060^|en-gb_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_43957df4
echo es-es^|96ddf025499480c7b0be14160f304e7f7397485a^|es_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_d4e5696a
echo es-mx^|2c780225c725639ada044e53387c3c70c35c2430^|es-mx_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_c3968b2a
echo et-ee^|5025fa0c024810c1db46ec32016971f9cb3cc4b0^|et_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_f4510123
echo fi-fi^|1fb50136828c7de948a62185829abc6d799d4343^|fi_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_912ac52b
echo fr-fr^|35c258f43fe618fcd30886b73ffd1961e4505cae^|fr_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_ad45a42e
echo fr-ca^|fe24e3ab2d9aef7fe801a29370ebee7e0d82127b^|fr-ca_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_d725147a
echo he-il^|cb8779f0e1096dcf5138b071f888ff9e2dcd3013^|he_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_b2bed1af
echo hr-hr^|2e464a91176b7388161f3eabd8878a159328c67f^|hr_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_dc9d0e5f
echo hu-hu^|5af87d3f055f28c107cbe4565c427c007a7ee616^|hu_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_d4e4a780
echo it-it^|66120bf85f4b9573f6757f0d49b011c482f79557^|it_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_1e98010d
echo ja-jp^|cd7d256a3962d74cf5eb1a76ce751b454268bf30^|ja_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_8eceef06
echo ko-kr^|2de67c0ab9dfdedbfeea29d57709d8d7b89805a4^|ko_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_a1cd02a5
echo lt-lt^|7fcbb9f4e30e1fcbdf63b3f31438bbb032f6eb09^|lt_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_721eb3bc
echo lv-lv^|237c5108492363b43bd48800a6a1a8e53fd66db3^|lv_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_b49a6090
echo nb-no^|89cc9aab1e787294f8d25cbea94cd7a2d55b2723^|nb_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_e1cc80e6
echo nl-nl^|f4138308c7676ae19ced362bf28c24f7f0eed5f0^|nl_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_7cc0f5ff
echo pl-pl^|59c347f6bd442935c8614ac32e88de76eb73b9c1^|pl_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_39f55a6a
echo pt-pt^|d32c331c1bd352113dcc35d4d1637fb79497a210^|pp_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_66a78665
echo pt-br^|cb094253cc31554b5d809675d2ad55703dece603^|pt_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_037aa288
echo ro-ro^|8229afd165a91902c8dfee6884b10a4cbdfbb505^|ro_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_5bb8c0b0
echo ru-ru^|6ff6bdc91e742a177b954dd3b5b86dd60e237519^|ru_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_fb457d0f
echo sk-sk^|72d2058b2bd871740e15dcd3a909b3036a3ec2e9^|sk_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_ed81e7b4
echo sl-si^|2f4b24f5380ac2b394b11274d6c844f9d4d0b254^|sl_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_15e252f9
echo sr-latn-rs^|194e60ab9960991d79f22822982383236eccc093^|sr-latn_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_bf686d16
echo sv-se^|8b26ea0457ceff30e0a05b219cb9631d5e0bfcd6^|sv_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_36caabb8
echo th-th^|ccad93be35626da13d232eacae88aa30a7450e2d^|th_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_f4854ae31
echo tr-tr^|f25e02859990bcce1cbb712b91dae874a681b62a^|tr_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_d513b5a1
echo uk-ua^|98df181f7e70bc6148564adfa485a764e01a3e1e^|uk_windows_10_business_edition_version_1803_updated_aug_2018_x86_dvd_bc701a92
echo ar-sa^|0cefb137ce56b6097c06e75762a6396d95163b52^|ar_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_340a3641
echo bg-bg^|4e0fcea183aa64d666a29ed5834c6fc59e5bae98^|bg_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_16ccb90d
echo zh-cn^|fbcafe361e49d5a9006aac7115e0e911e2379e9c^|cn_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_2cf38490
echo zh-tw^|04990f4c8fdf54c57dbce4cc1ee53022ec2cc24f^|ct_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_c66ed00c
echo hr-hr^|00f22678683d387ba1cab10ab23c50d4334ac381^|hr_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_48cc64c2
echo cs-cz^|a47aa1bc91d29c0f5899cc05795d57382aee869e^|cs_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_bb4a2916
echo da-dk^|349b37e35c8f4353dfc6a0d8f9fc03812d6c7dd6^|da_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_df8c7986
echo nl-nl^|88cf24143d752de314f7b0ad99d51199bcb989a7^|nl_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_572b752a
echo en-us^|349c43fc744ef45d2cf85e7bef4131373216525d^|en_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_f2764cf8
echo en-gb^|81a4307462d5049b3e6375f50a04479e90b05d69^|en-gb_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_6953dbab
echo et-ee^|1d11b813d8873369380b0cde4ee172a593843288^|et_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_b1638ad2
echo fi-fi^|1a88d374a2cadfc7a0ba169dd29d5c0a8293ef89^|fi_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_a7ab0a1e
echo fr-fr^|18e4cf6518a5e7af3ab272b5997583cc2fd0d4a1^|fr_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_0a356219
echo fr-ca^|0740d9349ff8742682cb56b2c28250716d258701^|fr-ca_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_c9ece345
echo de-de^|1ce1672300858813cc0499abb906cb83397533c3^|de_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_abc1400a
echo el-gr^|32531106b127db5c1973ce1f50657149462f4f1e^|el_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_fc49d4ce
echo he-il^|819cdc8e82d772a9d5d62ef73bb3f69266faffeb^|he_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_da703e3a
echo hu-hu^|18c6d4ce24f939859fbb23e9eeb2454565c390fa^|hu_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_31358fe9
echo it-it^|a1ee4cba39c547f01c655792313e0e5b86177cef^|it_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_c808d05d
echo ja-jp^|d8367a5714958202e61dbd9b0370d681e58ae134^|ja_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_9d119d31
echo ko-kr^|61acb9acfc1a957761250eb2157e416e37b94c4a^|ko_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_780c55b7
echo lv-lv^|90b5654a22a16e8636d57c0ba2531c42dcb66205^|lv_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_ca013947
echo lt-lt^|8cea2cc73eb295bf61a28c074987e849c8e9bf49^|lt_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_5a50122e
echo nb-no^|50d61062c5cf51400c4ee9b6a17af08e8f6e60e9^|nb_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_87c9571a
echo pl-pl^|182cb30f2a5b1f410ad3c262d5d6c13e770d96e5^|pl_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_dffdae15
echo pt-br^|2526146e0c1551992daf6618f059fb8d19bb90a9^|pt_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_629ad280
echo pt-pt^|b8ff6e16f1a4e38bbacd1b3f64cf00d603b0a7f8^|pp_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_d576eae4
echo ro-ro^|7ef3d7dccd206e9c5a29fbd3658b1e3cb93253ac^|ro_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_f3873532
echo ru-ru^|9749956f0a2812d6e57f94aeffe5cc05cd3f5093^|ru_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_910ae7a5
echo sr-latn-rs^|84fa35b94f05388624499fe09a63ad96b8f1ffae^|sr-latn_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_fa3088ed
echo sk-sk^|bd760e01d70c10c6b76dbdf13ee62086b5e20ea9^|sk_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_cb8223c4
echo sl-si^|728909f778ee9dc403a35e6e06cedf762971a57e^|sl_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_d112b179
echo es-es^|2a5eeca9f40c4c31e40ff0438b86f3802466a829^|es_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_dfb54802
echo es-mx^|ced9f8c723e66c66357c7f9cf05ad3f2b040f049^|es-mx_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_b14b57b7
echo sv-se^|0c81d78d3b6869b0b1298dc93b32ed4adccdbc66^|sv_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_f1b8f304
echo th-th^|573e4dfedb88ff418ea943f216607b56504a083a^|th_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_a42b3502
echo tr-tr^|dbfb847cc6f69d628bae6b5e33a759ab0d453740^|tr_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_1706f376
echo uk-ua^|77d9ef5a5db0cc89631daba1d074e73d60840a81^|uk_windows_10_consumer_edition_version_1803_updated_aug_2018_x64_dvd_1418496f
echo ar-sa^|f1e33c78d66baba8db78a3af98b54308a95fe7bb^|ar_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_97c1d6b9
echo bg-bg^|fa9393e7239a286f4025772959bf5f403215cf60^|bg_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_38ed628e
echo zh-cn^|00c7be7dfc21c704d10698064d8eae9752fabc24^|cn_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_7dab5fdd
echo zh-tw^|f2890fb0ce0e577afa642411f30dfb96fd02b5e7^|ct_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_4443e281
echo hr-hr^|8f79cf72fd5a3d5eb77faac89c9ed6f63118c873^|hr_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_c0b67a25
echo cs-cz^|4ff46b88ce79d09b4c6d8ab79cf5429e75cced23^|cs_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_2d7f54a5
echo da-dk^|ee57a1f97433c83a2ca6de7a1b6e4ee7cac65abd^|da_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_aa308c3c
echo nl-nl^|b0ddc62014cdbb1f992576ebadca528448f6afc4^|nl_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_0b6e6efd
echo en-us^|ca7861c6a41c0f377f1d7c64eb6c59fded843d8a^|en_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_454b0be7
echo en-gb^|00b6f070386590da176e100d14a4b6b7cad90da7^|en-gb_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_d7c2de7b
echo et-ee^|3b2ee5c59c15ccf76c7f6c2ffc4b8627f2a432fb^|et_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_626df4f9
echo fi-fi^|0e1c48bf583f51b3e459627f698936586be21ba9^|fi_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_d964073f
echo fr-fr^|5f808fa42ae99236d8043f314f52478566cc2b15^|fr_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_82f0150f
echo fr-ca^|4b16c781abcdf614b290551ba9668c7f3518779e^|fr-ca_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_8b634d6b
echo de-de^|561e84181cf99d4689885c25cc5a07a41df95c5c^|de_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_2ab93c16
echo el-gr^|adceb48c74a1a7dcc135f4fab4962a652d0436f2^|el_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_da2804a0
echo he-il^|99bffdbbcf80f9674b71e6a18f77d4736affa992^|he_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_51f3402d
echo hu-hu^|0934165f7aca2482460b28ab81a7b0c4ab1c9529^|hu_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_1e168bbe
echo it-it^|84f53bcf0902296dcd7188577a4b8fffb3c47a8a^|it_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_e63029b0
echo ja-jp^|e3bbdd711233e84bb516980c905ac687305d7edc^|ja_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_9298d791
echo ko-kr^|95afad9e74c8638d1dc2323bde67e6eedeeca2a8^|ko_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_b3cc2f39
echo lv-lv^|c52abcb7616d79972c3d6eb1b02458dd08d1a353^|lv_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_81c6462d
echo lt-lt^|089ccf648cbcc654a51bd8a06200fbbf1a509757^|lt_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_49d63a71
echo nb-no^|f700362a2b0e362810534b6153b1679e1f0c02cb^|nb_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_4526a7cd
echo pl-pl^|2170570239c282ee2104f7b3059da3832ee4c38b^|pl_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_9b2012d0
echo pt-br^|049570846fc4ee23be46547bd130c0ab02cc9688^|pt_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_28e2b697
echo pt-pt^|19bc5db6a1b547eec529f68532808b3cf5b175e5^|pp_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_87c6cc6b
echo ro-ro^|965aba9c6fe660c1ffa5c67f60c41054ab518fa1^|ro_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_6fdbe0d1
echo ru-ru^|3a3ea6bf88ed3857201053cfe9bf73bd31ce3134^|ru_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_d1b36c95
echo sr-latn-rs^|19ed74e0f7234ebc908e18a6e1a6901e075a6b5a^|sr-latn_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_befefe66
echo sk-sk^|cb13196154fc09cb2a2e0c6c3cc7dfc47117c3b4^|sk_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_a2c6e82d
echo sl-si^|6adae54ef5f8aae7ac8811afd8dcf0f1b977d0e7^|sl_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_38cb9863
echo es-es^|ebff832234e67382ab1fe2fa9ae556bc1d8d9d99^|es_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_f6a47a67
echo es-mx^|6003bc23e469a634bf1e9a4dc83b6ae289569ebc^|es-mx_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_820a1a95
echo sv-se^|60b4ed9abeab0d94570dbea08ee458f904be9be9^|sv_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_e094467b
echo th-th^|23bd8421084e9e2af3315d12dc1da9199e1ae6b8^|th_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_743f019f
echo tr-tr^|7d299934298f9eab6e5581dc1b531e627c4cd4ac^|tr_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_3e014fe3
echo uk-ua^|7e0e750044503cef1522438394109e0071e71a46^|uk_windows_10_consumer_edition_version_1803_updated_aug_2018_x86_dvd_dcf6be56
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB18033 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB18033
>>database.1803.3.smrt (
echo ar-sa^|29e3b0bb29c0aafdbaca44cbd71aba6b9c445641^|ar_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_1bbe8ce7^|tupQTRxD5gYpE5p
echo bg-bg^|493f4051a985674cd1037b499c95e312d57d92f5^|bg_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_7f5352a8^|tupQTRxD5gYpE5p
echo zh-cn^|6a1ea61d8bea5837a0b6be0fdcbba7ebd88712aa^|cn_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_a3fcbed0^|tupQTRxD5gYpE5p
echo cs-cz^|128c8f3174773504dd0dc4bd48b9e93f06983c9e^|cs_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_5d51b6bc^|tupQTRxD5gYpE5p
echo zh-tw^|6dc6f40831628171f8f44b901ed19a97d16aaa24^|ct_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_d57c26e2^|tupQTRxD5gYpE5p
echo da-dk^|cd3681991d447545b525f5fc79b5074b68fda1b3^|da_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_78930e71^|tupQTRxD5gYpE5p
echo de-de^|f41a3fe3b75ad387a3e67076d8724704fe8eb548^|de_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_735f4b0e^|tupQTRxD5gYpE5p
echo el-gr^|173c09fb3793e0418b969211a2c811d0048909a0^|el_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_d2e53fcf^|tupQTRxD5gYpE5p
echo en-us^|0208398915c08fe03f6c63faea9dcc9bbbd00532^|en_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_69339216^|tupQTRxD5gYpE5p
echo en-gb^|e2c1800c61c56b85dedc0e7b5db925e5baf06317^|en-gb_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_70f044fb^|tupQTRxD5gYpE5p
echo es-es^|7cd715569ee3a197f0a7a56129efbb666b98f964^|es_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_90b63099^|tupQTRxD5gYpE5p
echo es-mx^|2e729f0fd2f217cb0becda580e161c91d087e1e8^|es-mx_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_bed871f7^|tupQTRxD5gYpE5p
echo et-ee^|5a7dcfac235e6efdaf2c896e7aab9912db7f8734^|et_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_f449bdb6^|tupQTRxD5gYpE5p
echo fi-fi^|d59a3d3c0c1e78fa14c3eef583cf75ca04419487^|fi_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_75e708d3^|tupQTRxD5gYpE5p
echo fr-fr^|02515ae1122663bcd63292cee7c46e7ef97889a1^|fr_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_6d614296^|tupQTRxD5gYpE5p
echo fr-ca^|102c95e1c93dacb5e00976756e5a8a7905ceac81^|fr-ca_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_cac5d55b^|tupQTRxD5gYpE5p
echo he-il^|4b82435be74bbe4ddb6d2fcd796f65604ca469d6^|he_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_6f2efa01^|tupQTRxD5gYpE5p
echo hr-hr^|4b6ef5fb9b095c58e56c3db636d2b48beb949df0^|hr_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_bb613310^|tupQTRxD5gYpE5p
echo hu-hu^|ac02499d883a10002fc218cf699562818c2a345e^|hu_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_197e751b^|tupQTRxD5gYpE5p
echo it-it^|0fa6f2afec372a1e8b3fad1523e172e239f279d1^|it_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_2878c5ab^|tupQTRxD5gYpE5p
echo ja-jp^|e2488c45d3a6bfcf10e2d44349048041cb735c5e^|ja_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_8d71f0f5^|tupQTRxD5gYpE5p
echo ko-kr^|87b983ca11506194805c3f18e3b097984e714566^|ko_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_23a3b790^|tupQTRxD5gYpE5p
echo lt-lt^|14a8e6c48be68a0107191831014ad0baeb5af51a^|lt_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_42d83eb3^|tupQTRxD5gYpE5p
echo lv-lv^|c75252cc2ceba880c66c5fc5c3fe07df62235be6^|lv_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_1fdc2a57^|tupQTRxD5gYpE5p
echo nb-no^|e964f57181521f2e32e966131edfbe890a392997^|nb_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_e2c27e33^|tupQTRxD5gYpE5p
echo nl-nl^|372867241fd27cc976b5b4f29aeef61e6948103d^|nl_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_9a3833f6^|tupQTRxD5gYpE5p
echo pl-pl^|7be7424d9d5981477c6b0a5f2a18bfa9af6d0362^|pl_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_ff11e4b9^|tupQTRxD5gYpE5p
echo pt-pt^|2ee50ff8d8a983c03fc79c444c6fd2fe0f419525^|pp_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_954f7850^|tupQTRxD5gYpE5p
echo pt-br^|ccc39ff787909ece16faeb3f527364957aed329d^|pt_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_d5c2ead4^|tupQTRxD5gYpE5p
echo ro-ro^|a6a45a94ba0bde7915e62f74262a30189ccd6eb9^|ro_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_6cc78754^|tupQTRxD5gYpE5p
echo ru-ru^|a021fe4e26c9f74c509870a2da66e92096e24429^|ru_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_6e7ea19e^|tupQTRxD5gYpE5p
echo sk-sk^|7a615903b1d69e74941d72df57bd16a7ee4db9e1^|sk_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_c1ad2851^|tupQTRxD5gYpE5p
echo sl-si^|c49933cbc933b5734e5389240816edbe8ca9ada0^|sl_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_8d7d645b^|tupQTRxD5gYpE5p
echo sr-latn-rs^|c488a1cf1d97793d458d29523a635f4d1152bc8a^|sr-latn_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_8eb94bd7^|tupQTRxD5gYpE5p
echo sv-se^|753a193c182ae34a2b402c4b994e15531d145b31^|sv_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_95afa34c^|tupQTRxD5gYpE5p
echo th-th^|408d4db729d24dc0fe9bb88d21c0f8ee8e7a4a87^|th_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_82226f54^|tupQTRxD5gYpE5p
echo tr-tr^|c662485cdc69f6932da28a64ad6c0f48950a267c^|tr_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_f357c97d^|tupQTRxD5gYpE5p
echo uk-ua^|724afd60fcb6bd0b850b502955aee869f3b0e6c9^|uk_windows_10_consumer_edition_version_1803_updated_sep_2018_x64_dvd_041b2b40^|tupQTRxD5gYpE5p
echo ar-sa^|d8edc1784905786b19e3454baaf56b387e40b4f1^|ar_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_6efcdbb2^|MWLG8TDQN8esYNZ
echo bg-bg^|6c4536b0520f3c3934d4f148417e913f68e8a3a2^|bg_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_0ce11397^|MWLG8TDQN8esYNZ
echo zh-cn^|a12414426e894f8cb8eba3bd1ada77b907685ddc^|cn_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_3acf8a56^|MWLG8TDQN8esYNZ
echo cs-cz^|fbcd4c92abebdfa8425b9edf73f6e483be02643a^|cs_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_9cae6caf^|MWLG8TDQN8esYNZ
echo zh-tw^|8e7525cbdc78c5138a56622f2401e982b9b8572d^|ct_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_9bf5b9da^|MWLG8TDQN8esYNZ
echo da-dk^|b2d106bc8b9ab75448807327118e0d92f428dca0^|da_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_50544e49^|MWLG8TDQN8esYNZ
echo de-de^|299dcea2a64440439662e55d702f48065b629d0e^|de_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_1a8e33bd^|MWLG8TDQN8esYNZ
echo el-gr^|b92408b6305e072bf17f9223c9b2ab6d2a1c67ba^|el_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_303da3b3^|MWLG8TDQN8esYNZ
echo en-us^|4c019f93732aaf9ab4e4d74bec3287b949c1aadf^|en_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_f5ff2c32^|MWLG8TDQN8esYNZ
echo en-gb^|8c9f36c701ea285195b0b94463e8be492f3f6d69^|en-gb_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_d1798f8c^|MWLG8TDQN8esYNZ
echo es-es^|e6faee45f9fe334ee0e0e95204559507428a0988^|es_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_1436bdd6^|MWLG8TDQN8esYNZ
echo es-mx^|2049a0f39e40a8a969af0c184aaecec3026208e4^|es-mx_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_ce7c0af4^|MWLG8TDQN8esYNZ
echo et-ee^|29fb652ecc3511623599501a3c977e57d5bc1cc3^|et_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_282e321e^|MWLG8TDQN8esYNZ
echo fi-fi^|6fdcf583d155d482100d6f1c978d249598c376a4^|fi_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_4b33f905^|MWLG8TDQN8esYNZ
echo fr-fr^|d8120b980264390f308f0951a7d41b7e1e509ab9^|fr_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_b2fdc143^|MWLG8TDQN8esYNZ
echo fr-ca^|0159132b2a559e9e69cda8e106da68bc9cfbd095^|fr-ca_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_277f245d^|MWLG8TDQN8esYNZ
echo he-il^|a3908507669aa3c4cc3167159f03717483703bc8^|he_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_51233c4e^|MWLG8TDQN8esYNZ
echo hr-hr^|1a234a42fee681dbc4efee168ee181a183421344^|hr_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_af02a230^|MWLG8TDQN8esYNZ
echo hu-hu^|d8af7cc9062ffe47236de362ad615cbc5b9f8546^|hu_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_8c05fe42^|MWLG8TDQN8esYNZ
echo it-it^|632065c9547050e27b5310bc02842023c9b69c51^|it_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_30e81b38^|MWLG8TDQN8esYNZ
echo ja-jp^|afb56770ac69753b4e4f6ae8ae7fa81a607309ac^|ja_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_aca41955^|MWLG8TDQN8esYNZ
echo ko-kr^|09ad7d429635fdc7fbb06f1aaefbcde6dea27b15^|ko_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_36828982^|MWLG8TDQN8esYNZ
echo lt-lt^|745077dd156ff0ce0ae3f36c485c6033866619a7^|lt_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_3e16c67a^|MWLG8TDQN8esYNZ
echo lv-lv^|94e58201916eb34394eebe9c382b0627a8df05c8^|lv_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_0bb977b9^|MWLG8TDQN8esYNZ
echo nb-no^|43920a16262a7bb8d6e268f017de63b096d44398^|nb_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_787009de^|MWLG8TDQN8esYNZ
echo nl-nl^|401545d46ca7e342f02a6a4d14fd668a5ba91a1c^|nl_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_ed19beb8^|MWLG8TDQN8esYNZ
echo pl-pl^|c55ce381236cc1f233ab46cb9d174cf08d27c813^|pl_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_c89686dc^|MWLG8TDQN8esYNZ
echo pt-pt^|7424bbb1e329211c565fb23e1b602314e266ae1e^|pp_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_62da5aa9^|MWLG8TDQN8esYNZ
echo pt-br^|f3fa39db9dc3bb3ad5d9301f5da94023090805cd^|pt_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_47765267^|MWLG8TDQN8esYNZ
echo ro-ro^|af674099bbab63ddb05edbf905666f39e09e4cb9^|ro_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_a9d4a434^|MWLG8TDQN8esYNZ
echo ru-ru^|931ce1f33536546bd98021c9436e01dc63fd345b^|ru_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_cf1f0c5d^|MWLG8TDQN8esYNZ
echo sk-sk^|f51b0d5252cde58166dd1297eb891901fa04be91^|sk_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_062e45d7^|MWLG8TDQN8esYNZ
echo sl-si^|240ed0429c571fb9d52eb1913f579aa5fd1c596a^|sl_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_c143b9a1^|MWLG8TDQN8esYNZ
echo sr-latn-rs^|73fb397c138d542b17de7f66b3a061ae8ebd215b^|sr-latn_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_444172a3^|MWLG8TDQN8esYNZ
echo sv-se^|fb11a4509b49fea708eb99f31d3ce34f70273c35^|sv_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_f57d3200^|MWLG8TDQN8esYNZ
echo th-th^|c291d1f961eae702092d8d3c368f488bf4604a08^|th_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_22de6a31^|MWLG8TDQN8esYNZ
echo tr-tr^|74c1b67df16e2b63199aaf26cf126294ddaf39ae^|tr_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_1f2b0113^|MWLG8TDQN8esYNZ
echo uk-ua^|6a008dea338c2f7ac9e1bfa4bb2a9c2dc7b75272^|uk_windows_10_consumer_edition_version_1803_updated_sep_2018_x86_dvd_380ca765^|MWLG8TDQN8esYNZ
echo ar-sa^|fe91427fa29e4d7632b04adc0eb9a1f6f9e76676^|ar_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_c3652ce8^|yprWFWnFY5IsHE5
echo bg-bg^|16fa97f6d9f8755624f8d95bf9fd844afb7be13b^|bg_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_cde79936^|yprWFWnFY5IsHE5
echo zh-cn^|48b63bb1580aae2985c9e596c5a5782753fbfe75^|cn_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_07b164ed^|yprWFWnFY5IsHE5
echo cs-cz^|cc5db4dfbbf41fb2751dd2b676dca628473ea772^|cs_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_86c5214f^|yprWFWnFY5IsHE5
echo zh-tw^|5d717eba95c37e06848ed82f5ddf06184d51b979^|ct_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_c15afe0d^|yprWFWnFY5IsHE5
echo da-dk^|81a55cc0a62fade6acf4f2e325b1c5caf2110098^|da_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_d7230e05^|yprWFWnFY5IsHE5
echo de-de^|74bfbc71d360b981f27ded5280e8cf17e15d8391^|de_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_a5d8efff^|yprWFWnFY5IsHE5
echo el-gr^|b060c84424a23efdea46bf2030f889071297054f^|el_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_c318a624^|yprWFWnFY5IsHE5
echo en-us^|d302d2e752c01e53996ae292a8dd4cdf49916bad^|en_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_37051f54^|yprWFWnFY5IsHE5
echo en-gb^|107806f418fad692645fb0043f9f2638d7e0635b^|en-gb_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_472941f3^|yprWFWnFY5IsHE5
echo es-es^|2b3492681fa57db3289693ccc5f0aab01278f851^|es_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_9c488e3e^|yprWFWnFY5IsHE5
echo es-mx^|38f108bf8659be11bbc2d9c3d4341a9ac45ea2fd^|es-mx_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_4bfb792d^|yprWFWnFY5IsHE5
echo et-ee^|15d0e8bbc774d0ca97160e5bc0099d58592d9a71^|et_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_1e8d8c2c^|yprWFWnFY5IsHE5
echo fi-fi^|c9c03163b5964d520de7652831e817358267f2ee^|fi_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_86166bba^|yprWFWnFY5IsHE5
echo fr-fr^|5294c6730c5ff1678fd6e80180ef3b27ea417b47^|fr_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_4c4789bc^|yprWFWnFY5IsHE5
echo fr-ca^|ac64499a657e04ebc96802b7bfa1f7029397eb43^|fr-ca_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_ecbedf67^|yprWFWnFY5IsHE5
echo he-il^|89500e7bc843099ed5373717b3532fd233a647f6^|he_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_89348df6^|yprWFWnFY5IsHE5
echo hr-hr^|ac77b309c8a95689ccb4917b0d22f184bcf80e8b^|hr_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_35c5a943^|yprWFWnFY5IsHE5
echo hu-hu^|53e8d77d0865e717d6be5f6fa96ee76d11e3f457^|hu_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_1049af14^|yprWFWnFY5IsHE5
echo it-it^|0adf3fa750994fa0e039bd451bc77a7d15beef42^|it_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_bbbdb153^|yprWFWnFY5IsHE5
echo ja-jp^|53e6f3916a2adef712345bd03f6b6631d123d964^|ja_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_fdaf442d^|yprWFWnFY5IsHE5
echo ko-kr^|ed962fad8aabbf9472082aa73d65d309d0d4ccfb^|ko_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_fcf1f938^|yprWFWnFY5IsHE5
echo lt-lt^|52a8d4739bba5d2611ccf3990d4e9a187917fcbe^|lt_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_9236dc5f^|yprWFWnFY5IsHE5
echo lv-lv^|6e25b672ba1a8c3232918f84e9c4d674a50f8c91^|lv_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_3b5d66b5^|yprWFWnFY5IsHE5
echo nb-no^|a7440c22cd8c8e26ebc8f5d8e8446793b32c3365^|nb_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_4470a887^|yprWFWnFY5IsHE5
echo nl-nl^|f01f0616bbe548089d1614c84fdce50e572eef0c^|nl_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_11c6b66e^|yprWFWnFY5IsHE5
echo pl-pl^|6cf188088872868237a7de648cb8dd90d9e55591^|pl_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_03155da0^|yprWFWnFY5IsHE5
echo pt-pt^|89a77d8f6ab2fdad95ec3d331001343eae62c788^|pp_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_c14fa6ea^|yprWFWnFY5IsHE5
echo pt-br^|b6c46d0ce7f327dd5d1587e95b6f4a3a18b9f505^|pt_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_ad1f7c3a^|yprWFWnFY5IsHE5
echo ro-ro^|ccc0843a9f3b8d685fe4fe7065f9784134251a78^|ro_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_83c7be62^|yprWFWnFY5IsHE5
echo ru-ru^|baad6dfc9166eed3a156e628aea1365cc4fa3bb1^|ru_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_64f20d52^|yprWFWnFY5IsHE5
echo sk-sk^|350782d5d38d39b9864ec87526a8f2ba6b0d99da^|sk_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_216f32f7^|yprWFWnFY5IsHE5
echo sl-si^|6e6e80287afce7b220eef050586c452522893cea^|sl_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_ebcfe1ff^|yprWFWnFY5IsHE5
echo sr-latn-rs^|31834461c35b608e3e9b4c75b2593dd54d00f4b7^|sr-latn_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_694031ee^|yprWFWnFY5IsHE5
echo sv-se^|0a4574aa05119ef9fcc8c6e1d7f6b87cfff703e8^|sv_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_9a283618^|yprWFWnFY5IsHE5
echo th-th^|77c5a74eaf84d5710283f115f959890b98706b87^|th_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_e53f0ad5^|yprWFWnFY5IsHE5
echo tr-tr^|e2c65de0eef50ae190d7c22c1beb65c39d618214^|tr_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_4b07b624^|yprWFWnFY5IsHE5
echo uk-ua^|581605601e3ca5aa0b359b143e0e90f2fde3852a^|uk_windows_10_business_edition_version_1803_updated_sep_2018_x64_dvd_d36e528a^|yprWFWnFY5IsHE5
echo ar-sa^|b134c469051d4ca20d6c6287e9857a1e95eedfa3^|ar_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_369b817c^|IeRgatQfTAs25Ck
echo bg-bg^|cf22415dcda405d86a56d5a3c7e7dcf42bd8a0f4^|bg_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_379f8616^|IeRgatQfTAs25Ck
echo zh-cn^|a3f2c2b7e7b888fd9abae15847768ee4db19ed7e^|cn_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_048d14f9^|IeRgatQfTAs25Ck
echo cs-cz^|80d7fc31bc7e7fcb5302efee65ca5c1cd061b458^|cs_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_6d99b240^|IeRgatQfTAs25Ck
echo zh-tw^|573998ca9286dcad2996cd2a57c4136723793580^|ct_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_f4ac2359^|IeRgatQfTAs25Ck
echo da-dk^|490ec13c612ff8f780643689ee464a1bfaf0fcb1^|da_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_1c641b1c^|IeRgatQfTAs25Ck
echo de-de^|51333fd87464c946b7bae2ecadd0bd4d31e58229^|de_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_f077b010^|IeRgatQfTAs25Ck
echo el-gr^|d93cd8a387d669f1193c1fbb00a7b04c4f5fb7b0^|el_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_4130cbe6^|IeRgatQfTAs25Ck
echo en-us^|e0fc7ab79c7e9ec7971fe3a9fd302531564e6dcb^|en_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_fb8c8fd4^|IeRgatQfTAs25Ck
echo en-gb^|2213f01eab4b3cc3e58da01a10ae781e2a47f916^|en-gb_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_14cbb13e^|IeRgatQfTAs25Ck
echo es-es^|e7aabd374cd8c0027c7db5d466fd3ce44fd533d0^|es_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_4fbc8177^|IeRgatQfTAs25Ck
echo es-mx^|42cf6fb080412f175e18679755b855c82a5f8c8b^|es-mx_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_2c4b2f63^|IeRgatQfTAs25Ck
echo et-ee^|9731472a9e1bf89fd86be83fed92f25be59783f4^|et_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_81183026^|IeRgatQfTAs25Ck
echo fi-fi^|d90fa4bf47e366662fa9d116b57426bca7549890^|fi_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_05b255e4^|IeRgatQfTAs25Ck
echo fr-fr^|696845efb290e799aeda2011f806647aa599741f^|fr_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_e4e9cc05^|IeRgatQfTAs25Ck
echo fr-ca^|3584962339f1a0765551de089b3d66aff585c25d^|fr-ca_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_43eaad99^|IeRgatQfTAs25Ck
echo he-il^|9c7a07a859384585c6428f7e2ace2e3e105cab4e^|he_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_300832f9^|IeRgatQfTAs25Ck
echo hr-hr^|498265708d82ae5d9298f8c3a6356126a9892d58^|hr_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_6002c0ec^|IeRgatQfTAs25Ck
echo hu-hu^|d868a0a56f02772b1b3f7acd93a71ef9b008f859^|hu_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_158b3922^|IeRgatQfTAs25Ck
echo it-it^|9a1c6e631860bf8c11727d14fbcad4fc175aa949^|it_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_ccdfa5fb^|IeRgatQfTAs25Ck
echo ja-jp^|33d745f497bb2d61c5ed0d8e30205a1016d5dab3^|ja_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_d42e8c91^|IeRgatQfTAs25Ck
echo ko-kr^|928a2b6192a90d4f6e0be2e58bad742629a1bacf^|ko_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_a15fd087^|IeRgatQfTAs25Ck
echo lt-lt^|901cbb927475f0e4e87726bc056b799612709287^|lt_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_f5eb9a81^|IeRgatQfTAs25Ck
echo lv-lv^|7146755f311ee5624442986dc92f213df82a7a98^|lv_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_4a0c36bf^|IeRgatQfTAs25Ck
echo nb-no^|d6355c7761a7b7bf6f5df8e9ef2057ac5ef3a49d^|nb_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_261de373^|IeRgatQfTAs25Ck
echo nl-nl^|d2b2a1dc29f1fc8d9003cbf212d5fd5b2b56da01^|nl_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_b7869a51^|IeRgatQfTAs25Ck
echo pl-pl^|c96ac68957eaa67f7e5491ba5f02898753ba8386^|pl_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_68234978^|IeRgatQfTAs25Ck
echo pt-pt^|5e241f9a760244cfd6c39393b392c680e3aea21a^|pp_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_486c6edc^|IeRgatQfTAs25Ck
echo pt-br^|92df97abaf1ac727cbe130f5262f57235af0cc89^|pt_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_8ef0d455^|IeRgatQfTAs25Ck
echo ro-ro^|bc9b352ec319aef80fb351dac81290e3b27148d0^|ro_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_42d0daa9^|IeRgatQfTAs25Ck
echo ru-ru^|e641c6d873756ac36b8171db4fd6d3fd746aed9b^|ru_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_0c67436e^|IeRgatQfTAs25Ck
echo sk-sk^|d688dce9921863c9cab72e437f5da40f15eebfd7^|sk_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_c8a3a6d5^|IeRgatQfTAs25Ck
echo sl-si^|075578c4a42be823b75fcb2e08a344ae22a724c4^|sl_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_52c768eb^|IeRgatQfTAs25Ck
echo sr-latn-rs^|605ae38f33535ab05bbd743026f053b4d7c2da99^|sr-latn_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_9ff061ee^|IeRgatQfTAs25Ck
echo sv-se^|965f37030f0f464b70cb4ef50163bb3d16c8f106^|sv_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_d7878690^|IeRgatQfTAs25Ck
echo th-th^|be326993a9f72120532bc3e69aee8be13a2b1aa5^|th_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_b6cda972^|IeRgatQfTAs25Ck
echo tr-tr^|a4e48336c5a4de83b6e1f01eff065a9684608f3f^|tr_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_a05c5357^|IeRgatQfTAs25Ck
echo uk-ua^|8d5daffdd3eba3f396099bd9b0735aa28b311bdf^|uk_windows_10_business_edition_version_1803_updated_sep_2018_x86_dvd_6e341c36^|IeRgatQfTAs25Ck
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DB18091 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DB18091
>>database.1809.1.smrt (
echo ar-sa^|99f0d8a08e25c78e8d40ba98bb9f253c3666f687^|ar_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_cc53f041^|lxfcy5TzwilGdyu
echo ar-sa^|b5d646e423ba371e20a79776bc88b4c90be6f6fb^|ar_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_9dbe8379^|lxfcy5TzwilGdyu
echo ar-sa^|a22f9cacd57a6d213a302256d1d22cd460049d35^|ar_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_b6ba1986^|lxfcy5TzwilGdyu
echo ar-sa^|29eec618b904e2549463f68d55092b27a16c1dbe^|ar_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_32f2b189^|lxfcy5TzwilGdyu
echo ar-sa^|fd86b4ce64567cf0f2631543be131a2a332ae3b0^|ar_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_19d2df6a^|lxfcy5TzwilGdyu
echo bg-bg^|b5bdc90c274f9fc6f17de30e7eaf0eaeb20b1654^|bg_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_abb2c44f^|lxfcy5TzwilGdyu
echo bg-bg^|0c3bda1d2b4408797e7f65a9673b7b788fd81491^|bg_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_d58d81c3^|lxfcy5TzwilGdyu
echo bg-bg^|fd7ad95cdee74fdbaf7cb384f61e0835272b3151^|bg_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_b4c81de3^|lxfcy5TzwilGdyu
echo bg-bg^|16e3d66b8cfdf772cd4dccaf79cf6710198401a1^|bg_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_60dd7d95^|lxfcy5TzwilGdyu
echo bg-bg^|046b056d17eb0264f1683b465f086e2761a987ef^|bg_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_a24e8a6e^|lxfcy5TzwilGdyu
echo cs-cz^|9d5c2cc6d23241e0fd4a9225b454a0c4c340f2f2^|cs_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_8001fefb^|lxfcy5TzwilGdyu
echo cs-cz^|ead9248e8e8dea0ac5e6475eb8ff70688815ca0f^|cs_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_5862aed7^|lxfcy5TzwilGdyu
echo cs-cz^|5a4aea3b7c0776bd576f558780eb2ab8c8ed5df8^|cs_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_2f58465e^|lxfcy5TzwilGdyu
echo cs-cz^|18b8cbaf977ab99b87ba4d740906a41484d77e40^|cs_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_6aeafa39^|lxfcy5TzwilGdyu
echo cs-cz^|be0064206618dbbb9136b9e6a4700da9251399bd^|cs_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_2143b5b6^|lxfcy5TzwilGdyu
echo da-dk^|3c5354b8ab1b2a835a10fb92ba9636c32e31ee8b^|da_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_a1451a70^|lxfcy5TzwilGdyu
echo da-dk^|f059fd23fad2ef878051d912369ae85b9380b2b4^|da_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_607a331f^|lxfcy5TzwilGdyu
echo da-dk^|b6374b0eca8af55358fd73b28d8cc5d12eeb9a20^|da_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_871c3630^|lxfcy5TzwilGdyu
echo da-dk^|e58468cc62f96987d4d14ab6bd0f25fb21972cc2^|da_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_e629f95b^|lxfcy5TzwilGdyu
echo da-dk^|84505f4b7be2da8db23199e6fd27d63aac8b00fe^|da_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_85e22774^|lxfcy5TzwilGdyu
echo de-de^|49ea873ad10dff84f57fd2ab8096621033f3b068^|de_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_1ebc3304^|lxfcy5TzwilGdyu
echo de-de^|262de3662f20b57612ff5dd81f53241774aa2e52^|de_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_0c671731^|lxfcy5TzwilGdyu
echo de-de^|2f55b8a04c32ef984cd51930a460f63d0f1d81cb^|de_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_5062aa2e^|lxfcy5TzwilGdyu
echo de-de^|26bc9a1a5c08d9e8be886cd12fe4ff0eabd1c9c6^|de_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_f097bb1b^|lxfcy5TzwilGdyu
echo de-de^|78822dbae0af88327f3b0765a6a7d23f4d11119f^|de_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_63c83786^|lxfcy5TzwilGdyu
echo el-gr^|d3c913a2c864fdc6321588cf8f5c268bfbc6b9b4^|el_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_2d8fa25d^|lxfcy5TzwilGdyu
echo el-gr^|0f4e4d6b0589044f119eaa405681c3bf8cd045da^|el_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_ad88624a^|lxfcy5TzwilGdyu
echo el-gr^|4c61caf23d2d4f39e0a612fe1a7179928871635f^|el_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_925ccf87^|lxfcy5TzwilGdyu
echo el-gr^|99fa31c341263b3344926df8b664009f68920d84^|el_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_96bc152c^|lxfcy5TzwilGdyu
echo el-gr^|958bbce223832196b48929dd0410dcdb2d0a4312^|el_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_71d16b79^|lxfcy5TzwilGdyu
echo en-gb^|265a5268880c48364f66eaf348c54ccfe580f765^|en-gb_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_747aaf27^|lxfcy5TzwilGdyu
echo en-gb^|1f81600ebcd2aef737ec795c4308503f6cd52a13^|en-gb_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_dd521501^|lxfcy5TzwilGdyu
echo en-gb^|a2aea527a04860759b47deb644eac115b4588395^|en-gb_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_9436101a^|lxfcy5TzwilGdyu
echo en-gb^|84e64722300c855a25a177514d72f1d1cb8efd3b^|en-gb_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_b663f448^|lxfcy5TzwilGdyu
echo en-gb^|c347151b94f33b6148545f3e51244dd3c54b1b0a^|en-gb_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_229c195b^|lxfcy5TzwilGdyu
echo en-us^|52d18744d37245b2bec48e1bb465827e82e1ff8f^|en_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_552531c5^|lxfcy5TzwilGdyu
echo en-us^|0be4e80687d8d7eff8c80c5aa8c03b15e2f77256^|en_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_d57f2c0d^|lxfcy5TzwilGdyu
echo en-us^|546489513f34e9a6d06b723009654ad695af5dbc^|en_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_37ef4f24^|lxfcy5TzwilGdyu
echo en-us^|760afd2a7ec9e9685ca51c1f0de4b174acd9024a^|en_windows_10_consumer_edition_version_1809_updated_sept_2018_arm64_dvd_7198fbf0^|lxfcy5TzwilGdyu
echo en-us^|500c9635645a91c09d3c3904fd12f0e1fd3f709e^|en_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_5c2f3f9a^|lxfcy5TzwilGdyu
echo en-us^|bc4b6cab40e6d60ca4fa8969b16374a2e9b724d5^|en_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_0addd9ef^|lxfcy5TzwilGdyu
echo es-es^|e4b52b60c1ad41aae0437cf55369c4569cdcb9f3^|es_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_6f9afbc6^|lxfcy5TzwilGdyu
echo es-es^|0150d5466e93c147d3728746567a61473d35062a^|es_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_3685ebd9^|lxfcy5TzwilGdyu
echo es-es^|8791860c8a77e44cfdf03ffcca0e7f955e2246ae^|es_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_bae79fd7^|lxfcy5TzwilGdyu
echo es-es^|431ccaf191e34049043e6d3c0cf8b424ad1b0e3c^|es_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_500f371e^|lxfcy5TzwilGdyu
echo es-es^|2de64dadf9185362f35afc61391a389831a09e64^|es_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_6423f6e6^|lxfcy5TzwilGdyu
echo es-mx^|d993edc9360f8650449498e372fb2d60bc013154^|es-mx_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_08d7fa55^|lxfcy5TzwilGdyu
echo es-mx^|da5188c19ed54dc3fb29bf7e66961c00943c4e15^|es-mx_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_5d65d424^|lxfcy5TzwilGdyu
echo es-mx^|03bcbf6b83eae687b9bc30c00d6c2447898bf752^|es-mx_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_bbaf17b3^|lxfcy5TzwilGdyu
echo es-mx^|942b12c8791102913a296be4156e23a6611172aa^|es-mx_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_dbd1de6f^|lxfcy5TzwilGdyu
echo es-mx^|d6a940980b5b3760e4521078d70bbbb641bf45da^|es-mx_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_0f192fdb^|lxfcy5TzwilGdyu
echo et-ee^|2a5061a0c14a22ab2557d5b57a3771b160ea8617^|et_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_14e7ac91^|lxfcy5TzwilGdyu
echo et-ee^|d6d4ba54de3cdf7aaca89e19606ef5f5fb64117b^|et_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_2d30de0a^|lxfcy5TzwilGdyu
echo et-ee^|e5bd7a863ddb688921704da8369cf3a4137357a6^|et_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_a0624a3b^|lxfcy5TzwilGdyu
echo et-ee^|b67d900982b5beee735dfefbbb07132d4eed6f4c^|et_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_ea6fb50a^|lxfcy5TzwilGdyu
echo et-ee^|513e2154b9d042bcba3992244c02198f3c2f595e^|et_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_4d681250^|lxfcy5TzwilGdyu
echo fi-fi^|99a7c3775cc2afc6ed598e75518c19a990ccdf8c^|fi_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_7b3936cc^|lxfcy5TzwilGdyu
echo fi-fi^|cb9a69a4e72d8521d19576addcf632c3319403d6^|fi_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_9f9110a9^|lxfcy5TzwilGdyu
echo fi-fi^|36853da10b974281a89b117b78d58b5f9f0e57c8^|fi_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_294f97cf^|lxfcy5TzwilGdyu
echo fi-fi^|1f5c32c96236aadfb6e69328835fdb9e332d9d51^|fi_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_1cf055a4^|lxfcy5TzwilGdyu
echo fi-fi^|d2ed0364423727934a5fdfb217ea4466e6861e87^|fi_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_c15a0217^|lxfcy5TzwilGdyu
echo fr-ca^|8257c9d867906f36981d392ecc2a67ac1bafede1^|fr-ca_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_49002e91^|lxfcy5TzwilGdyu
echo fr-ca^|c2270ad25a5cc6170c33e0d03b75f2301a8283b2^|fr-ca_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_fb806a2c^|lxfcy5TzwilGdyu
echo fr-ca^|a18c792890b0d61facdcc44be89198fab1dce905^|fr-ca_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_022ed2a1^|lxfcy5TzwilGdyu
echo fr-ca^|0ec328877d153784321b97b2ba40e2ddb3c43387^|fr-ca_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_cc1da2df^|lxfcy5TzwilGdyu
echo fr-ca^|1ddc54a242b4b6ef2463a9a6352c19c7bd4814a5^|fr-ca_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_b1e53443^|lxfcy5TzwilGdyu
echo fr-fr^|f169feccebb7ef22fa15af27e3dd29768046db87^|fr_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_e027c1b9^|lxfcy5TzwilGdyu
echo fr-fr^|c6fada8faf3bf0bf3f29327cb94062d569a887c7^|fr_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_30b694ff^|lxfcy5TzwilGdyu
echo fr-fr^|1989683151456ceef415bc8d3bc5678bf63c5704^|fr_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_2f0e979c^|lxfcy5TzwilGdyu
echo fr-fr^|9754ccb2fa7f293bc9dcadad16a2222c5576b566^|fr_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_305115c4^|lxfcy5TzwilGdyu
echo fr-fr^|a88431213a86d9fc8c955771b616ac1a63022c17^|fr_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_228fdd2a^|lxfcy5TzwilGdyu
echo he-il^|111e9068d7cac2064f482a8bf0861d3a76d0743c^|he_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_a68dbee2^|lxfcy5TzwilGdyu
echo he-il^|8c872d746faf4c618ca1d07991147c5ed788a1bf^|he_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_06275a63^|lxfcy5TzwilGdyu
echo he-il^|c0c08b27595d83fe77dab091449b26421ad1f8c3^|he_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_4a4e84a4^|lxfcy5TzwilGdyu
echo he-il^|7991d0d72ab487b8aab03af1dc378d127331ec15^|he_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_9907f68e^|lxfcy5TzwilGdyu
echo he-il^|34f2f583450a6a3e695622c0d34d529713f68317^|he_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_2bc2c2b6^|lxfcy5TzwilGdyu
echo hr-hr^|1ff0de9388e1c4f71d7ff7eeceb616426c7495fe^|hr_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_5b19750c^|lxfcy5TzwilGdyu
echo hr-hr^|b1d78a7944170832e7c7aa802f73a9623bef6a7f^|hr_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_1d9c7d16^|lxfcy5TzwilGdyu
echo hr-hr^|ffb277eed236c0746bd2cc93bc12c14a9b8d4fd4^|hr_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_04d634bb^|lxfcy5TzwilGdyu
echo hr-hr^|16461ad737586b08cb1e89f6ef0d9324e59c6612^|hr_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_c0d12157^|lxfcy5TzwilGdyu
echo hr-hr^|cfb771bffe40baeafba6c7f805251d07c3a780ad^|hr_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_fc9f91e5^|lxfcy5TzwilGdyu
echo hu-hu^|6f91321d329e5df04824209313f5362aaef2fa78^|hu_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_7f8736fa^|lxfcy5TzwilGdyu
echo hu-hu^|15697e1a0bf474a1674c631df885ac1784dbe528^|hu_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_9967763f^|lxfcy5TzwilGdyu
echo hu-hu^|9c8615441492123fb3015a78750357f5c740010c^|hu_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_fc487ea4^|lxfcy5TzwilGdyu
echo hu-hu^|4937b804ac67eaa319c759d647103c20dc665c50^|hu_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_5994c7b8^|lxfcy5TzwilGdyu
echo hu-hu^|8e0805bbf765443049a925c1095b667a04614873^|hu_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_ca67e769^|lxfcy5TzwilGdyu
echo it-it^|e67924e9e854de8be603ea6f82999c9f3a4a7d53^|it_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_11af5caa^|lxfcy5TzwilGdyu
echo it-it^|0f0f0d0a71b67dadc6cb163dcde0bc7994bb3a78^|it_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_b4ede880^|lxfcy5TzwilGdyu
echo it-it^|c0e569dfda081809099567a21d0517d7473e1532^|it_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_da71de3e^|lxfcy5TzwilGdyu
echo it-it^|6cf89c376d3c3d65749cc45bc3925d42960496d5^|it_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_0530b594^|lxfcy5TzwilGdyu
echo it-it^|6cbc57f07c086f6de30c1891c9e8afe7f9ddc371^|it_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_bac04982^|lxfcy5TzwilGdyu
echo ja-jp^|acd4cdbca247a62f0a68c34b6da75ce6ea9a608c^|ja_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_a41bc3a2^|lxfcy5TzwilGdyu
echo ja-jp^|29b58c00be7f6430fb070511c2471d58729180b2^|ja_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_d98aa402^|lxfcy5TzwilGdyu
echo ja-jp^|4f1b8f11c3bd05550cbd7e3ede2785cb4626c80e^|ja_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_c48bd7e4^|lxfcy5TzwilGdyu
echo ja-jp^|4709a94c64c144207f184b103810898d71d5b99b^|ja_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_47255109^|lxfcy5TzwilGdyu
echo ja-jp^|0c7d0b6098d6dc40d811ac95d6da75e039365d33^|ja_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_4fe9b39c^|lxfcy5TzwilGdyu
echo ko-kr^|7eea7c56d84247a6b002a567111aaff0125d3936^|ko_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_bee61fff^|lxfcy5TzwilGdyu
echo ko-kr^|d57e5580bf06b2bd4c01cd5652d7a6d4b3a9d4af^|ko_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_3d09365a^|lxfcy5TzwilGdyu
echo ko-kr^|bad6c8b9b48a7c2dedcb022b3935b59dafc70e49^|ko_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_452e1ee4^|lxfcy5TzwilGdyu
echo ko-kr^|67b0412e2f1b6b2753c1c5287eb718a64ea7fee1^|ko_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_7b410c74^|lxfcy5TzwilGdyu
echo ko-kr^|21e77cca11d1266ba63d6fdbf51499b670e1513b^|ko_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_e70251eb^|lxfcy5TzwilGdyu
echo lt-lt^|1ebba152e6b49ab8fa3adb1b2f779d685db777a5^|lt_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_3ed68fc9^|lxfcy5TzwilGdyu
echo lt-lt^|179b65a4cbe4d3163c6210062b479a87f2b5e9b8^|lt_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_895f99ab^|lxfcy5TzwilGdyu
echo lt-lt^|36a317a99f9b49fa2d936ea6f7971d69c295c3ed^|lt_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_3573e467^|lxfcy5TzwilGdyu
echo lt-lt^|04c3d73b655f91bfd353ac07fe7cee18b9da51b0^|lt_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_06a526d5^|lxfcy5TzwilGdyu
echo lt-lt^|77e50ccc7843bdf547cd9a996b4f51d4b061906c^|lt_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_31512ee2^|lxfcy5TzwilGdyu
echo lv-lv^|051a511c50dae89b037324f75faa1dc7e4c7ab6a^|lv_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_96b37dac^|lxfcy5TzwilGdyu
echo lv-lv^|3de388a6f1f3af72e0422da886973bf23acaa2b3^|lv_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_ca98332a^|lxfcy5TzwilGdyu
echo lv-lv^|93a787c0bf5876fb06c927b18ac4bf468d80757a^|lv_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_95b44e1d^|lxfcy5TzwilGdyu
echo lv-lv^|0f6e35cd3d4d5fd2f964cefe7b28dfef3625d9f7^|lv_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_a93338c3^|lxfcy5TzwilGdyu
echo lv-lv^|2c52c808a43fb6935018fe538705815a2f3eaaa9^|lv_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_a2e3a827^|lxfcy5TzwilGdyu
echo nb-no^|2c7fe694e7dd25eae9f631ed06e6b1f1308df721^|nb_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_c20f278c^|lxfcy5TzwilGdyu
echo nb-no^|fc7da6b022ca38eca85118bfff6ac1b65af57d5c^|nb_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_6998bbb9^|lxfcy5TzwilGdyu
echo nb-no^|5591b82e556599e387f5d96fe24210a7a5fc55de^|nb_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_9b692694^|lxfcy5TzwilGdyu
echo nb-no^|2ddd9e1b5635d8d486480501dab6704b02ca8f52^|nb_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_a21ab924^|lxfcy5TzwilGdyu
echo nb-no^|510c3a3034bb92e07423869f630b487a573aa1ee^|nb_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_93c0998b^|lxfcy5TzwilGdyu
echo nl-nl^|8b2c2f3fd5471156e50fb976c38b85f32c61b26f^|nl_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_39ad930e^|lxfcy5TzwilGdyu
echo nl-nl^|af0fb247fc3dedb6434f083e619428ecfd0b4d28^|nl_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_d91d61eb^|lxfcy5TzwilGdyu
echo nl-nl^|b2b4b6178797a277b8d64fd70a86ec462136da94^|nl_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_9d5bf42c^|lxfcy5TzwilGdyu
echo nl-nl^|ee5fbe989ed9c770c69176cef9d3c29dee25a5e0^|nl_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_f197f824^|lxfcy5TzwilGdyu
echo nl-nl^|8752addfe7b6fafbb98ccec1104f79a59902357c^|nl_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_66e33ed9^|lxfcy5TzwilGdyu
echo pl-pl^|214051490ada9c3600ef1e6a31a484f9c98ffb9b^|pl_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_e3481a76^|lxfcy5TzwilGdyu
echo pl-pl^|902be4d8a68d9ad01011007f4710a1762cd1766c^|pl_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_626b1b40^|lxfcy5TzwilGdyu
echo pl-pl^|ea69e9b43e67a84d68c75b004891c94e9cf10472^|pl_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_96a777bb^|lxfcy5TzwilGdyu
echo pl-pl^|96bbe53246ff389764502dc4f503118b83246131^|pl_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_fa1b1b89^|lxfcy5TzwilGdyu
echo pl-pl^|461efeef208bf6d53080130b9cd747fc9b706652^|pl_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_9334dfb7^|lxfcy5TzwilGdyu
echo pt-br^|c92886fd3584a8faa266da058f1456c7aba408c2^|pt_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_1d5d9084^|lxfcy5TzwilGdyu
echo pt-br^|987c6ffad0e5ac3bf1fa9aa3b8903c9643e9a9d7^|pt_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_c7bc7720^|lxfcy5TzwilGdyu
echo pt-br^|fa39b285661283d9be8304a9763cab714105e24e^|pt_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_dbf44c97^|lxfcy5TzwilGdyu
echo pt-br^|68d8827b66165a87f4b73712273ed48cc086c33d^|pt_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_f3f53e66^|lxfcy5TzwilGdyu
echo pt-br^|f1550e9c36b45180bab85664d6dddd635a6eb8a4^|pt_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_1af829fb^|lxfcy5TzwilGdyu
echo pt-pt^|b185d2fe8b1c2b0ce038b1397333fbd01fd1783b^|pp_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_8c021bdd^|lxfcy5TzwilGdyu
echo pt-pt^|2a65fe7c54c5a597ba6d568e40467aefb9d97526^|pp_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_15b96ce3^|lxfcy5TzwilGdyu
echo pt-pt^|76531355ddb33f5ee1cec5d06147335c2e5da092^|pp_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_3aa8513d^|lxfcy5TzwilGdyu
echo pt-pt^|e08cd41d78f2031eb4e09363574ec738cc47a25e^|pp_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_803a26e5^|lxfcy5TzwilGdyu
echo pt-pt^|6eae9eae2c6807f625da78818b41af06f1aeaf3e^|pp_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_02c615bc^|lxfcy5TzwilGdyu
echo ro-ro^|780bbee46074cb8d1ac250de49d0c581a1204d63^|ro_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_2a9b8e44^|lxfcy5TzwilGdyu
echo ro-ro^|cdeda09c7481729229c72a9714aaa89231ee5c4c^|ro_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_eabd9cf2^|lxfcy5TzwilGdyu
echo ro-ro^|a299b60f6355193edbbd4057303a54a666099aac^|ro_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_8c5ece44^|lxfcy5TzwilGdyu
echo ro-ro^|862fc5619b0e3932bc9c72ea53eb54b908990320^|ro_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_3e81eea8^|lxfcy5TzwilGdyu
echo ro-ro^|ee939aa5eab93fc94a666db1d6e97541e002b84e^|ro_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_ba90a463^|lxfcy5TzwilGdyu
echo ru-ru^|0a6cee1b661336cfdad99781588c132c17da3861^|ru_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_4683af94^|lxfcy5TzwilGdyu
echo ru-ru^|39f4d4dc99d52741f9e7ec6d3fdf85d924d4c0d9^|ru_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_b115f344^|lxfcy5TzwilGdyu
echo ru-ru^|d0e4810862516a1e7a4726761d86099595216b91^|ru_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_2f0478fd^|lxfcy5TzwilGdyu
echo ru-ru^|f905f71f6f75a0aec99ff1cfc091cb46bac5f6fc^|ru_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_26d25101^|lxfcy5TzwilGdyu
echo ru-ru^|64823da9dd35f93d3b5c7f2681c966da7cb57c5a^|ru_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_f2070097^|lxfcy5TzwilGdyu
echo sr-latn-rs^|0db16e7b6cab4821a1e46e6e00c7ed13f33dc594^|sr-latn_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_521791b8^|lxfcy5TzwilGdyu
echo sr-latn-rs^|d34904fd0ac7c43b34d6d3f90ed8482e74f4e3c1^|sr-latn_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_b0606c9b^|lxfcy5TzwilGdyu
echo sr-latn-rs^|c9978e69a3f352a507b28a5241e46130602fa974^|sr-latn_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_334006ac^|lxfcy5TzwilGdyu
echo sr-latn-rs^|6e1f5ed604eec8f298fc7806952cbfbd287151fd^|sr-latn_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_b8820fa4^|lxfcy5TzwilGdyu
echo sr-latn-rs^|c657b2f155da362db04f79408c8e7cc8f46600c4^|sr-latn_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_b8755d35^|lxfcy5TzwilGdyu
echo sk-sk^|7cc4efea7d00f2be1fb2cb94f2d4f89afa5b89cd^|sk_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_7df9958d^|lxfcy5TzwilGdyu
echo sk-sk^|999304221acea77a848001891dac6f3a2e97ecc0^|sk_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_d36aa9da^|lxfcy5TzwilGdyu
echo sk-sk^|297d33a2475d08826a995f3d0f27c58476f328d5^|sk_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_b29e0693^|lxfcy5TzwilGdyu
echo sk-sk^|bf1913aecbdb1ad18c1fd6c338ef55f220cb1144^|sk_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_3689a0d0^|lxfcy5TzwilGdyu
echo sk-sk^|78c112f5ae1a25fc8e630976d67e696487b80f2b^|sk_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_c69deedc^|lxfcy5TzwilGdyu
echo sl-si^|2f9bb432747e57db12c5e23f108c97ca93393411^|sl_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_40ecfc66^|lxfcy5TzwilGdyu
echo sl-si^|d0a70c8c10a11c86d5245e42ed605eaf33ee02b9^|sl_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_6e53cdcd^|lxfcy5TzwilGdyu
echo sl-si^|0ac6748852d79b68ea548b57d4b8cbd3f9d03cfc^|sl_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_eeee77b9^|lxfcy5TzwilGdyu
echo sl-si^|54030c95fdb2bddd788948e2ac62e1fdc14e37b2^|sl_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_610279dd^|lxfcy5TzwilGdyu
echo sl-si^|8e59d17d9f44872dc144a7ef97d2e4c603eb021e^|sl_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_c5ad26b0^|lxfcy5TzwilGdyu
echo sv-se^|46cac9be8ec382581f5d9cf81969681fd1d0b3a6^|sv_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_8ff989a0^|lxfcy5TzwilGdyu
echo sv-se^|5607f2b4bb46b8a041b056da5d8c99f76a3f1fda^|sv_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_ae84945f^|lxfcy5TzwilGdyu
echo sv-se^|daaec27fc1db44aab3fce0d1d0f46fd3c906efe8^|sv_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_92dce8a2^|lxfcy5TzwilGdyu
echo sv-se^|37945d6986457ea8d3df02cbb56dece66b13b1ec^|sv_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_7a4e3518^|lxfcy5TzwilGdyu
echo sv-se^|1fe00131e68f5c4dacde972343f56d07890b6650^|sv_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_37cecd22^|lxfcy5TzwilGdyu
echo th-th^|2591c698b4f366b30962c8361591239c49c2c07e^|th_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_58caaafe^|lxfcy5TzwilGdyu
echo th-th^|0d19c06cba9677deebaef07c134603cea498b656^|th_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_84c39d89^|lxfcy5TzwilGdyu
echo th-th^|28a22b744f9e8694b0c8570ba6b663529cfc9054^|th_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_6fcff26a^|lxfcy5TzwilGdyu
echo th-th^|63411ed63997a012fefa94cc97ab495db466d6c0^|th_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_0d2854c4^|lxfcy5TzwilGdyu
echo th-th^|b3313875a453de270e31c76d868029d4cacf53f5^|th_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_04297a94^|lxfcy5TzwilGdyu
echo tr-tr^|f6eef489dae0b45c65c73c3d6b00d27827faf219^|tr_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_c7c8571a^|lxfcy5TzwilGdyu
echo tr-tr^|c54dcaed4583f34297d1f268ed6ce2498f89b656^|tr_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_affb64d2^|lxfcy5TzwilGdyu
echo tr-tr^|8a073fc3d1a5ee8c912f40264dc7d8d3e37ec1f3^|tr_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_b3d05fca^|lxfcy5TzwilGdyu
echo tr-tr^|77ab5adaea15d43f1a656d9d741d5efd1850e260^|tr_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_285646fe^|lxfcy5TzwilGdyu
echo tr-tr^|b33a3b0478f131e364458bec94cefd8bd487ae84^|tr_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_6fa00519^|lxfcy5TzwilGdyu
echo uk-ua^|95ce2c53c151a8e04008cdfa31e41ec50f1dd298^|uk_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_d1fd3bcf^|lxfcy5TzwilGdyu
echo uk-ua^|86683d9a69af55551d77b331f658c0d8ddb39df7^|uk_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_3a32e660^|lxfcy5TzwilGdyu
echo uk-ua^|4dca625ffb76393676558cc54e479355a8abf448^|uk_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_373ac322^|lxfcy5TzwilGdyu
echo uk-ua^|306cfeae4d50ed36de4ca57113548086c1dba0ee^|uk_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_d20275d4^|lxfcy5TzwilGdyu
echo uk-ua^|84ff855355334e63f11a865f24030a9de9f788d6^|uk_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_837affb6^|lxfcy5TzwilGdyu
echo zh-cn^|b259c0fbd6134ecc94edb68077be300b01ac683f^|cn_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_438ba324^|lxfcy5TzwilGdyu
echo zh-cn^|b89fdc0e10f01d74aab91c0c0b0d3a9aedeff667^|cn_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_fc5542c0^|lxfcy5TzwilGdyu
echo zh-cn^|06a589bbf9e2975daca63d2271f1f53000f17519^|cn_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_0d8cffa0^|lxfcy5TzwilGdyu
echo zh-cn^|286e03010f7570cb00a0b3ef968150fce3c9d430^|cn_windows_10_consumer_edition_version_1809_updated_sept_2018_arm64_dvd_76148eed^|lxfcy5TzwilGdyu
echo zh-cn^|c8deade18822435d8d47011609c124496e94df71^|cn_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_051b7719^|lxfcy5TzwilGdyu
echo zh-cn^|b21c1ef5445f0c0a185ab15eaf0e953b737ca55c^|cn_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_c904d6c8^|lxfcy5TzwilGdyu
echo zh-tw^|967d5caebb7f7035d5c6520e0c435917f93c50ad^|ct_windows_10_business_edition_version_1809_updated_sept_2018_arm64_dvd_5e51c38d^|lxfcy5TzwilGdyu
echo zh-tw^|011da0f9a9631bdfe2b64e466608c1c6e25efeb4^|ct_windows_10_business_edition_version_1809_updated_sept_2018_x64_dvd_aa417a8c^|lxfcy5TzwilGdyu
echo zh-tw^|8976fba057ae8e91ff767c531f86b91f357d3d6c^|ct_windows_10_business_edition_version_1809_updated_sept_2018_x86_dvd_36cf457a^|lxfcy5TzwilGdyu
echo zh-tw^|a6b5d9bdccaa19ead31b781e23aa94aabe864d6f^|ct_windows_10_consumer_edition_version_1809_updated_sept_2018_x64_dvd_23cc9738^|lxfcy5TzwilGdyu
echo zh-tw^|c49acd10076fcc91a413176a3ea65dcb2ca3beb0^|ct_windows_10_consumer_edition_version_1809_updated_sept_2018_x86_dvd_99ad0600^|lxfcy5TzwilGdyu
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBLTSB STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBLTSB
>>database.LTSB.smrt (
echo ar-sa^|47ffb65d6e7f64bd1a12439fe8296079de7f29b7^|ar_windows_10_enterprise_2016_ltsb_x64_dvd_9059481^|vZysMUyuP9nbx0s
echo bg-bg^|8a3d80805d1b65041c7cdd8159a2c4ff009333f8^|bg_windows_10_enterprise_2016_ltsb_x64_dvd_9060109^|vZysMUyuP9nbx0s
echo zh-cn^|9e405e950890d2a196565bca35e152f9cfad296d^|cn_windows_10_enterprise_2016_ltsb_x64_dvd_9060409^|vZysMUyuP9nbx0s
echo cs-cz^|cc2dd6b6008518c5bccb83fad0a8e5d11282c857^|cs_windows_10_enterprise_2016_ltsb_x64_dvd_9058277^|vZysMUyuP9nbx0s
echo zh-tw^|1cde8b641c107fcf23fdf54c9b243dc152898800^|ct_windows_10_enterprise_2016_ltsb_x64_dvd_9057374^|vZysMUyuP9nbx0s
echo da-dk^|4635d7a71d1891167ab34358ddc2661b72950edd^|da_windows_10_enterprise_2016_ltsb_x64_dvd_9058601^|vZysMUyuP9nbx0s
echo de-de^|013d675ae09148f42a9ffe3d3bc53fdd861db7a5^|de_windows_10_enterprise_2016_ltsb_x64_dvd_9058605^|vZysMUyuP9nbx0s
echo el-gr^|a93b9db4cf79b0dcf7ea2c39ff49363a5ff4f75c^|el_windows_10_enterprise_2016_ltsb_x64_dvd_9059317^|vZysMUyuP9nbx0s
echo en-us^|031ed6acdc47b8f582c781b039f501d83997a1cf^|en_windows_10_enterprise_2016_ltsb_x64_dvd_9059483^|vZysMUyuP9nbx0s
echo en-gb^|21d25006b7f0c00d035a200b0fe4cb7da1c1e2ef^|en-gb_windows_10_enterprise_2016_ltsb_x64_dvd_9060114^|vZysMUyuP9nbx0s
echo es-es^|b68f1e7b6d05bd9c3c54457951731b2f6dc464f9^|es_windows_10_enterprise_2016_ltsb_x64_dvd_9059485^|vZysMUyuP9nbx0s
echo es-mx^|a13c4fb8843e4094c466b907dce14405d475eb71^|es-mx_windows_10_enterprise_2016_ltsb_x64_dvd_9060115^|vZysMUyuP9nbx0s
echo et-ee^|0ba22158a79e58b6ef46c21d93af987d99f49160^|et_windows_10_enterprise_2016_ltsb_x64_dvd_9060433^|vZysMUyuP9nbx0s
echo fi-fi^|37a616be035d56ba595cbd3ff1fdec6289840731^|fi_windows_10_enterprise_2016_ltsb_x64_dvd_9057376^|vZysMUyuP9nbx0s
echo fr-fr^|ec0fd7a206f61bc093b425c44aaf43d575b3fcc3^|fr_windows_10_enterprise_2016_ltsb_x64_dvd_9057871^|vZysMUyuP9nbx0s
echo fr-ca^|4286660250c0f137cb6fbebc0854adda94731bd7^|fr-ca_windows_10_enterprise_2016_ltsb_x64_dvd_9058278^|vZysMUyuP9nbx0s
echo he-il^|6d5691b02cebfbaccb837b4d9173e59d7b2a4ea1^|he_windows_10_enterprise_2016_ltsb_x64_dvd_9059484^|vZysMUyuP9nbx0s
echo hr-hr^|95585264fe6fe2f9bc199e754089811ab52ab494^|hr_windows_10_enterprise_2016_ltsb_x64_dvd_9057884^|vZysMUyuP9nbx0s
echo hu-hu^|c36e09d06cc2a8af3a459becca808cccfdbe62a4^|hu_windows_10_enterprise_2016_ltsb_x64_dvd_9060111^|vZysMUyuP9nbx0s
echo it-it^|dec5088aa2867c94be9ee8a5c99735963e1b6ee1^|it_windows_10_enterprise_2016_ltsb_x64_dvd_9060446^|vZysMUyuP9nbx0s
echo ja-jp^|1c774cdcf375b3a03e613bc96b27a01cc0c15482^|ja_windows_10_enterprise_2016_ltsb_x64_dvd_9057377^|vZysMUyuP9nbx0s
echo ko-kr^|630cd7102efc734539922ed85ac8a73058980cd8^|ko_windows_10_enterprise_2016_ltsb_x64_dvd_9057889^|vZysMUyuP9nbx0s
echo lt-lt^|6ede4a4a0a2fec324dbacc46ccb288043fd85e3d^|lt_windows_10_enterprise_2016_ltsb_x64_dvd_9058606^|vZysMUyuP9nbx0s
echo lv-lv^|e867a15024ec0cd341c49e41cab3db6edecd1609^|lv_windows_10_enterprise_2016_ltsb_x64_dvd_9058289^|vZysMUyuP9nbx0s
echo nb-no^|90e9c37ff20f0ee608c199b1f2a061fdb469575e^|nb_windows_10_enterprise_2016_ltsb_x64_dvd_9059319^|vZysMUyuP9nbx0s
echo nl-nl^|31f99c2922af126469910d6754f5eb011662316a^|nl_windows_10_enterprise_2016_ltsb_x64_dvd_9059312^|vZysMUyuP9nbx0s
echo pl-pl^|41292c04b2dbba1684bfbac5c94bfd87d40e90ee^|pl_windows_10_enterprise_2016_ltsb_x64_dvd_9059490^|vZysMUyuP9nbx0s
echo pt-pt^|8e58a026e6d823851ed40d30327678051a28fd06^|pp_windows_10_enterprise_2016_ltsb_x64_dvd_9060465^|vZysMUyuP9nbx0s
echo pt-br^|118cd58c44776d728dad86c6b80361afcac72b6c^|pt_windows_10_enterprise_2016_ltsb_x64_dvd_9060113^|vZysMUyuP9nbx0s
echo ro-ro^|ffadcc230a56f1f37d97498bab1f5d6a4c91cd03^|ro_windows_10_enterprise_2016_ltsb_x64_dvd_9057388^|vZysMUyuP9nbx0s
echo ru-ru^|0770a930a329a487b8a637aa7836e307a8b47634^|ru_windows_10_enterprise_2016_ltsb_x64_dvd_9057886^|vZysMUyuP9nbx0s
echo sk-sk^|f39d2ed71ffdcbaa9330fe0ec0c9a404e6843040^|sk_windows_10_enterprise_2016_ltsb_x64_dvd_9058612^|vZysMUyuP9nbx0s
echo sl-si^|369ac4a2789c805f123d843f8495a6c539aa89a9^|sl_windows_10_enterprise_2016_ltsb_x64_dvd_9059321^|vZysMUyuP9nbx0s
echo sr-latn-rs^|0871c1e4466fa7b60a5f505a17025c317586b811^|sr-latn_windows_10_enterprise_2016_ltsb_x64_dvd_9058293^|vZysMUyuP9nbx0s
echo sv-se^|b3d074c117afbf76d424e355b0eefb80c34ea471^|sv_windows_10_enterprise_2016_ltsb_x64_dvd_9060456^|vZysMUyuP9nbx0s
echo th-th^|ba1f3637bbb9b2fb9db5b89da1e7b49859653f21^|th_windows_10_enterprise_2016_ltsb_x64_dvd_9057403^|vZysMUyuP9nbx0s
echo tr-tr^|8f3d2fa16cf117333f31c8ed9e5faac6b8c98a5a^|tr_windows_10_enterprise_2016_ltsb_x64_dvd_9057891^|vZysMUyuP9nbx0s
echo uk-ua^|02984a127527c460866950f9abd47423b2cd32f3^|uk_windows_10_enterprise_2016_ltsb_x64_dvd_9058295^|vZysMUyuP9nbx0s
echo bg-bg^|490cf375517845ec6ee617bdd22e5141ac5dce17^|bg_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059366^|ngRgOwl6lmq6voD
echo cs-cz^|47d21b890a71e3249ffc35dc6cd19b42bc1f847e^|cs_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060130^|ngRgOwl6lmq6voD
echo da-dk^|e21c46a63bb8c76bda3f591b7abb091d7c463068^|da_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060468^|ngRgOwl6lmq6voD
echo de-de^|247cf1a10c8007aa46d4b42d3158b1087fa3ab0b^|de_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060124^|ngRgOwl6lmq6voD
echo el-gr^|723587ac4c312bef4d04a0e6b339bfd1ecda5dd9^|el_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060469^|ngRgOwl6lmq6voD
echo en-us^|b5d4911bd53ec5029781ade0937dad43c4ed90f6^|en_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057894^|ngRgOwl6lmq6voD
echo en-gb^|0629bf04aa2a61e125ee6eddf917db471dcb8535^|en-gb_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058303^|ngRgOwl6lmq6voD
echo es-es^|ec023d5231c4bce4a30a17017f959d463614ce46^|es_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058315^|ngRgOwl6lmq6voD
echo et-ee^|7d06a76f422e199de96da6602e171e3e5bbfce51^|et_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058798^|ngRgOwl6lmq6voD
echo fi-fi^|786fbefd3908f0cd2492a48bc4fe22aad7b39bc2^|fi_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059367^|ngRgOwl6lmq6voD
echo fr-fr^|60ee053fd95ee15360393fbee430895597fbe9d5^|fr_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059494^|ngRgOwl6lmq6voD
echo hr-hr^|69f6b0d1dfdb8f58a42048ede9e1d08a2d5764ad^|hr_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059491^|ngRgOwl6lmq6voD
echo hu-hu^|1a80f61019c45ce84acc2d2f1ee0ec79670122e4^|hu_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057423^|ngRgOwl6lmq6voD
echo it-it^|87f6bf28f2c8b9c2e3ed388112a697610d16fa61^|it_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057896^|ngRgOwl6lmq6voD
echo lt-lt^|3756bc657bc55268146b071d254908b714fe67b0^|lt_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058682^|ngRgOwl6lmq6voD
echo lv-lv^|b28f78663c993380631b6360cca57bbe58502093^|lv_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058309^|ngRgOwl6lmq6voD
echo nb-no^|098cb80d0f460d8b2fb0f5b26a3d7326d3f8da8d^|nb_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059373^|ngRgOwl6lmq6voD
echo nl-nl^|ba635603f7b5605c461d80c45c0ac1473167b3ae^|nl_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057420^|ngRgOwl6lmq6voD
echo pl-pl^|6291bd8efe5f107fa4835d13b7db46f19bce7821^|pl_windows_10_enterprise_2016_ltsb_n_x64_dvd_9059504^|ngRgOwl6lmq6voD
echo pt-pt^|7a6184d56a4f05fe62581dc6a4caea6e00509afd^|pp_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060157^|ngRgOwl6lmq6voD
echo ro-ro^|181c653da47aa43cb4e6da34744f791bdd4d9686^|ro_windows_10_enterprise_2016_ltsb_n_x64_dvd_9060481^|ngRgOwl6lmq6voD
echo sk-sk^|5f5b0ee5b966209c426b418edcd5858e1f40a388^|sk_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057427^|ngRgOwl6lmq6voD
echo sl-si^|501e28ba42e426bdf2c567f2004fcd53c1ae419c^|sl_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057900^|ngRgOwl6lmq6voD
echo sv-se^|ee0c27c75823b468b9c01d4a27bbbeebb8858c28^|sv_windows_10_enterprise_2016_ltsb_n_x64_dvd_9058812^|ngRgOwl6lmq6voD
echo ar-sa^|855d30f7d16a66e5b08c8994260cba3712ba41ea^|ar_windows_10_enterprise_2016_ltsb_x86_dvd_9060006^|vZysMUyuP9nbx0s
echo bg-bg^|2abe7814979f2e791adf9dab6cef179bea4b6659^|bg_windows_10_enterprise_2016_ltsb_x86_dvd_9060079^|vZysMUyuP9nbx0s
echo zh-cn^|0422052f25c9c8df983f3b287f725860aab907cf^|cn_windows_10_enterprise_2016_ltsb_x86_dvd_9057089^|vZysMUyuP9nbx0s
echo cs-cz^|6397757cc53f589fd0dd1569c408a7273b00e717^|cs_windows_10_enterprise_2016_ltsb_x86_dvd_9058253^|vZysMUyuP9nbx0s
echo zh-tw^|4801545465c9c8206c804cb8fd540ebb5f64586d^|ct_windows_10_enterprise_2016_ltsb_x86_dvd_9057437^|vZysMUyuP9nbx0s
echo da-dk^|4a0fdd819dfb007cbf2ae61ee4a27ae5e7993f02^|da_windows_10_enterprise_2016_ltsb_x86_dvd_9058895^|vZysMUyuP9nbx0s
echo de-de^|278d8ca01932995641b92c63a0f2c386a6d6b223^|de_windows_10_enterprise_2016_ltsb_x86_dvd_9058899^|vZysMUyuP9nbx0s
echo el-gr^|5d221ec361c7a249ea949fa624499e54126e814b^|el_windows_10_enterprise_2016_ltsb_x86_dvd_9059530^|vZysMUyuP9nbx0s
echo en-us^|45e72d02ff17125c699558719eb946d8e140c9cc^|en_windows_10_enterprise_2016_ltsb_x86_dvd_9060010^|vZysMUyuP9nbx0s
echo en-gb^|69e216382216dc661f6ebd34499e1b528794e431^|en-gb_windows_10_enterprise_2016_ltsb_x86_dvd_9060085^|vZysMUyuP9nbx0s
echo es-es^|79e29a7b43cb1be1780382fb27e3ace547c98af5^|es_windows_10_enterprise_2016_ltsb_x86_dvd_9060020^|vZysMUyuP9nbx0s
echo es-mx^|baf81746a7e4672fe45bdec023cfd7c75ce5f804^|es-mx_windows_10_enterprise_2016_ltsb_x86_dvd_9060090^|vZysMUyuP9nbx0s
echo et-ee^|255ecc72d0f3bcade98bb9a5496134c39db893ff^|et_windows_10_enterprise_2016_ltsb_x86_dvd_9057091^|vZysMUyuP9nbx0s
echo fi-fi^|bf0d506def3ed04ad91201d17271cec7d2342dff^|fi_windows_10_enterprise_2016_ltsb_x86_dvd_9057439^|vZysMUyuP9nbx0s
echo fr-fr^|fe6313cd4565709aa03e2bdc75edefe8dd8092cf^|fr_windows_10_enterprise_2016_ltsb_x86_dvd_9058127^|vZysMUyuP9nbx0s
echo fr-ca^|7ec8c8ff2c7d460aa6e0da3e93315b8830f54042^|fr-ca_windows_10_enterprise_2016_ltsb_x86_dvd_9058259^|vZysMUyuP9nbx0s
echo he-il^|8608afbeb579de8a042cfcdecfd51618b0818cef^|he_windows_10_enterprise_2016_ltsb_x86_dvd_9060012^|vZysMUyuP9nbx0s
echo hr-hr^|04490952844367181549366612706bf546f633de^|hr_windows_10_enterprise_2016_ltsb_x86_dvd_9058120^|vZysMUyuP9nbx0s
echo hu-hu^|25ff5e35c4d9ca121a44d06da5740a5c13c08ba3^|hu_windows_10_enterprise_2016_ltsb_x86_dvd_9060087^|vZysMUyuP9nbx0s
echo it-it^|7e74351341a1a1a86607159e995db25da980a6fc^|it_windows_10_enterprise_2016_ltsb_x86_dvd_9057094^|vZysMUyuP9nbx0s
echo ja-jp^|0b366029191cec32fd0d5c412ea3d79c3360c231^|ja_windows_10_enterprise_2016_ltsb_x86_dvd_9057438^|vZysMUyuP9nbx0s
echo ko-kr^|cf78038329850d24e5643547e9c07a235b5154d5^|ko_windows_10_enterprise_2016_ltsb_x86_dvd_9058162^|vZysMUyuP9nbx0s
echo lt-lt^|4d3275c90f03c3edec6e5454e4c521179f6fb21a^|lt_windows_10_enterprise_2016_ltsb_x86_dvd_9058906^|vZysMUyuP9nbx0s
echo lv-lv^|baa0eb0a779c8c42b95ed6a6dea54baa610f2e1a^|lv_windows_10_enterprise_2016_ltsb_x86_dvd_9058263^|vZysMUyuP9nbx0s
echo nb-no^|99ce15a36b0cd1aa339bb8aac668c641a83a8813^|nb_windows_10_enterprise_2016_ltsb_x86_dvd_9059535^|vZysMUyuP9nbx0s
echo nl-nl^|640a22cf2c1bd09be7ca5d4106cfb11826a55539^|nl_windows_10_enterprise_2016_ltsb_x86_dvd_9059526^|vZysMUyuP9nbx0s
echo pl-pl^|c20d947694cfde92d67c11d0e22b99c4d90dd41b^|pl_windows_10_enterprise_2016_ltsb_x86_dvd_9060015^|vZysMUyuP9nbx0s
echo pt-pt^|aeb373c14b51e2b162598cfc9360baa7b8b16f29^|pp_windows_10_enterprise_2016_ltsb_x86_dvd_9057097^|vZysMUyuP9nbx0s
echo pt-br^|d6bc701150e5d33656c9667b2958f74e2c914a65^|pt_windows_10_enterprise_2016_ltsb_x86_dvd_9060088^|vZysMUyuP9nbx0s
echo ro-ro^|ba0ecf66d69aac365f7532f039d9c5f6469f51d4^|ro_windows_10_enterprise_2016_ltsb_x86_dvd_9057443^|vZysMUyuP9nbx0s
echo ru-ru^|4d1762ea591e2394591a3aef83cc0c799c708325^|ru_windows_10_enterprise_2016_ltsb_x86_dvd_9058173^|vZysMUyuP9nbx0s
echo sk-sk^|893cd702060248b79485724fd96ba4e1671216b2^|sk_windows_10_enterprise_2016_ltsb_x86_dvd_9058908^|vZysMUyuP9nbx0s
echo sl-si^|01fa3c14831d7d5481b0cecd7e8ba2a0329a8de9^|sl_windows_10_enterprise_2016_ltsb_x86_dvd_9059531^|vZysMUyuP9nbx0s
echo sr-latn-rs^|c44e0ef0df4226b5809e2c9be1949e63ed0daecb^|sr-latn_windows_10_enterprise_2016_ltsb_x86_dvd_9058276^|vZysMUyuP9nbx0s
echo sv-se^|f44aa80c8787b7d778ee17d73d3d6d0d8c51d35f^|sv_windows_10_enterprise_2016_ltsb_x86_dvd_9057114^|vZysMUyuP9nbx0s
echo th-th^|f1d2b17dd646b1419835cb8a4b1b2838d3fdb31b^|th_windows_10_enterprise_2016_ltsb_x86_dvd_9057441^|vZysMUyuP9nbx0s
echo tr-tr^|ebe45d2c4c82b952c8c4b6385731175bbe15f8ed^|tr_windows_10_enterprise_2016_ltsb_x86_dvd_9058186^|vZysMUyuP9nbx0s
echo uk-ua^|ef7d9bfe857fb0f815fe151bc9ba18b3feb5de06^|uk_windows_10_enterprise_2016_ltsb_x86_dvd_9058286^|vZysMUyuP9nbx0s
echo bg-bg^|d2124498bbe4d73402499958e3da565fdb692bb7^|bg_windows_10_enterprise_2016_ltsb_n_x86_dvd_9059538^|ngRgOwl6lmq6voD
echo cs-cz^|cabc02668e17bdbb0954efcef8c93fbc41130614^|cs_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060092^|ngRgOwl6lmq6voD
echo da-dk^|bb0142b2db53836ac6ed9ef31df685dc469c1db9^|da_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057126^|ngRgOwl6lmq6voD
echo de-de^|f58ec330426de37f4334f1da6e31c53f3644e0ce^|de_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060093^|ngRgOwl6lmq6voD
echo el-gr^|23892b835b186e5a08435c8cdfcaeb34bcf5a513^|el_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057129^|ngRgOwl6lmq6voD
echo en-us^|3f8f9811a7e72adf88215060e38ba81340dfb0c0^|en_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058202^|ngRgOwl6lmq6voD
echo en-gb^|ccb563395202ab38e77e286d6089ecdb6ba08f4d^|en-gb_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058321^|ngRgOwl6lmq6voD
echo es-es^|0f2703fc6256e17c0c647533ead09d5ef0b2b7f2^|es_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058325^|ngRgOwl6lmq6voD
echo et-ee^|fe7a37ac1cc99b8c2bec59289a7b9969f6a2a39f^|et_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058913^|ngRgOwl6lmq6voD
echo fi-fi^|8457bc9c12d133a42fca67bffa90d596c5cf0931^|fi_windows_10_enterprise_2016_ltsb_n_x86_dvd_9059542^|ngRgOwl6lmq6voD
echo fr-fr^|38cd90eac1a22c519ac52fc89a0bec76765ada45^|fr_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060026^|ngRgOwl6lmq6voD
echo hr-hr^|2ac585c4d617b942e3f86ce9ab9b3f40d09f8371^|hr_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060025^|ngRgOwl6lmq6voD
echo hu-hu^|86062e77f574219adc65183390b5fa43d5e41281^|hu_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057447^|ngRgOwl6lmq6voD
echo it-it^|a9ed88486534c72a8f14b3f33d5297c5cd9ab180^|it_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058198^|ngRgOwl6lmq6voD
echo lt-lt^|b1d4279859f10bcf8da1f9a4b697594b89aef5f6^|lt_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058915^|ngRgOwl6lmq6voD
echo lv-lv^|622e42c37ecf0af87fc2ce102a905afd109bff84^|lv_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058320^|ngRgOwl6lmq6voD
echo nb-no^|6a75a8057f0227b4102f55892a7407f7002fcc08^|nb_windows_10_enterprise_2016_ltsb_n_x86_dvd_9059548^|ngRgOwl6lmq6voD
echo nl-nl^|4f7ce3fff7e65ccf98a7405752076f2ccddd5d5e^|nl_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057444^|ngRgOwl6lmq6voD
echo pl-pl^|2323483b4a31b5c94d0d1b002f99a797a065a1c1^|pl_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060028^|ngRgOwl6lmq6voD
echo pt-pt^|5e8b5dbcf354f3532d34f6d10538c70d00b3840c^|pp_windows_10_enterprise_2016_ltsb_n_x86_dvd_9060094^|ngRgOwl6lmq6voD
echo ro-ro^|bdaa945402cf9079342b1fc88e8123fb50350781^|ro_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057128^|ngRgOwl6lmq6voD
echo sk-sk^|517201a9c153078a26cf73673f5148730d12fffe^|sk_windows_10_enterprise_2016_ltsb_n_x86_dvd_9057448^|ngRgOwl6lmq6voD
echo sl-si^|ec6d293a0bdc4049eadcda539902e53eaebb0983^|sl_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058206^|ngRgOwl6lmq6voD
echo sv-se^|0dd88c34f4c77dfd136d1d4ebf383b8c20558912^|sv_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058917^|ngRgOwl6lmq6voD
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBLTSB2 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBLTSB2
>>database.LTSB2.smrt (
echo ar-sa^|6896af42de6149fe5caa1fa53463e56704d865d3^|ar_windows_10_enterprise_2015_ltsb_x64_dvd_6848420^|0yK5Mc8dUQsfqYx
echo bg-bg^|79475b9fb2395d6fa3a9981347d67192d92f14b2^|bg_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848303^|0yK5Mc8dUQsfqYx
echo bg-bg^|7d1d516c1618c8f54b958d1c27aefc7e9e700e81^|bg_windows_10_enterprise_2015_ltsb_x64_dvd_6848422^|0yK5Mc8dUQsfqYx
echo zh-cn^|179a95e6a498efe079fb1817d1adf5a3b7793b4d^|cn_windows_10_enterprise_2015_ltsb_x64_dvd_6848425^|0yK5Mc8dUQsfqYx
echo cs-cz^|14b5f8419519dc138a788c61e68ad9a567ea0a50^|cs_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848309^|0yK5Mc8dUQsfqYx
echo cs-cz^|83fea9a9554c259415757493e6a4ad510c422bf0^|cs_windows_10_enterprise_2015_ltsb_x64_dvd_6848435^|0yK5Mc8dUQsfqYx
echo da-dk^|8df01d4dec025fef3810b844d9405e2984294595^|da_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848311^|0yK5Mc8dUQsfqYx
echo da-dk^|9a8b2ca0fa7a28b1d2f02bc1d0cf10d96ae9269f^|da_windows_10_enterprise_2015_ltsb_x64_dvd_6848440^|0yK5Mc8dUQsfqYx
echo de-de^|28018fbddf21fa7e4dbd43254e802d21a313769d^|de_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848328^|0yK5Mc8dUQsfqYx
echo de-de^|98b17ea6442b2b3ed75733b6558c728d50999998^|de_windows_10_enterprise_2015_ltsb_x64_dvd_6848473^|0yK5Mc8dUQsfqYx
echo el-gr^|878afc018bce53f99932908f787601364b839776^|el_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848331^|0yK5Mc8dUQsfqYx
echo el-gr^|715643c685476e65675a1bad08104cb5fb83369b^|el_windows_10_enterprise_2015_ltsb_x64_dvd_6848475^|0yK5Mc8dUQsfqYx
echo en-us^|dbe728416545ea3e47fba05575e81ad0f595871f^|en_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848316^|0yK5Mc8dUQsfqYx
echo en-us^|264d48c902e6b586a1ed965062f7da4d4da99b35^|en_windows_10_enterprise_2015_ltsb_x64_dvd_6848446^|0yK5Mc8dUQsfqYx
echo en-gb^|53b25931f9d649377671764b1aebfa6d378617ab^|en-gb_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848318^|0yK5Mc8dUQsfqYx
echo en-gb^|6476e33d7f50e66a53b347db7a3aa953516ac8a0^|en-gb_windows_10_enterprise_2015_ltsb_x64_dvd_6848456^|0yK5Mc8dUQsfqYx
echo es-es^|4e841e72344bfd04127186d1a4d1a1d2e6731b23^|es_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848415^|0yK5Mc8dUQsfqYx
echo es-es^|5c4b04098dc68390105994376ed640370841a889^|es_windows_10_enterprise_2015_ltsb_x64_dvd_6850876^|0yK5Mc8dUQsfqYx
echo es-mx^|138eb7df5e85bdf66c54721a529ef2a6c0df69c8^|es-mx_windows_10_enterprise_2015_ltsb_x64_dvd_6850897^|0yK5Mc8dUQsfqYx
echo et-ee^|217cb886641fdddabf9cb4091f6deee565e609b6^|et_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848321^|0yK5Mc8dUQsfqYx
echo et-ee^|4b00fd52051741a952c9cc4cc58ec7dc57be3edf^|et_windows_10_enterprise_2015_ltsb_x64_dvd_6848458^|0yK5Mc8dUQsfqYx
echo fi-fi^|e608b71940a643b7d1fd134bf6e64bbd03c26fe3^|fi_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848323^|0yK5Mc8dUQsfqYx
echo fi-fi^|c3f89721e9b0a74d74f2afafd60fd9353db3e98a^|fi_windows_10_enterprise_2015_ltsb_x64_dvd_6848462^|0yK5Mc8dUQsfqYx
echo fr-fr^|d2732dfde95b75cc9b5b6e42146fa20220fff32b^|fr_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848326^|0yK5Mc8dUQsfqYx
echo fr-fr^|913132225dd1034c6c0a6733199791ffbd7745b8^|fr_windows_10_enterprise_2015_ltsb_x64_dvd_6848466^|0yK5Mc8dUQsfqYx
echo fr-ca^|5a6a3b7140f24393c784a8c842178583bf533bc0^|fr-ca_windows_10_enterprise_2015_ltsb_x64_dvd_6848470^|0yK5Mc8dUQsfqYx
echo he-il^|e6c2f2ae077ad8a5950e232a2c9dd13c7ec1057c^|he_windows_10_enterprise_2015_ltsb_x64_dvd_6848477^|0yK5Mc8dUQsfqYx
echo zh-hk^|fbae28acf7b70c2e4db4027b082d206863870248^|hk_windows_10_enterprise_2015_ltsb_x64_dvd_6848427^|0yK5Mc8dUQsfqYx
echo hr-hr^|f1018ff0aa05b4b7706a04d8672168a859f9c34b^|hr_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848306^|0yK5Mc8dUQsfqYx
echo hr-hr^|9f0936db7e8b76a6d0f521f8919de771696131a8^|hr_windows_10_enterprise_2015_ltsb_x64_dvd_6848433^|0yK5Mc8dUQsfqYx
echo hu-hu^|e7e0110df01c241e4626735b49800b08f2c94a96^|hu_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848333^|0yK5Mc8dUQsfqYx
echo hu-hu^|75deeb443cb49e76fa1f1cca7fa3f29b40080f9c^|hu_windows_10_enterprise_2015_ltsb_x64_dvd_6850770^|0yK5Mc8dUQsfqYx
echo it-it^|6ec67484192c17c6fff2c66981d2168634a5a64a^|it_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848335^|0yK5Mc8dUQsfqYx
echo it-it^|dbdeea72e324364c178d8413b606487574aeed77^|it_windows_10_enterprise_2015_ltsb_x64_dvd_6850772^|0yK5Mc8dUQsfqYx
echo ja-jp^|2f047b2a724c63066231161afdc3e46d7737a1c7^|ja_windows_10_enterprise_2015_ltsb_x64_dvd_6850774^|0yK5Mc8dUQsfqYx
echo ko-kr^|65b8c10029840c65da19f436f1f9d317a53a3e82^|ko_windows_10_enterprise_2015_ltsb_kn_x64_dvd_6848338^|0yK5Mc8dUQsfqYx
echo ko-kr^|aa1a2db1541ce292b558580decc27f7c96e7a8fe^|ko_windows_10_enterprise_2015_ltsb_x64_dvd_6850776^|0yK5Mc8dUQsfqYx
echo lt-lt^|6bab6b6ee949b19d11455751eb01e58e6194fb55^|lt_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848352^|0yK5Mc8dUQsfqYx
echo lt-lt^|101c0e40582552c8469e9adb93062bc69fc2c551^|lt_windows_10_enterprise_2015_ltsb_x64_dvd_6850780^|0yK5Mc8dUQsfqYx
echo lv-lv^|c181ba8e96f270b40d7eb5534a61cb5c4774935a^|lv_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848340^|0yK5Mc8dUQsfqYx
echo lv-lv^|9c8851b7bdf2e3f9a4a0b7c67988156231c8d986^|lv_windows_10_enterprise_2015_ltsb_x64_dvd_6850778^|0yK5Mc8dUQsfqYx
echo nb-no^|a7e321e678f0d9b26ac114130d5bec7b987ddecc^|nb_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848379^|0yK5Mc8dUQsfqYx
echo nb-no^|05e8f2421979e71a1fd53af1130ebc3c2aeac966^|nb_windows_10_enterprise_2015_ltsb_x64_dvd_6850782^|0yK5Mc8dUQsfqYx
echo nl-nl^|a24775702d35657e6f5e42bb52fbd96f8c420663^|nl_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848314^|0yK5Mc8dUQsfqYx
echo nl-nl^|7fc6a594b50dc7e18804478b103bca840aabbb6d^|nl_windows_10_enterprise_2015_ltsb_x64_dvd_6848442^|0yK5Mc8dUQsfqYx
echo pl-pl^|49223ca44f237a345b1dc3c67fbb155cbec01b76^|pl_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848390^|0yK5Mc8dUQsfqYx
echo pl-pl^|59c269cc931c046993a6e5e997850d726363c205^|pl_windows_10_enterprise_2015_ltsb_x64_dvd_6850784^|0yK5Mc8dUQsfqYx
echo pt-pt^|4647f7691373e07505a5b3fa8e15dd4a39b6d266^|pp_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848402^|0yK5Mc8dUQsfqYx
echo pt-pt^|2f205b7a48230bc99f0a4017c0e8d64e6d27cd33^|pp_windows_10_enterprise_2015_ltsb_x64_dvd_6850808^|0yK5Mc8dUQsfqYx
echo pt-br^|e971c1f52697ee2a202197ee52438e4a961c5f27^|pt_windows_10_enterprise_2015_ltsb_x64_dvd_6850787^|0yK5Mc8dUQsfqYx
echo ro-ro^|7ceca01799f9a7b43934217dcd38d8c27440890b^|ro_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848409^|0yK5Mc8dUQsfqYx
echo ro-ro^|13d6765b1506ce0cb6ca9ff8e09c6feeb71f4e24^|ro_windows_10_enterprise_2015_ltsb_x64_dvd_6850828^|0yK5Mc8dUQsfqYx
echo ru-ru^|7c2fce906403a5ee1b8f505baef17da7fe4c30a7^|ru_windows_10_enterprise_2015_ltsb_x64_dvd_6850847^|0yK5Mc8dUQsfqYx
echo sk-sk^|b1292d6557063cc5264a028fa44aa54e59e1f100^|sk_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848411^|0yK5Mc8dUQsfqYx
echo sk-sk^|07cee1989ed7b36e21669562b02af60b571e567b^|sk_windows_10_enterprise_2015_ltsb_x64_dvd_6850870^|0yK5Mc8dUQsfqYx
echo sl-si^|2ba56a4c228fcb7b76d572bdb434343e8cd24503^|sl_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848413^|0yK5Mc8dUQsfqYx
echo sl-si^|33e4a12f0bb8a4567913698826c2126ae5291956^|sl_windows_10_enterprise_2015_ltsb_x64_dvd_6850872^|0yK5Mc8dUQsfqYx
echo sr-latn-rs^|5383b4c5fc055ddf00207b882b123df8213eda9e^|sr-latn_windows_10_enterprise_2015_ltsb_x64_dvd_6850868^|0yK5Mc8dUQsfqYx
echo sv-se^|7778de4d4b683c92bf141d77c0de41a163883fba^|sv_windows_10_enterprise_2015_ltsb_n_x64_dvd_6848418^|0yK5Mc8dUQsfqYx
echo sv-se^|3da8c3485338cba5c04a2c1cdef09efa8d123fda^|sv_windows_10_enterprise_2015_ltsb_x64_dvd_6850899^|0yK5Mc8dUQsfqYx
echo th-th^|552669d8e58fd3bc5f97434a0411fbcb896c310a^|th_windows_10_enterprise_2015_ltsb_x64_dvd_6850901^|0yK5Mc8dUQsfqYx
echo tr-tr^|19af78e698d095bd05d03e0fda30c2ef964df5da^|tr_windows_10_enterprise_2015_ltsb_x64_dvd_6850904^|0yK5Mc8dUQsfqYx
echo zh-tw^|9b923067628e9647c4d2f54cfec7927a2fee9144^|tw_windows_10_enterprise_2015_ltsb_x64_dvd_6848430^|0yK5Mc8dUQsfqYx
echo uk-ua^|a207725aaa68b3ac419c8f86997750c7d174392a^|uk_windows_10_enterprise_2015_ltsb_x64_dvd_6850925^|0yK5Mc8dUQsfqYx
echo ar-sa^|cde5fb3b2bf1c359db3afae5702bd13cc88132ff^|ar_windows_10_enterprise_2015_ltsb_x86_dvd_6848421^|0yK5Mc8dUQsfqYx
echo bg-bg^|aa4b0e300b27270b257b8705af1e95d04bed7ce0^|bg_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848305^|0yK5Mc8dUQsfqYx
echo bg-bg^|807d98923780b4c8e27f64e184069727dfb0f009^|bg_windows_10_enterprise_2015_ltsb_x86_dvd_6848424^|0yK5Mc8dUQsfqYx
echo zh-cn^|b0181d56b7c699890b69a21e77eda40884f3cf24^|cn_windows_10_enterprise_2015_ltsb_x86_dvd_6848426^|0yK5Mc8dUQsfqYx
echo cs-cz^|0f6a7e85725f6425f5e1ebcb2b58b8d6a59a9179^|cs_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848310^|0yK5Mc8dUQsfqYx
echo cs-cz^|ec126dce8ec7ba2a7148ea689d4e64d047b6812b^|cs_windows_10_enterprise_2015_ltsb_x86_dvd_6848437^|0yK5Mc8dUQsfqYx
echo da-dk^|ac7c215628e694a4df3bdee1e90babde5232a197^|da_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848313^|0yK5Mc8dUQsfqYx
echo da-dk^|01e88830ef0d20df775a315662407f32b0493ddc^|da_windows_10_enterprise_2015_ltsb_x86_dvd_6848441^|0yK5Mc8dUQsfqYx
echo de-de^|5d7975282fa5cfc3925c5242d831b71dc03e9f1b^|de_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848329^|0yK5Mc8dUQsfqYx
echo de-de^|3159dc8815ce1691f2e96f5bfc8ad1c7e726f43c^|de_windows_10_enterprise_2015_ltsb_x86_dvd_6848474^|0yK5Mc8dUQsfqYx
echo el-gr^|40d305173d8658f4ac078f3d0d990b2e31644f53^|el_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848332^|0yK5Mc8dUQsfqYx
echo el-gr^|b86de2de1b8aaf1d8c11c766e0b7588d8a45cad7^|el_windows_10_enterprise_2015_ltsb_x86_dvd_6848476^|0yK5Mc8dUQsfqYx
echo en-us^|e9e214f128ed325cba8782ce1946727807340c8b^|en_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848317^|0yK5Mc8dUQsfqYx
echo en-us^|abe400ad86c604197a3b163e31afcc1b7c53325e^|en_windows_10_enterprise_2015_ltsb_x86_dvd_6848454^|0yK5Mc8dUQsfqYx
echo en-gb^|57f01c1aa4cac11d2b8d6a587a0f0fdcc2447df7^|en-gb_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848319^|0yK5Mc8dUQsfqYx
echo en-gb^|3ecdc3d9cc6fbf06b6762e175bd3a27f1223f1b8^|en-gb_windows_10_enterprise_2015_ltsb_x86_dvd_6848457^|0yK5Mc8dUQsfqYx
echo es-es^|fde3ab6fca7596e877f6c2e39e1e5ef6bc8d36cf^|es_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848416^|0yK5Mc8dUQsfqYx
echo es-es^|0711a6e6d4366144aaa32939004d2485a2eec48d^|es_windows_10_enterprise_2015_ltsb_x86_dvd_6850896^|0yK5Mc8dUQsfqYx
echo es-mx^|662edf3fc5bced6f370b89a0956f94c70b8efe43^|es-mx_windows_10_enterprise_2015_ltsb_x86_dvd_6850898^|0yK5Mc8dUQsfqYx
echo et-ee^|ca262cb9b9e81b16e82d68211f1128060ec5dab9^|et_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848322^|0yK5Mc8dUQsfqYx
echo et-ee^|3078f04d394fc364b1743065cceb957b22dc1766^|et_windows_10_enterprise_2015_ltsb_x86_dvd_6848460^|0yK5Mc8dUQsfqYx
echo fi-fi^|f81707f214c29778de8c987cf567289a2f0b1bd9^|fi_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848325^|0yK5Mc8dUQsfqYx
echo fi-fi^|5d7b006f48d096ebb7844dc0fd0740a91ecf9744^|fi_windows_10_enterprise_2015_ltsb_x86_dvd_6848464^|0yK5Mc8dUQsfqYx
echo fr-fr^|077f0e84d962625d5fdadce79087d2394a59b67e^|fr_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848327^|0yK5Mc8dUQsfqYx
echo fr-fr^|fa082aa2b619e152c0f3606199c951c95924c6ca^|fr_windows_10_enterprise_2015_ltsb_x86_dvd_6848468^|0yK5Mc8dUQsfqYx
echo fr-ca^|27a723f23b62562b7ceebf7608536ec5cb66dc09^|fr-ca_windows_10_enterprise_2015_ltsb_x86_dvd_6848472^|0yK5Mc8dUQsfqYx
echo he-il^|41e3e06548c67e77ef31625b7756353f0a98812b^|he_windows_10_enterprise_2015_ltsb_x86_dvd_6850760^|0yK5Mc8dUQsfqYx
echo zh-hk^|b6298935d551f46d52c95a119eaf780fa9c637d8^|hk_windows_10_enterprise_2015_ltsb_x86_dvd_6848428^|0yK5Mc8dUQsfqYx
echo hr-hr^|439132e8701f96ec5721723628457ad550b40f11^|hr_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848307^|0yK5Mc8dUQsfqYx
echo hr-hr^|9a418ede1feeea6c9c675648a8da9cdcc3446f5c^|hr_windows_10_enterprise_2015_ltsb_x86_dvd_6848434^|0yK5Mc8dUQsfqYx
echo hu-hu^|4c2ed1a958a8b5d3e00c9bdfd0d92a0092c1d217^|hu_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848334^|0yK5Mc8dUQsfqYx
echo hu-hu^|e178f90ff4ef0caf1a580ae1f3e848938dc9929d^|hu_windows_10_enterprise_2015_ltsb_x86_dvd_6850771^|0yK5Mc8dUQsfqYx
echo it-it^|d9a9dedd6cce3309744a0185757bb47f4065c79e^|it_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848336^|0yK5Mc8dUQsfqYx
echo it-it^|d9de20277998c5ce98fc00e11d7ffed6fb0f0ee6^|it_windows_10_enterprise_2015_ltsb_x86_dvd_6850773^|0yK5Mc8dUQsfqYx
echo ja-jp^|91a37a009f58111f16c6a2e53f2b8510007c7a18^|ja_windows_10_enterprise_2015_ltsb_x86_dvd_6850775^|0yK5Mc8dUQsfqYx
echo ko-kr^|6ad8e8b96313f4622a7dadd6064409bbb47b87d4^|ko_windows_10_enterprise_2015_ltsb_kn_x86_dvd_6848339^|0yK5Mc8dUQsfqYx
echo ko-kr^|43c9f67538508dffc07f71fe403d82124c9a19b9^|ko_windows_10_enterprise_2015_ltsb_x86_dvd_6850777^|0yK5Mc8dUQsfqYx
echo lt-lt^|22a8544597253c1416d4135357496028502d88e8^|lt_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848369^|0yK5Mc8dUQsfqYx
echo lt-lt^|d34755bf0175cb1146b66e45c1fab09458c82d90^|lt_windows_10_enterprise_2015_ltsb_x86_dvd_6850781^|0yK5Mc8dUQsfqYx
echo lv-lv^|862a32f52b3b0bde43550796a3656db9dd2f418a^|lv_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848343^|0yK5Mc8dUQsfqYx
echo lv-lv^|3610fe0f86448fc1077b60670c8d281466c2b2a7^|lv_windows_10_enterprise_2015_ltsb_x86_dvd_6850779^|0yK5Mc8dUQsfqYx
echo nb-no^|57176b1b26e5651beeee7a9cac3ae931e6acfc6a^|nb_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848384^|0yK5Mc8dUQsfqYx
echo nb-no^|c55f089105d7a121506f333493f14bd9cc6c72d1^|nb_windows_10_enterprise_2015_ltsb_x86_dvd_6850783^|0yK5Mc8dUQsfqYx
echo nl-nl^|36e92b6120b5b963053f0ffeb4717540765c3af3^|nl_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848315^|0yK5Mc8dUQsfqYx
echo nl-nl^|d7b19a29c10343a5076afe40058226295ab7d687^|nl_windows_10_enterprise_2015_ltsb_x86_dvd_6848443^|0yK5Mc8dUQsfqYx
echo pl-pl^|ce5be728b758943b01c803a0c4a9200023019b71^|pl_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848395^|0yK5Mc8dUQsfqYx
echo pl-pl^|b6684d87284ac02e6dc9dd6f0b08086752b740f2^|pl_windows_10_enterprise_2015_ltsb_x86_dvd_6850785^|0yK5Mc8dUQsfqYx
echo pt-pt^|10ad28a5197f27a03cc6d1d7fef8aafba3ac3241^|pp_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848406^|0yK5Mc8dUQsfqYx
echo pt-pt^|f0a5cb060269e09a9443479aacab3a86e14a558c^|pp_windows_10_enterprise_2015_ltsb_x86_dvd_6850818^|0yK5Mc8dUQsfqYx
echo pt-br^|8e73568912f4b96b95cc0b4feb1d5cd69b30460b^|pt_windows_10_enterprise_2015_ltsb_x86_dvd_6850798^|0yK5Mc8dUQsfqYx
echo ro-ro^|67ea6f01408abfba67f9e960b627340c55317d70^|ro_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848410^|0yK5Mc8dUQsfqYx
echo ro-ro^|fe6052eccc3a58b7b3556f93c0e0e8a7be521717^|ro_windows_10_enterprise_2015_ltsb_x86_dvd_6850837^|0yK5Mc8dUQsfqYx
echo ru-ru^|a428c5e2e89c95ffcdd13d22c72d9feef3793f56^|ru_windows_10_enterprise_2015_ltsb_x86_dvd_6850858^|0yK5Mc8dUQsfqYx
echo sk-sk^|52b445cc761d9dbc857d9101831e6e642d1c7546^|sk_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848412^|0yK5Mc8dUQsfqYx
echo sk-sk^|632ed27433628357b8bc91c2591119b7250bf662^|sk_windows_10_enterprise_2015_ltsb_x86_dvd_6850871^|0yK5Mc8dUQsfqYx
echo sl-si^|73079a3e5f10ce46da496a0fa5a0b80184db9582^|sl_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848414^|0yK5Mc8dUQsfqYx
echo sl-si^|c91984321fecf318a749880fa73bc9d5ca81214c^|sl_windows_10_enterprise_2015_ltsb_x86_dvd_6850873^|0yK5Mc8dUQsfqYx
echo sr-latn-rs^|866b9d249c0013842c928861e9911437a85a9e58^|sr-latn_windows_10_enterprise_2015_ltsb_x86_dvd_6850869^|0yK5Mc8dUQsfqYx
echo sv-se^|a7b1e5555f68b87537eabbafec490d24981ed154^|sv_windows_10_enterprise_2015_ltsb_n_x86_dvd_6848419^|0yK5Mc8dUQsfqYx
echo sv-se^|f8a133eb5561534e5ddfadb17aa9628bc9bc9546^|sv_windows_10_enterprise_2015_ltsb_x86_dvd_6850900^|0yK5Mc8dUQsfqYx
echo th-th^|a6ee0be6d20c19a11d6656513373bdfc24eaf736^|th_windows_10_enterprise_2015_ltsb_x86_dvd_6850902^|0yK5Mc8dUQsfqYx
echo tr-tr^|f815dd9601e12d2e07aafc045de812bbc68de319^|tr_windows_10_enterprise_2015_ltsb_x86_dvd_6850915^|0yK5Mc8dUQsfqYx
echo zh-tw^|74700186832f0dbf14661945f5fdecf147e5795e^|tw_windows_10_enterprise_2015_ltsb_x86_dvd_6848432^|0yK5Mc8dUQsfqYx
echo uk-ua^|cf908277723ceb01be874f1837d6ab74365f13fb^|uk_windows_10_enterprise_2015_ltsb_x86_dvd_6850935^|0yK5Mc8dUQsfqYx
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBLTSB3 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBLTSB3
>>database.LTSB3.smrt (
echo ar-sa^|d3ce6d62e1ef8f06240acac85929a5b91b45a454^|ar_windows_10_enterprise_ltsc_2019_x64_dvd_3e37e487^|lxfcy5TzwilGdyu
echo ar-sa^|b1d40e561924f78d2fb78044b2bf71cf2dd0ea7e^|ar_windows_10_enterprise_ltsc_2019_x86_dvd_c5368318^|lxfcy5TzwilGdyu
echo bg-bg^|f73d95f486c63d8486482ca34da9cf6766a0a61f^|bg_windows_10_enterprise_ltsc_2019_x64_dvd_d36fcb33^|lxfcy5TzwilGdyu
echo bg-bg^|136226cdc8d6f34015bb41d15d93222ccb2a217c^|bg_windows_10_enterprise_ltsc_2019_x86_dvd_7e15939e^|lxfcy5TzwilGdyu
echo cs-cz^|92293aeecf652d97e5060edcb7ae41f6bc3fa4c9^|cs_windows_10_enterprise_ltsc_2019_x64_dvd_e323fd84^|lxfcy5TzwilGdyu
echo cs-cz^|7d2b6771d8a379bbb861118b3feac5a6d8c8ce31^|cs_windows_10_enterprise_ltsc_2019_x86_dvd_4b80f828^|lxfcy5TzwilGdyu
echo da-dk^|ca38ff0f8320d4a3fabb39b433fb1de08779df38^|da_windows_10_enterprise_ltsc_2019_x64_dvd_6d5cd451^|lxfcy5TzwilGdyu
echo da-dk^|86850cff9c0daa205314cb3304428efec239c06d^|da_windows_10_enterprise_ltsc_2019_x86_dvd_0ec4b329^|lxfcy5TzwilGdyu
echo de-de^|98191710cf349f544b7f3802f50845188dff951a^|de_windows_10_enterprise_ltsc_2019_x64_dvd_02e3955a^|lxfcy5TzwilGdyu
echo de-de^|210ab0749d144562ec4dc3fc907578439fc9a7f6^|de_windows_10_enterprise_ltsc_2019_x86_dvd_000e9a1b^|lxfcy5TzwilGdyu
echo el-gr^|4c90a87553d8efeb26dfe07d620985d7601db2a6^|el_windows_10_enterprise_ltsc_2019_x64_dvd_d5a29846^|lxfcy5TzwilGdyu
echo el-gr^|2d6b6443e292e25d45cd750a0502be3b5fb54d6f^|el_windows_10_enterprise_ltsc_2019_x86_dvd_b7b4d78a^|lxfcy5TzwilGdyu
echo en-gb^|c6abd34f04a51393825b6c700179c0eed61c944a^|en-gb_windows_10_enterprise_ltsc_2019_x64_dvd_cd49b901^|lxfcy5TzwilGdyu
echo en-gb^|0ceae4d33f0fa0328c2e49f3d8b553a3172156e6^|en-gb_windows_10_enterprise_ltsc_2019_x86_dvd_13a67815^|lxfcy5TzwilGdyu
echo en-us^|0b8476eff31f957590ade6fe671f16161037d3f6^|en_windows_10_enterprise_ltsc_2019_x64_dvd_74865958^|lxfcy5TzwilGdyu
echo en-us^|a935986f5a84af94fce423c0a6bdd2f743e5b92d^|en_windows_10_enterprise_ltsc_2019_x86_dvd_97449f83^|lxfcy5TzwilGdyu
echo es-es^|cb68e9a22d2c79c44387ea94d7e7bedb3e997ce7^|es_windows_10_enterprise_ltsc_2019_x64_dvd_e94f898f^|lxfcy5TzwilGdyu
echo es-es^|c81cb44ad55e88ac28057696cda6f6203afe6bad^|es_windows_10_enterprise_ltsc_2019_x86_dvd_b0f6388a^|lxfcy5TzwilGdyu
echo es-mx^|5985bdf386eeb2f0216fa768ab9dc3bde3077395^|es-mx_windows_10_enterprise_ltsc_2019_x64_dvd_6af93e60^|lxfcy5TzwilGdyu
echo es-mx^|b427bbbc138068b76630fe8804ad65c03fade913^|es-mx_windows_10_enterprise_ltsc_2019_x86_dvd_55ef7eee^|lxfcy5TzwilGdyu
echo et-ee^|cea2d08d438a65aaf21de0176c04fda20cd7a027^|et_windows_10_enterprise_ltsc_2019_x64_dvd_6207d722^|lxfcy5TzwilGdyu
echo et-ee^|e4b67f600b57e2812a365b58be666c432ddf633f^|et_windows_10_enterprise_ltsc_2019_x86_dvd_4720d4e6^|lxfcy5TzwilGdyu
echo fi-fi^|caf27a02e64f1a8ba7e8ff0c17064b658f064bf5^|fi_windows_10_enterprise_ltsc_2019_x64_dvd_a53ce04e^|lxfcy5TzwilGdyu
echo fi-fi^|3066c54b57ced428c685f26f3bc8119e0a4a8d39^|fi_windows_10_enterprise_ltsc_2019_x86_dvd_40841a40^|lxfcy5TzwilGdyu
echo fr-ca^|8995b4fab8afc4b8a21c92e3301804d73203f1ae^|fr-ca_windows_10_enterprise_ltsc_2019_x64_dvd_80e7bb5a^|lxfcy5TzwilGdyu
echo fr-ca^|5ef037dcf38a6c42393d61d6e6926447e4d9047c^|fr-ca_windows_10_enterprise_ltsc_2019_x86_dvd_47e5f795^|lxfcy5TzwilGdyu
echo fr-fr^|3253d69f61b97482737e23c2d41acf387cd5a03a^|fr_windows_10_enterprise_ltsc_2019_x64_dvd_5fe6b360^|lxfcy5TzwilGdyu
echo fr-fr^|c7302ebd7778956242f979f823c6eb2c8fbd8d4c^|fr_windows_10_enterprise_ltsc_2019_x86_dvd_eb73ef44^|lxfcy5TzwilGdyu
echo he-il^|a54ef55fa92b034d492bc580d13750f7b2a43654^|he_windows_10_enterprise_ltsc_2019_x64_dvd_2b9a413b^|lxfcy5TzwilGdyu
echo he-il^|e7932d479485f288fe9ca5e1e8ca7ca82105bb7d^|he_windows_10_enterprise_ltsc_2019_x86_dvd_db900652^|lxfcy5TzwilGdyu
echo hr-hr^|0d480bd8ba785688dbab3342abcbe98e98612b0b^|hr_windows_10_enterprise_ltsc_2019_x64_dvd_ab5beb9a^|lxfcy5TzwilGdyu
echo hr-hr^|3a1a3d359a52c04d0a7c8cb161d26e6d297a0e82^|hr_windows_10_enterprise_ltsc_2019_x86_dvd_59958d29^|lxfcy5TzwilGdyu
echo hu-hu^|d62eb63883babd31d89d7213ff59834247349307^|hu_windows_10_enterprise_ltsc_2019_x64_dvd_134fe4a3^|lxfcy5TzwilGdyu
echo hu-hu^|58ce7d6c07d039bd853871b92ee677fa9c81d5bb^|hu_windows_10_enterprise_ltsc_2019_x86_dvd_6644ef51^|lxfcy5TzwilGdyu
echo it-it^|dafe5ea805a8cad94cbf36ede728b01fcfe6bd8b^|it_windows_10_enterprise_ltsc_2019_x64_dvd_2fa02691^|lxfcy5TzwilGdyu
echo it-it^|522a77d6084a8066ba6297e4c664675dabe2adc6^|it_windows_10_enterprise_ltsc_2019_x86_dvd_12f58cc6^|lxfcy5TzwilGdyu
echo ja-jp^|6d17c2be54f91399865fd1d996084dee949fc645^|ja_windows_10_enterprise_ltsc_2019_x64_dvd_df74d1a7^|lxfcy5TzwilGdyu
echo ja-jp^|6c302fe901b9c80d5cd78ba9469d705e7a225cde^|ja_windows_10_enterprise_ltsc_2019_x86_dvd_930f37b8^|lxfcy5TzwilGdyu
echo ko-kr^|86dfbd74c2f73e68f89f801c9d89fe3e42585c31^|ko_windows_10_enterprise_ltsc_2019_x64_dvd_09f5a038^|lxfcy5TzwilGdyu
echo ko-kr^|d9a627a03510be84f2ed8544c6ceeea6a676eab9^|ko_windows_10_enterprise_ltsc_2019_x86_dvd_2906297d^|lxfcy5TzwilGdyu
echo lt-lt^|323193c233f9cf433e744bfb755853f50c98f771^|lt_windows_10_enterprise_ltsc_2019_x64_dvd_7d317b48^|lxfcy5TzwilGdyu
echo lt-lt^|96779b88fb24ad9480eebe45df2eb72400b51e27^|lt_windows_10_enterprise_ltsc_2019_x86_dvd_cebf1448^|lxfcy5TzwilGdyu
echo lv-lv^|ab4035ba9f9364bce287fb065157bfbda6e02858^|lv_windows_10_enterprise_ltsc_2019_x64_dvd_46018f3f^|lxfcy5TzwilGdyu
echo lv-lv^|09d1b21389af7537d35005b3d375ee9e386c3415^|lv_windows_10_enterprise_ltsc_2019_x86_dvd_e00aeee5^|lxfcy5TzwilGdyu
echo nb-no^|96cb8da62ab178cfe3d4b2783771fb81b4abc9f8^|nb_windows_10_enterprise_ltsc_2019_x64_dvd_cbf12aac^|lxfcy5TzwilGdyu
echo nb-no^|db6a0f180fdd1edb91e5447a21432b2ed95c0c62^|nb_windows_10_enterprise_ltsc_2019_x86_dvd_f0a2bc17^|lxfcy5TzwilGdyu
echo nl-nl^|92c4de2e5be51de1ea8437177c122a0a558d999c^|nl_windows_10_enterprise_ltsc_2019_x64_dvd_031a2076^|lxfcy5TzwilGdyu
echo nl-nl^|2ad3ec3949d2be1f70a9f5a83fc158f502139789^|nl_windows_10_enterprise_ltsc_2019_x86_dvd_8e3f8670^|lxfcy5TzwilGdyu
echo pl-pl^|b036e0a1208507bf00d073adea01a9fa6740080c^|pl_windows_10_enterprise_ltsc_2019_x64_dvd_95779877^|lxfcy5TzwilGdyu
echo pl-pl^|bddae3e8692e8d778d2a47db1da03e6047408ca6^|pl_windows_10_enterprise_ltsc_2019_x86_dvd_d95f58d5^|lxfcy5TzwilGdyu
echo pt-br^|30a32617678161d1f6a57b48ad4e5d42b2a07928^|pt_windows_10_enterprise_ltsc_2019_x64_dvd_3e7f778a^|lxfcy5TzwilGdyu
echo pt-br^|a46ce93d4cf2b6abca96c69b42f8b6a1c90de95b^|pt_windows_10_enterprise_ltsc_2019_x86_dvd_193e121c^|lxfcy5TzwilGdyu
echo pt-pt^|624cef3a8ea1fffaf35e501fec2aa79556278b08^|pp_windows_10_enterprise_ltsc_2019_x64_dvd_888e368c^|lxfcy5TzwilGdyu
echo pt-pt^|8f9e6d794fb851dcfc8e1bdf2a367408de279c73^|pp_windows_10_enterprise_ltsc_2019_x86_dvd_e20badc3^|lxfcy5TzwilGdyu
echo ro-ro^|9618d8329fd5fac2696dd53bd1a3fc5711410c3f^|ro_windows_10_enterprise_ltsc_2019_x64_dvd_f2192606^|lxfcy5TzwilGdyu
echo ro-ro^|a689ff8007d1150b7cf02ee1cc46be5af0387bdd^|ro_windows_10_enterprise_ltsc_2019_x86_dvd_442dd919^|lxfcy5TzwilGdyu
echo ru-ru^|e31b7ca70d32d5df1900f4ea0b66d837cd374763^|ru_windows_10_enterprise_ltsc_2019_x64_dvd_9aef5d46^|lxfcy5TzwilGdyu
echo ru-ru^|909fe1bc41aeb93508fe4ecde34780a53f9b8bf3^|ru_windows_10_enterprise_ltsc_2019_x86_dvd_bbe85ffd^|lxfcy5TzwilGdyu
echo sr-latn-rs^|98f3230bba41134e15743a7c536e84322cda2ab6^|sr-latn_windows_10_enterprise_ltsc_2019_x64_dvd_655d5080^|lxfcy5TzwilGdyu
echo sr-latn-rs^|8372fdc646d4c7b13c3df23a88319e0fc0e75d9e^|sr-latn_windows_10_enterprise_ltsc_2019_x86_dvd_05d7f6f2^|lxfcy5TzwilGdyu
echo sk-sk^|1be1bef93c57d14a10581ea22e45cd617a7fd9eb^|sk_windows_10_enterprise_ltsc_2019_x64_dvd_1e7b6894^|lxfcy5TzwilGdyu
echo sk-sk^|95d2169e51cff1a3a4c3c83699c25072501dedc4^|sk_windows_10_enterprise_ltsc_2019_x86_dvd_c4969d7c^|lxfcy5TzwilGdyu
echo sl-si^|0779ad4c923e0c4a5573dd74f7323c9fd403b386^|sl_windows_10_enterprise_ltsc_2019_x64_dvd_a8159150^|lxfcy5TzwilGdyu
echo sl-si^|8765095d05c9a07878dc521723368d7fa5cfc90e^|sl_windows_10_enterprise_ltsc_2019_x86_dvd_841f11ff^|lxfcy5TzwilGdyu
echo sv-se^|322b064fba7f1511796d23b81a656a0f58ca7020^|sv_windows_10_enterprise_ltsc_2019_x64_dvd_df8faa90^|lxfcy5TzwilGdyu
echo sv-se^|ac07d6a362d293fef13d463a10e7da510a2a0f40^|sv_windows_10_enterprise_ltsc_2019_x86_dvd_3d4776c0^|lxfcy5TzwilGdyu
echo th-th^|628f48827c3a50a757b5a086229b3a72ef207f77^|th_windows_10_enterprise_ltsc_2019_x64_dvd_c0300ce5^|lxfcy5TzwilGdyu
echo th-th^|1fff348bccefd3f29631e956b5eb79d2e52340ef^|th_windows_10_enterprise_ltsc_2019_x86_dvd_7f6f3b85^|lxfcy5TzwilGdyu
echo tr-tr^|bb4a2e04e875ae66da8826f8e230ccec0f3af242^|tr_windows_10_enterprise_ltsc_2019_x64_dvd_cdd54ad3^|lxfcy5TzwilGdyu
echo tr-tr^|716817fc7ef01f3992f9ef7100a6670dfb5e840c^|tr_windows_10_enterprise_ltsc_2019_x86_dvd_ad66b403^|lxfcy5TzwilGdyu
echo uk-ua^|9d2f69dd2a9497dade058676f0c305fee6123ae2^|uk_windows_10_enterprise_ltsc_2019_x64_dvd_ba0f310a^|lxfcy5TzwilGdyu
echo uk-ua^|70c17b0310c9a294051d24b054c14fc837a3e4c5^|uk_windows_10_enterprise_ltsc_2019_x86_dvd_00360a79^|lxfcy5TzwilGdyu
echo zh-cn^|e04252542aeb494464ad9231f4f2e2c021eab2ec^|cn_windows_10_enterprise_ltsc_2019_x64_dvd_2efc9ac2^|lxfcy5TzwilGdyu
echo zh-cn^|37cd47e5b0e28ace85672dc6731b58fe7539f84b^|cn_windows_10_enterprise_ltsc_2019_x86_dvd_2908ee10^|lxfcy5TzwilGdyu
echo zh-tw^|bb8495178de9f8fea2170ca891f40c02ef126049^|ct_windows_10_enterprise_ltsc_2019_x64_dvd_8f63a5f8^|lxfcy5TzwilGdyu
echo zh-tw^|b74cd7b58dd51ae37278db88ced4cab5ac1facc4^|ct_windows_10_enterprise_ltsc_2019_x86_dvd_ca810a2b^|lxfcy5TzwilGdyu
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBServer2016 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBServer2016
>>database.Server2016.smrt (
echo zh-cn^|0f501d89dfce75c63d24a3820dc19d5ac0040f80^|cn_windows_server_2016_x64_dvd_9327743
echo cs-cz^|d53ba63ed121908c14ae2ed47db17b716fdb33d0^|cs_windows_server_2016_x64_dvd_9327749
echo zh-tw^|5efe2aa07098e827d073cbcc5a73cbe716639dd2^|ct_windows_server_2016_x64_dvd_9327748
echo de-de^|fd6c0d3b9b88d7f1c43b454edb1cb2fc11907028^|de_windows_server_2016_x64_dvd_9327757
echo en-us^|7e33df150cb4d1fe3503e23433a1867ddd79a6ee^|en_windows_server_2016_x64_dvd_9327751
echo es-es^|de9a1b8e2b5b1d70c2dcc14c0ea48205a4ee3752^|es_windows_server_2016_x64_dvd_9327767
echo fr-fr^|b8da354e906630afea4551b30d40c833221b5213^|fr_windows_server_2016_x64_dvd_9327754
echo hu-hu^|e525849852a6e882fcf637b5696d10d4d4f7ce02^|hu_windows_server_2016_x64_dvd_9327759
echo it-it^|5e0eea3701ccf70f822bab5f53256624ee37b065^|it_windows_server_2016_x64_dvd_9327760
echo ja-jp^|c15b35e48b213093388a0793436fbc11bbece447^|ja_windows_server_2016_x64_dvd_9327761
echo ko-kr^|0202316d59a30cdafeb2d3dfd3b370556b9749c1^|ko_windows_server_2016_x64_dvd_9327762
echo nl-nl^|611e7c82c0173fe7d786ec77010cd5d8ad4c692a^|nl_windows_server_2016_x64_dvd_9327750
echo pl-pl^|d93bf855a018b09957ef54a0db1438a6e2d3b996^|pl_windows_server_2016_x64_dvd_9327763
echo pt-pt^|700a794e4da81d11ce25d438c3d5d36527a7cca4^|pp_windows_server_2016_x64_dvd_9327765
echo pt-br^|928269601da349a6da11d6a4e2c6fafae9f31972^|pt_windows_server_2016_x64_dvd_9327764
echo ru-ru^|59aee74de42846cd0658cbd439ac3af625d1afaf^|ru_windows_server_2016_x64_dvd_9327766
echo sv-se^|d915ad93cc7465723ae480641aa7e52c058afe51^|sv_windows_server_2016_x64_dvd_9327768
echo tr-tr^|b62875cea991d0b1a4857612959456dd27e8bb0d^|tr_windows_server_2016_x64_dvd_9327769
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBServer2019 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBServer2019
>>database.Server2019.smrt (
echo cs-cz^|ac09494f38f85def2f1189581d35cbb91f6130a5^|cs_windows_server_2019_x64_dvd_1f1d33c9^|Z9xqhzTzQYdZuJH
echo de-de^|786df0eb437ff99d1ba18c13960039d73053a976^|de_windows_server_2019_x64_dvd_5035aafd^|Z9xqhzTzQYdZuJH
echo en-us^|24f7c459f3612df82205a45fdb68ca9f96bc5d80^|en_windows_server_2019_x64_dvd_3c2cf1202^|Z9xqhzTzQYdZuJH
echo es-es^|ba5e1489523655214951d1ef495ccf8f0c421b15^|es_windows_server_2019_x64_dvd_e777f781^|Z9xqhzTzQYdZuJH
echo fr-fr^|d6130cd5abffbe2540945f0cfcd19e2c75c84279^|fr_windows_server_2019_x64_dvd_09b82a8c^|Z9xqhzTzQYdZuJH
echo hu-hu^|1e14aa66e99dc38af1a8f1b89eea16cb92f66388^|hu_windows_server_2019_x64_dvd_052f9b8d^|Z9xqhzTzQYdZuJH
echo it-it^|94e14e1833ceee2e3f7331fee67954b87a981191^|it_windows_server_2019_x64_dvd_853c81a3^|Z9xqhzTzQYdZuJH
echo ja-jp^|3269b04f07d4d937f93a341a5f71763f469be3cd^|ja_windows_server_2019_x64_dvd_d7f8ec54^|Z9xqhzTzQYdZuJH
echo ko-kr^|5e3245955f5610acb37cfb85712a1599ed62009c^|ko_windows_server_2019_x64_dvd_3f3b2188^|Z9xqhzTzQYdZuJH
echo nl-nl^|710540eda7486edcf8136835887e84e488fd8c38^|nl_windows_server_2019_x64_dvd_a79f2817^|Z9xqhzTzQYdZuJH
echo pl-pl^|1193e5e7c8af6d02fa475e36038c581fba2c203f^|pl_windows_server_2019_x64_dvd_c318d4a8^|Z9xqhzTzQYdZuJH
echo pt-br^|82a1c1af8120aa97c0f7cbe62dded93b7ff92969^|pt_windows_server_2019_x64_dvd_c02601b1^|Z9xqhzTzQYdZuJH
echo pt-pt^|24731c48f6822207502f07b516a6ca8121672218^|pp_windows_server_2019_x64_dvd_e0434047^|Z9xqhzTzQYdZuJH
echo ru-ru^|9e869bdbdcb4978c7aee0527f88ed1973816e5c8^|ru_windows_server_2019_x64_dvd_f37d6021^|Z9xqhzTzQYdZuJH
echo sv-se^|08cdd335f73e85dab672aa264918a0396e560eac^|sv_windows_server_2019_x64_dvd_f3237e8d^|Z9xqhzTzQYdZuJH
echo tr-tr^|3ad1705a8070ada7fd3b851958dec86e5a1d648b^|tr_windows_server_2019_x64_dvd_73d77b30^|Z9xqhzTzQYdZuJH
echo zh-cn^|cfbc1f9bfa00a08e601548a056c67ab732cf32f7^|cn_windows_server_2019_x64_dvd_2d80e042^|Z9xqhzTzQYdZuJH
echo zh-tw^|27c54e74548a8bdae3611cf5202e24ef7ed86fe1^|ct_windows_server_2019_x64_dvd_af47f9fe^|Z9xqhzTzQYdZuJH
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBServer20192 Refresh STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBServer20192
>>database.Server2019.2.smrt (
echo cs-cz^|0264fec7d694c956fc3e9a1a58d9ee2123cec249^|cs_windows_server_2019_x64_dvd_65383121^|IlAilxINJk1c162
echo de-de^|927e4325a7b87f5dbcc5507a6cd512bc172cf85e^|de_windows_server_2019_x64_dvd_17559a5b^|IlAilxINJk1c162
echo en-us^|2047f4e9fe2894f138395f3fac037c007dd1493e^|en_windows_server_2019_x64_dvd_4cb967d8^|IlAilxINJk1c162
echo es-es^|9042ab26d73328870ef36bef103d66fcbb3f11dd^|es_windows_server_2019_x64_dvd_dd6b7747^|IlAilxINJk1c162
echo fr-fr^|8bf56defd1295d8404895f09b6cedfcdff1efb41^|fr_windows_server_2019_x64_dvd_d936fc7a^|IlAilxINJk1c162
echo hu-hu^|cf3bca7b72e29a2997f7d54ab269936706113f19^|hu_windows_server_2019_x64_dvd_c8f2c460^|IlAilxINJk1c162
echo it-it^|fdc486adf7ae5d5cbffd054be32a530657389e8c^|it_windows_server_2019_x64_dvd_03c34df6^|IlAilxINJk1c162
echo ja-jp^|4bba8656cdae4c1e06a986509f7eeb8dbb1cc404^|ja_windows_server_2019_x64_dvd_260a1d93^|IlAilxINJk1c162
echo ko-kr^|2e19936aff54320cbed727462035016d10171cf1^|ko_windows_server_2019_x64_dvd_8778047d^|IlAilxINJk1c162
echo nl-nl^|bd69ea7938b24f171cdbe2bf3bd5c1c7f82e161f^|nl_windows_server_2019_x64_dvd_82f9a152^|IlAilxINJk1c162
echo pl-pl^|ababdca9c39eb463d02ac99f5325fa6b4f79a77d^|pl_windows_server_2019_x64_dvd_2cd7adba^|IlAilxINJk1c162
echo pt-br^|85994b170d55cefe56f6a3448ac7c12083bc3dfd^|pt_windows_server_2019_x64_dvd_e078dea6^|IlAilxINJk1c162
echo pt-pt^|1f58f87537f83cdb08c3261a141f8b4a866497cc^|pp_windows_server_2019_x64_dvd_e8fadd22^|IlAilxINJk1c162
echo ru-ru^|447775253bdcbe8ec4177f4ee7e8e820be5044ad^|ru_windows_server_2019_x64_dvd_3411c84a^|IlAilxINJk1c162
echo sv-se^|3c506eb3187b087c511b0b19aca6aae2a7d94c0a^|sv_windows_server_2019_x64_dvd_ce3d1a8d^|IlAilxINJk1c162
echo tr-tr^|b3b3adc41147ead6569d25e7c27461d306ff5fee^|tr_windows_server_2019_x64_dvd_475b2d44^|IlAilxINJk1c162
echo zh-cn^|cfa339cdbb4a1a4162bed38218b88ee376867b4f^|cn_windows_server_2019_x64_dvd_4de40f33^|IlAilxINJk1c162
echo zh-tw^|2404a91d44297cba853b6327ed33fd5a27f509ac^|ct_windows_server_2019_x64_dvd_b776f44b^|IlAilxINJk1c162
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBTB1803 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBTB1803
>>database.tb.1803.smrt (
echo Arabic^|5db2b4bee4f68ec5377d277281bbaa23cfab46fa^|ar_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064254
echo Arabic^|78ed4931032348a3748c0b2d40a588d6ec2b6cf6^|ar_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063370
echo Bulgarian^|fdf9c914611e4f7065fc8b55a7bd839a111d4790^|bg_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064334
echo Bulgarian^|6a495230b4d83823c471ee8b02a78c16d6bb369b^|bg_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063372
echo Chinese^(Simplified^)^|82091d67fff5b49726ffc22d35d9c1cbe81dc443^|cn_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063766
echo Chinese^(Simplified^)^|d5e89fb54169f5a2e610c75813ce833a4cb9a4e4^|cn_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063452
echo Czech^|06c5e10c969b03b99734f4b5c5ee9ec571e2f96f^|cs_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063734
echo Czech^|f80db91e842f276a6d0ade5c723ccadcd994be84^|cs_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063373
echo Chinese^(Traditional^)^|db56ca8415c6f597df7cb916c958180fca549e21^|ct_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063769
echo Chinese^(Traditional^)^|dad11416c8bd69f0e855990eff2bca2bd01a090a^|ct_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063453
echo Danish^|e1e957d3bd8eb4014da244f6c85f8975da602632^|da_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063737
echo Danish^|1f95a80a3f40b9c8576dca91946e54776ff2b730^|da_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063374
echo German^|537f817703323d28f673b4e36e377919e1ee034e^|de_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063739
echo German^|2440c7c38a8342f6c075fd17685e86da3fd5d40c^|de_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063375
echo Greek^|79422a3e1cef23e09c5eaf41d70a6f86e70f4392^|el_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064255
echo Greek^|981ad20ee8e630e8a392fd73c497626d8e6a5152^|el_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063381
echo EnglishInternational^|2f8910ce2cfaf61f094dfd49fe87ac004a6200af^|en-gb_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063738
echo EnglishInternational^|e12e5d860b73e14424503372eee39895a55cad9a^|en-gb_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063377
echo English^|08fbb24627fa768f869c09f44c5d6c1e53a57a6f^|en_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063379
echo English^|3f2063b7419675e98c8df82bc0607bbb1ce298bb^|en_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063380
echo Spanish^(Mexico^)^|412421bb1cea4e373849f66b4073303103861e0b^|es-mx_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063741
echo Spanish^(Mexico^)^|be534b157c38b2ccc627009c4e80689c21fefd3d^|es-mx_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063413
echo Spanish^|8909d21adcdb2ee15a48cdd941711b351133f87d^|es_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064257
echo Spanish^|9f5df1360cb0b4fc4a8ecb8517f80fbd0ae5f28d^|es_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063390
echo Estonian^|c35128538bc2def7bbdd170f0e429f9419392b6b^|et_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063740
echo Estonian^|a2ba3f0e28bc04713a58df0b8853bbe3ed689cf7^|et_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063415
echo Finnish^|f62635feb63904cfb588c1faac0b9fdbbd9f517d^|fi_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063746
echo Finnish^|39f0058d814d76135bfc3c9c128482fdf4b57468^|fi_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064463
echo FrenchCanadian^|7b38cf3de9e1cbda7a4880314dfc92dc5a969aaf^|fr-ca_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064258
echo FrenchCanadian^|ec4d16e74ab99b8736fae10020f709da76439cfb^|fr-ca_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064465
echo French^|62564786f5568b40385abb40a1a9bb889f3576c7^|fr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064260
echo French^|730d7834aa90b3e3ffa0a8fb0d0144a3a7b1c43c^|fr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064466
echo Hebrew^|38fa10c7054416e5189017dc712a2c5104167d87^|he_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063750
echo Hebrew^|ce63c53e0edd21eae59e271b93c096e7327d686a^|he_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063422
echo Croatian^|ee8d311750ba2be4d9b078f1e2ef0c682e9aafd4^|hr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063751
echo Croatian^|f95a65fc6b9d3944748e5f71b903dd690aae5489^|hr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063423
echo Hungarian^|2c9d96591073fab7a1464e1af8ca7c74a865848c^|hu_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064263
echo Hungarian^|5396aeb43c37f5c9eed8d9954e9230056884cfa7^|hu_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063425
echo Italian^|2226a27470aadd3897963a6b14b1a82ab2766918^|it_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064265
echo Italian^|84af39d466955ee9ed09988ed6b45e8a59049dbe^|it_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063426
echo Japanese^|a3dad3fe7886aaf33dd950191eed776e4ee79717^|ja_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064266
echo Japanese^|1dc3154c7213239e3629893a08954f5141e9a733^|ja_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063427
echo Korean^|83b391c8d0238a37c880197ab3720c1d064a9f61^|ko_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064336
echo Korean^|74a9b0cd58fac42d80e8728dd70dbe9aa6d73545^|ko_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064467
echo Lithuanian^|1f160da0a2b51b732b57c03a7a97e05db795e459^|lt_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064269
echo Lithuanian^|5e7ef1d3b6a27bfd492b55d9427ca5b57c4e4b21^|lt_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063432
echo Latvian^|6faa8c8640fd4f76d1a1a0a5e687e3238610e4b3^|lv_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063754
echo Latvian^|683c6fe93c389ffb79652a4e0c185be8b910929c^|lv_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063433
echo Norwegian^|5e093a98a3787a85a2d7330edc1c6bf91b13207d^|nb_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063756
echo Norwegian^|ecf9dc1030f064f27a4b4594c771a3e19fb410af^|nb_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063434
echo Dutch^|1eaafb03d19a87bc955843d81693897bf4156f26^|nl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063757
echo Dutch^|fb4b1e6f643814bf51e5678f62597385031b2f90^|nl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063435
echo Polish^|3e097b4ee1c011845f72963ecbbe96afd6d9494f^|pl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063758
echo Polish^|1e88c8d6ca678e43395e64a3e24115429526a120^|pl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063437
echo Portuguese^|76aa50207e1927fca80b0d8a2311d075551745b1^|pp_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064735
echo Portuguese^|f4b3a3157a3224a29ec9db7608ab3aa7b7bf436d^|pp_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063438
echo BrazilianPortuguese^|7c855dcc37d1c40631f84c830b382bc4934fdb2f^|pt_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064271
echo BrazilianPortuguese^|527a581da2bcdfd3ad8788ee288890a4a21c5e30^|pt_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063436
echo Romanian^|01bf23d8a277ef4d6c207b38b9493695e2828dbc^|ro_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064276
echo Romanian^|8180b61a6a83231fe2aaeb2efacc241d2a9dcc22^|ro_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063439
echo Russian^|21758e6046c5adc3b485219aeebc46ed93ae68a4^|ru_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064277
echo Russian^|6b6f75060d4a18761951a533143af5145772d839^|ru_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064736
echo Slovak^|7ffd9ae5ab2893e0ce59664ab6099513d8607418^|sk_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064278
echo Slovak^|734086f531c8b0670af73d1dd8276940c71db89d^|sk_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063442
echo Slovenian^|61e1b5beee0d002f6ad2dbc77991ab2867dfe956^|sl_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064280
echo Slovenian^|d4f321695e4644e16b70a855a3f64a8b252886db^|sl_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063445
echo SerbianLatin^|ad6d807aad81ef4e06bcc98d96bbbf92d5391e92^|sr-latn_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064281
echo SerbianLatin^|5b6acb34a43fe02cb95b6f1a6636a03f8e679d8b^|sr-latn_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063448
echo Swedish^|9ce38a862b067c1ab445591f4d0f01d137982cee^|sv_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12064284
echo Swedish^|ee45fe5c914415c71671838acfda9f18b17dee9b^|sv_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064475
echo Thai^|4e42a197dc55b06cb5ac10a173d5403786bb8cab^|th_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063760
echo Thai^|662095cf81d861f8b19f0311886359b394019abe^|th_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064474
echo Turkish^|37ff7a7a649db4fd3b528762ec3eec7a51488bd6^|tr_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063761
echo Turkish^|2274a98571e93b1bcd1d4368f766b579a3cbd116^|tr_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12064476
echo Ukrainian^|aa53674d84e5beeaf4cab80329aa9f996b3b4738^|uk_windows_10_consumer_editions_version_1803_updated_march_2018_x64_dvd_12063765
echo Ukrainian^|49aef067ffc76fe6d2c059e1519851e6369a3b85^|uk_windows_10_consumer_editions_version_1803_updated_march_2018_x86_dvd_12063451
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBTB18091 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBTB18091
>>database.tb.18091.smrt (
echo Arabic^|29eec618b904e2549463f68d55092b27a16c1dbe^|4.22^|x64
echo BrazilianPortuguese^|68d8827b66165a87f4b73712273ed48c086^|4.22^|x64
echo Bulgarian^|16e3d66b8cfdf772cd4dccaf79cf6710198401a1^|4.36^|x64
echo Chinese^(Simplified^)^|c8deade18822435d8d47011609c124496e94df71^|4.48^|x64
echo Chinese^(Traditional^)^|a6b5d9bdccaa19ead31b781e23aa94aabe864d6f^|4.44^|x64
echo Croatian^|16461ad737586b08cb1e89f6ef0d9324e59c6612^|4.33^|x64
echo Czech^|18b8cbaf977ab99b87ba4d740906a41484d77e40^|4.35^|x64
echo Danish^|e58468cc62f96987d4d14ab6bd0f25fb21972cc2^|4.38^|x64
echo Dutch^|ee5fbe989ed9c770c69176cef9d3c29dee25a5e0^|4.36^|x64
echo EnglishInternational^|84e64722300c855a25a177514d72f1d1cb8efd3b^|4.47^|x64
echo English^|500c9635645a91c09d3c3904fd12f0e1fd3f709e^|4.47^|x64
echo Estonian^|b67d900982b5beee735dfefbbb07132d4eed6f4c^|4.32^|x64
echo Finnish^|1f5c32c96236aadfb6e69328835fdb9e332d9d51^|4.36^|x64
echo FrenchCanadian^|0ec328877d153784321b97b2ba40e2ddb3c43387^|4.22^|x64
echo French^|9754ccb2fa7f293bc9dcadad16a2222c5576b566^|4.49^|x64
echo German^|26bc9a1a5c08d9e8be886cd12fe4ff0eabd1c9c6^|4.49^|x64
echo Greek^|99fa31c341263b3344926df8b664009f68920d84^|4.38^|x64
echo Hebrew^|7991d0d72ab487b8aab03af1dc378d127331ec15^|4.18^|x64
echo Hungarian^|4937b804ac67eaa319c759d647103c20dc665c50^|4.35^|x64
echo Italian^|6cf89c376d3c3d65749cc45bc3925d42960496d5^|4.41^|x64
echo Japanese^|4709a94c64c144207f184b103810898d71d5b99b^|4.42^|x64
echo Korean^|67b0412e2f1b6b2753c1c5287eb718a64ea7fee1^|4.23^|x64
echo Latvian^|0f6e35cd3d4d5fd2f964cefe7b28dfef3625d9f7^|4.33^|x64
echo Lithuanian^|04c3d73b655f91bfd353ac07fe7cee18b9da51b0^|4.33^|x64
echo Norwegian^|2ddd9e1b5635d8d486480501dab6704b02ca8f52^|4.35^|x64
echo Polish^|96bbe53246ff389764502dc4f503118b83246131^|4.38^|x64
echo Portuguese^|e08cd41d78f2031eb4e09363574ec738cc47a25e^|4.4^|x64
echo Romanian^|862fc5619b0e3932bc9c72ea53eb54b908990320^|4.33^|x64
echo Russian^|f905f71f6f75a0aec99ff1cfc091cb46bac5f6fc^|4.23^|x64
echo SerbianLatin^|6e1f5ed604eec8f298fc7806952cbfbd287151fd^|4.14^|x64
echo Slovak^|bf1913aecbdb1ad18c1fd6c338ef55f220cb1144^|4.34^|x64
echo Slovenian^|54030c95fdb2bddd788948e2ac62e1fdc14e37b2^|4.34^|x64
echo Spanish^(Mexico^)^|942b12c8791102913a296be4156e23a6611172aa^|4.22^|x64
echo Spanish^|431ccaf191e34049043e6d3c0cf8b424ad1b0e3c^|4.49^|x64
echo Swedish^|37945d6986457ea8d3df02cbb56dece66b13b1ec^|4.36^|x64
echo Thai^|63411ed63997a012fefa94cc97ab495db466d6c0^|4.17^|x64
echo Turkish^|77ab5adaea15d43f1a656d9d741d5efd1850e260^|4.16^|x64
echo Ukrainian^|306cfeae4d50ed36de4ca57113548086c1dba0ee^|4.16^|x64
echo Arabic^|fd86b4ce64567cf0f2631543be131a2a332ae3b0^|3.08^|x86
echo BrazilianPortuguese^|f1550e9c36b45180bab85664d6dddd635a6eb8a4^|3.08^|x86
echo Bulgarian^|046b056d17eb0264f1683b465f086e2761a987ef^|3.15^|x86
echo Chinese^(Simplified^)^|b21c1ef5445f0c0a185ab15eaf0e953b737ca55c^|3.32^|x86
echo Chinese^(Traditional^)^|c49acd10076fcc91a413176a3ea65dcb2ca3beb0^|3.29^|x86
echo Croatian^|cfb771bffe40baeafba6c7f805251d07c3a780ad^|3.12^|x86
echo Czech^|be0064206618dbbb9136b9e6a4700da9251399bd^|3.14^|x86
echo Danish^|84505f4b7be2da8db23199e6fd27d63aac8b00fe^|3.16^|x86
echo Dutch^|8752addfe7b6fafbb98ccec1104f79a59902357c^|3.14^|x86
echo EnglishInternational^|c347151b94f33b6148545f3e51244dd3c54b1b0a^|3.25^|x86
echo English^|bc4b6cab40e6d60ca4fa8969b16374a2e9b724d5^|3.25^|x86
echo Estonian^|513e2154b9d042bcba3992244c02198f3c2f595e^|3.11^|x86
echo Finnish^|d2ed0364423727934a5fdfb217ea4466e6861e87^|3.14^|x86
echo FrenchCanadian^|1ddc54a242b4b6ef2463a9a6352c19c7bd4814a5	3.08^|x86^|
echo French^|a88431213a86d9fc8c955771b616ac1a63022c17^|3.27^|x86
echo German^|78822dbae0af88327f3b0765a6a7d23f4d11119f^|3.28^|x86
echo Greek^|958bbce223832196b48929dd0410dcdb2d0a4312^|3.17^|x86
echo Hebrew^|34f2f583450a6a3e695622c0d34d529713f68317^|3.05^|x86
echo Hungarian^|8e0805bbf765443049a925c1095b667a04614873^|3.14^|x86
echo Italian^|6cbc57f07c086f6de30c1891c9e8afe7f9ddc371^|3.19^|x86
echo Japanese^|0c7d0b6098d6dc40d811ac95d6da75e039365d33^|3.27^|x86
echo Korean^|21e77cca11d1266ba63d6fdbf51499b670e1513b^|3.08^|x86
echo Latvian^|2c52c808a43fb6935018fe538705815a2f3eaaa9^|3.11^|x86
echo Lithuanian^|77e50ccc7843bdf547cd9a996b4f51d4b061906c^|3.12^|x86
echo Norwegian^|510c3a3034bb92e07423869f630b487a573aa1ee^|3.14^|x86
echo Polish^|461efeef208bf6d53080130b9cd747fc9b706652^|3.16^|x86
echo Portuguese^|6eae9eae2c6807f625da78818b41af06f1aeaf3e^|3.18^|x86
echo Romanian^|ee939aa5eab93fc94a666db1d6e97541e002b84e^|3.12^|x86
echo Russian^|64823da9dd35f93d3b5c7f2681c966da7cb57c5a^|3.08^|x86
echo SerbianLatin^|c657b2f155da362db04f79408c8e7cc8f46600c4^|3^|x86
echo Slovak^|78c112f5ae1a25fc8e630976d67e696487b80f2b^|3.13^|x86
echo Slovenian^|8e59d17d9f44872dc144a7ef97d2e4c603eb021e^|3.12^|x86
echo Spanish^(Mexico^)^|d6a940980b5b3760e4521078d70bbbb641bf45da^|3.07^|x86
echo Spanish^|2de64dadf9185362f35afc61391a389831a09e64^|3.26^|x86
echo Swedish^|1fe00131e68f5c4dacde972343f56d07890b6650^|3.14^|x86
echo Thai^|b3313875a453de270e31c76d868029d4cacf53f5^|3.03^|x86
echo Turkish^|b33a3b0478f131e364458bec94cefd8bd487ae84^|3.02^|x86
echo Ukrainian^|84ff855355334e63f11a865f24030a9de9f788d6^|3.02^|x86
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBTB18092 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBTB18092
>>database.tb.18092.smrt (
echo Arabic^|de626359145eeb49a4149d407191716c7fcb2715^|4.48^|x64
echo BrazilianPortuguese^|a3c21b871664db66c1a8d9eba71b28332ae4e94f^|4.48^|x64
echo Bulgarian^|ce154294d64c7d0c6f5ebcfc710f6c611ca53989^|4.61^|x64
echo Chinese^(Simplified^)^|81766e9fe5793e8781c5336e513ebceedd2f7b90^|4.74^|x64
echo Chinese^(Traditional^)^|b0f40399f54d739b7b22f5b45c9bdae2502d4bf4^|4.7^|x64
echo Croatian^|feb14a5656a24285567ac320516833e5e678af91^|4.59^|x64
echo Czech^|94d19203177653139e56d64a6576cf7667abf6df^|4.61^|x64
echo Danish^|f2a7c8c03d6fbc86ceab37a701fbf79b00c7486d^|4.63^|x64
echo Dutch^|442aa55ee3ec7c2a5837e7eb183a956846492fcc^|4.61^|x64
echo EnglishInternational^|1b7a6d1372140950b9fbb32900e2246c8682750c^|4.73^|x64
echo English^|bee211937f3ed11606590b541b2f5b97237ac09d^|4.73^|x64
echo Estonian^|c381dcbe9b7ff91972edcb89867b6c6b42c28d0d^|4.58^|x64
echo Finnish^|148269dcf8467a0b965b9822cf944fd5832f130f^|4.61^|x64
echo FrenchCanadian^|678d7540836397a454321a7902084c944042e6e7^|4.47^|x64
echo French^|9c0cc504ccf1412a124c46863cc2d46c36327666^|4.75^|x64
echo German^|dd55d5a14ea5a9870508e214d600e2bf44c72093^|4.75^|x64
echo Greek^|6ce1bfb389535d6fb2aa4e2e028d984e079dff05^|4.64^|x64
echo Hebrew^|4ea26a6b076c93ff7f2d29034ce2cf0a7cbb9cbc^|4.44^|x64
echo Hungarian^|b4f88e157d033941569644782a166cc9a73f35b8^|4.61^|x64
echo Italian^|b66dbfee26d68682b653cdbba2af8da320e9802d^|4.66^|x64
echo Japanese^|f1cc02f2a6588a32f691d6f07da6726b1a340b9f^|4.67^|x64
echo Korean^|26ef0a6a7a40895385852f4d3b1326235a966342^|4.49^|x64
echo Latvian^|411bc9049baff178eb1badfb995ff12f0d465ca0^|4.58^|x64
echo Lithuanian^|4222684c6aac58dc735a014f4e8246c1c8b412c5^|4.58^|x64
echo Norwegian^|ec840bb6ef97871f86ffb162b1cbfe0d71deee9d^|4.61^|x64
echo Polish^|ad1b204aeb5d2145bcb326f6a77be78a61ba4a3d^|4.64^|x64
echo Portuguese^|4cfc2d2b52e3d2d2d65a580bfdbd6caba2acf668^|4.66^|x64
echo Romanian^|5341cb961001d1f4b5311ec3aad1107f4a2f440f^|4.59^|x64
echo Russian^|32ba5564b862fb479b7d5e31f6e1604107dfe07f^|4.49^|x64
echo SerbianLatin^|97dd94df424b472009a2f85ea80603ad216cbe4c^|4.4^|x64
echo Slovak^|804325803bb454a7bbf0b61b12c8a5e53e1953b3^|4.59^|x64
echo Slovenian^|a06574263779581eb9fa9861c1913e90eb30cb62^|4.59^|x64
echo Spanish^(Mexico^)^|9baec60a872abb8b2fd458b9e1dd0f561bd146a3^|4.47^|x64
echo Spanish^|420270676e73ded2c6fb777edebb1a46eb9357e7^|4.75^|x64
echo Swedish^|5c1122e4c90e828e78386bee6e0eec1b7c9f5551^|4.62^|x64
echo Thai^|b5a235b46bb6602dd097a50f71d97eae6dc2d6ea^|4.43^|x64
echo Turkish^|5c094a717bcda54a2401b1b1c39ac04947621e38^|4.42^|x64
echo Ukrainian^|0ab01954daed506f9ad2b337a4b20a5a98e3b464^|4.42^|x64
echo Arabic^|2c4e8f608517d58e53e7968949c05dbaf891b097^|3.21^|x86
echo BrazilianPortuguese^|26e94eae1c23ddecec68d11c135be5782501e70e^|3.21^|x86
echo Bulgarian^|0e1c11d537227b1061e44a64ac5df58e7994e954^|3.28^|x86
echo Chinese^(Simplified^)^|6e060995a1529b6a664bfdecefb72985601b9897^|3.45^|x86
echo Chinese^(Traditional^)^|dc97606dbb0a1808e9172f649457f6dc0a287cdd^|3.43^|x86
echo Croatian^|9ef24cfa800e791cdd5867be4678d69eb9a3f1e3^|3.25^|x86
echo Czech^|05ea75a2b71c2cb851f089740d75df77e5479391^|3.27^|x86
echo Danish^|0996a24c91fd76c386f90a323863f244d022bf48^|3.29^|x86
echo Dutch^|7a2a1b69e336889f3aa2517b7ac2417f8a2818ce^|3.27^|x86
echo EnglishInternational^|265c8c0d86ce55173c29f727b7634e191d5e751e^|3.38^|x86
echo English^|cae018b8e164fcbd06cd680e12ec4d264d736291^|3.38^|x86
echo Estonian^|cfd4dbda96e795396732f1ec9103a14951cded4f^|3.24^|x86
echo Finnish^|b6279bcbf317cb97fa39f55c69cd94735fd60c50^|3.27^|x86
echo FrenchCanadian^|256ca03b8f1f52e8b043d94b50e03262e1526f9f^|3.21^|x86
echo French^|d363480055eb103a8347393849659f39ef930bcd^|3.4^|x86
echo German^|49bf9963cc55dd137ffb554c95f6f3fa75c654a8^|3.41^|x86
echo Greek^|0f09b983a16e5cd2879be9e02f156a61d99a4e46^|3.3^|x86
echo Hebrew^|35b0fb6199a8dfa28b21f3ee19b1bd97f92db33b^|3.18^|x86
echo Hungarian^|568e53535ff1712a5aed28fa71b3d44ca15e1a58^|3.27^|x86
echo Italian^|5e10416c481bb2a9770c9bd4133822da021a167c^|3.32^|x86
echo Japanese^|843586cac656ebb3c48e8288cc4321b10460aeaf^|3.4^|x86
echo Korean^|a2dd8415d7ffa78b4bca1a666d73d2ca1adb3879^|3.22^|x86
echo Latvian^|83bdad2ae39341d2bfe181531759ed396b73836d^|3.24^|x86
echo Lithuanian^|92edbea2ff81604ea3629ad96ef9ed2c8d262338^|3.24^|x86
echo Norwegian^|ebeff6c4630c6b62dfdb9daed72ab9eaf30caeab^|3.27^|x86
echo Polish^|9a9f89cb36aeffcef68169009e70837eeaed8154^|3.3^|x86
echo Portuguese^|d849f076c80282fdb2ff20b0daa3436ee7b54720^|3.31^|x86
echo Romanian^|407f5a2d9fb2eee6235daf63548adc384ca72564^|3.25^|x86
echo Russian^|61e800282576f1dc5ccef8af5fa92151a761ece1^|3.22^|x86
echo SerbianLatin^|ad152ecfd0a996e0df095ba70489bd3d9c689b5b^|3.13^|x86
echo Slovak^|1fb961565c55e15fd18bf9016e4b55d3f987cf1a^|3.26^|x86
echo Slovenian^|96d0df9d6276b2b101e9819bc0dde46b2a9be6bd^|3.25^|x86
echo Spanish^(Mexico^)^|cda4ea8710aa85afc54cc01b7db90a6eb109b378^|3.21^|x86
echo Spanish^|354337e22469a657bccf7eb67fb355d03006d15d^|3.4^|x86
echo Swedish^|6da40856077e2f11f441eeb06061c0d6e6ce1572^|3.28^|x86
echo Thai^|bc1b90d2e3f711272e3d1a7a3c8c1ba93dde774f^|3.16^|x86
echo Turkish^|24233b9f8a9a03e2662efc7e0104ab07941568aa^|3.16^|x86
echo Ukrainian^|4930123fc3b9dc48b01d9e4d78f14d8354b59286^|3.16^|x86
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBTB81 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBTB81
>>database.tb.81.smrt (
echo Win8.1_Arabic_x64.iso^|48aefc696634b14482443e5e92ca3935c64f3f03^|4.05
echo Win8.1_BrazilianPortuguese_x64.iso^|619bfd703f58716a90434a92531039ec44f83baa^|4.02
echo Win8.1_Bulgarian_x64.iso^|bdf8307802115beeae6106e3bc70e919013284b2^|3.97
echo Win8.1_Chinese^(Simplified^)_x64.iso^|9a85eac2d20446e3e086bf57a7dfc8832fb3ba56^|4.2
echo Win8.1_Chinese^(TraditionalHongKong^)_x64.iso^|21bb15886d8d9b7c1cde63d34ab7be5cf17b1e99^|4.18
echo Win8.1_Chinese^(Traditional^)_x64.iso^|dfd583a9198b8e06bd9e7c1ea6177ab2a1973c9a^|4.17
echo Win8.1_Croatian_x64.iso^|3b5c0d0cbd956903801b9319384f4a78988eb8af^|3.97
echo Win8.1_Czech_x64.iso^|0e572b62ea98a6e007e02742c7d087811bfae3a9^|4
echo Win8.1_Danish_x64.iso^|dc7948ef523f16e770d34ce2c0ab22168bbc8907^|4
echo Win8.1_Dutch_x64.iso^|00b1b0c90feb1012adb90eafbf9c3d8d3f04612a^|4
echo Win8.1_EnglishInternational_x64.iso^|c99a6ec2de4a71def522989d2242cb34ab860a0d^|4.03
echo Win8.1_English_x64.iso^|a8b5df0b0816280ae18017bc4b119c77b6c6eb79^|4.02
echo Win8.1_Estonian_x64.iso^|03766dfd1240e40741476ad0db3816590e68e806^|3.96
echo Win8.1_Finnish_x64.iso^|627a9e8c84cc180ed3a84f5d9475e853210afadb^|4
echo Win8.1_French_x64.iso^|7b9f1f0870d7e4125be45b64b40182070417f7f6^|4.06
echo Win8.1_German_x64.iso^|07c464680da474a4d6c23d57d99a90f129f85584^|4.07
echo Win8.1_Greek_x64.iso^|077a3faf9a110035d05b4246e678ecb0e7d8a7b5^|4.01
echo Win8.1_Hebrew_x64.iso^|ca59f6c3ad4a1225ea3b8eb17ec55a42c5a29a39^|4.01
echo Win8.1_Hungarian_x64.iso^|da541398069d067e3e388b36cfeea898f55091d4^|3.99
echo Win8.1_Italian_x64.iso^|a5292abf4784f162399ea4f7402c4674b1182dea^|4.01
echo Win8.1_Japanese_x64.iso^|3b35ed1690accfd0078f03a24b8c44e3cffac6b5^|4.09
echo Win8.1_K_Korean_x64.iso^|ebdda17a65d8d3f4ab6a18bed2642eac21bda15d^|4.06
echo Win8.1_Latvian_x64.iso^|97e8bcd8b80accd276a9602aea7d51538ef5e37f^|3.96
echo Win8.1_Lithuanian_x64.iso^|fe8ec566e513b5d5e56bc7c07f6f936f1e324be0^|3.96
echo Win8.1_Norwegian_x64.iso^|f6181ffd851d55f29b6bf99503ac2c1b2757d012^|3.99
echo Win8.1_Polish_x64.iso^|dcd1ea4675c41c10452910f4cf9dfa1905dd26f4^|4
echo Win8.1_Portuguese_x64.iso^|c3fa9bad9bba2eaff519df6c06b3cba482cd9c6b^|4.01
echo Win8.1_Romanian_x64.iso^|14c6223f0bf8a8ffa086ce52faf6fc3206b19362^|3.96
echo Win8.1_Russian_x64.iso^|8d69de249806ffbe94870adc4d74e40e486c13b6^|4.02
echo Win8.1_Serbian Latin_x64.iso^|9ea5300de7ea822dcbbf52a3103a25e988c492f7^|3.97
echo Win8.1_Slovak_x64.iso^|ad26428f7900775c792135616ed04053b44c2e3a^|3.96
echo Win8.1_Slovenian_x64.iso^|c51922f4d9bd68a298762346ed066ebb2f2f3c6f^|3.97
echo Win8.1_Spanish_x64.iso^|b2c02e02c70569eb0cc7a912f72b1c3417c67e01^|4.06
echo Win8.1_Swedish_x64.iso^|40f2bc8a3c44fb5a7adf979493f789bd49ad90d5^|4
echo Win8.1_Thai_x64.iso^|ca4c2475d8817f15705e8343b3a11993be4fb8cf^|3.97
echo Win8.1_Turkish_x64.iso^|776e4a514c020947e402eaeedabb7431440d2099^|3.99
echo Win8.1_Ukrainian_x64.iso^|271ce4be9731e24ce541c2769063052fe75fe574^|3.97
echo Win8.1_Arabic_x32.iso^|c9d5a6a85bc01ef59821600f3e62b982fe3d70cf^|3.01
echo Win8.1_BrazilianPortuguese_x32.iso^|309d4cd54c658ac079905a92d1113f96f23083da^|2.97
echo Win8.1_Bulgarian_x32.iso^|37d37118d49ae56f4964c1aef91bd1fafe94ee56^|2.93
echo Win8.1_Chinese^(Simplified^)_x32.iso^|abbf814846c425c88910b011bc9d3d3c77932056^|3.12
echo Win8.1_Chinese^(TraditionalHongKong^)_x32.iso^|d076437f650951a61405bbc99ec3b99bad1406ed^|3.12
echo Win8.1_Chinese^(Traditional^)_x32.iso^|0c371428ab14579a609a42a7407c7a176cd09bf3^|3.11
echo Win8.1_Croatian_x32.iso^|3f62e5ed076f6c3aa37775865850fc474462bf54^|2.92
echo Win8.1_Czech_x32.iso^|c394e8869a7f4ff5aebbe3bb473052b91d922dec^|2.95
echo Win8.1_Danish_x32.iso^|d7c98abcc4818d7fa34ed3809e960048b8b11bd3^|2.95
echo Win8.1_Dutch_x32.iso^|348a0d8e124206e1120eced85075ff870b592092^|2.96
echo Win8.1_EnglishInternational_x32.iso^|39c57b6d35eaaab64a971c374fb35004709e1f2c^|2.99
echo Win8.1_English_x32.iso^|c7fa828e01e98b601e0aca8019f1cb223eb23223^|2.99
echo Win8.1_Estonian_x32.iso^|7eac744280611049026d259b0185b8664945c602^|2.92
echo Win8.1_Finnish_x32.iso^|f93e895c5f95775ebddb4f975c386ef7441e09c3^|2.95
echo Win8.1_French_x32.iso^|1bb67f65d68ace78f7853f9ccbc506333eacceb5^|3.01
echo Win8.1_German_x32.iso^|18ac1bf6e2e0d00f58071c0acd92334876202282^|3.02
echo Win8.1_Greek_x32.iso^|56dffeebc3baa4140266b009c5838963e4f4a6be^|2.96
echo Win8.1_Hebrew_x32.iso^|24a238906f458f75bb2e7ff17f6076552265505c^|2.96
echo Win8.1_Hungarian_x32.iso^|cd29b4a5a2c1d858eea3455be60e15f7e23c0fc3^|2.95
echo Win8.1_Italian_x32.iso^|ed3c00086de57049ea65f72e87cba247be7c0399^|2.96
echo Win8.1_Japanese_x32.iso^|adb04f95bf292151f4bb1c8bb989812c2c2e76b8^|3.03
echo Win8.1_K_Korean_x32.iso^|bc42b12fedfc72f9eac48b235c7ae8700f877fd7^|3
echo Win8.1_Latvian_x32.iso^|389f531a6b0c3858fecc862fa2558f0fa0a00b5e^|2.93
echo Win8.1_Lithuanian_x32.iso^|02960cc1cd23b566639571e5bf3e5f247588b8d5^|2.92
echo Win8.1_Norwegian_x32.iso^|3490ca5e3f4ff6efef17998917a402abd2455a09^|2.95
echo Win8.1_Polish_x32.iso^|62d35270f71e804ffb9fed7ecfbbe201f29c2472^|2.96
echo Win8.1_Portuguese_x32.iso^|f4a6d35e19dd2042274681fff9e6198811bd49cf^|2.96
echo Win8.1_Romanian_x32.iso^|9c7a99dad2372c3f338c1d617e9a23ebee6b4194^|2.94
echo Win8.1_Russian_x32.iso^|fb10a76d2c2f8db76add14f83c41b10b3994ffb2^|2.97
echo Win8.1_Serbian Latin_x32.iso^|b574e5da71625b4ecaa3849a9d441328d83f7454^|2.93
echo Win8.1_Slovak_x32.iso^|c0e62a806d17086e6ecbc71fd901bc253fc383f4^|2.93
echo Win8.1_Slovenian_x32.iso^|56358b0ff05752b98f9150148ff3b254c2bb3808^|2.92
echo Win8.1_Spanish_x32.iso^|8c2e8287dcb05c387a28fef1d08e59fd7907c8cb^|3.02
echo Win8.1_Swedish_x32.iso^|de89ee967586722df3c445db13c5a109c4244336^|2.95
echo Win8.1_Thai_x32.iso^|db2eedcaa8fef4678caf0fa3175682cfa34f750f^|2.93
echo Win8.1_Turkish_x32.iso^|6b41ee4936c062b3265514cad16e37999ed3bf8f^|2.94
echo Win8.1_Ukrainian_x32.iso^|f6582a901ba7ac46b13cee54195118faeca8cf28^|2.93
echo Win8.1_Pro_N_Bulgarian_x64.iso^|a675314c96abdefd82aac8327d0274ae02638e79^|3.74
echo Win8.1_Pro_N_Croatian_x64.iso^|690deffc247bc364cb65bfe436e04ceacae13ee6^|3.74
echo Win8.1_Pro_N_Czech_x64.iso^|b852b9e84d4f70c59eac6b7a1eacca9337f28e3e^|3.77
echo Win8.1_Pro_N_Danish_x64.iso^|b66260a8e6d0b9a96f26b9f5b0944c589caf62c7^|3.77
echo Win8.1_Pro_N_Dutch_x64.iso^|c8e00db23b8e32b26803b537351a6f5fc871c705	3.78^|
echo Win8.1_Pro_N_EnglishInternational_x64.iso^|df2365bdd9e60baf16ed30492345e14bbc03509e^|3.81
echo Win8.1_Pro_N_English_x64.iso^|457d02bd26a19965da172daae78f985cf53af692^|3.8
echo Win8.1_Pro_N_Estonian_x64.iso^|cbe42a19fbe08bba8ea2742bd608f7e3ddb7e614^|3.73
echo Win8.1_Pro_N_Finnish_x64.iso^|aab2f6bd18132bd7d543d85951a18fd82c6a9c68^|3.77
echo Win8.1_Pro_N_French_x64.iso^|7bb1ba822a9b88e617fc78a5db461edda6664029^|3.83
echo Win8.1_Pro_N_German_x64.iso^|833ab9b7d66f0d602e0553b23111401170099df7^|3.84
echo Win8.1_Pro_N_Greek_x64.iso^|6dfc65f3960122a2b3690988d1a22471676e4804^|3.78
echo Win8.1_Pro_N_Hungarian_x64.iso^|e6548d1d14a5621389943d52a889d5f521dd90e3^|3.76
echo Win8.1_Pro_N_Italian_x64.iso^|182064d7947b1bb703387a4d2af81ab594ab6cd0^|3.78
echo Win8.1_Pro_KN_Korean_x64.iso^|37f78e32fe8cb23b4ff1f5b49bcfbf07d278aed5^|3.83
echo Win8.1_Pro_N_Latvian_x64.iso^|c8b7d5040a2eeaf9982470527874b32ca1f97cc5^|3.73
echo Win8.1_Pro_N_Lithuanian_x64.iso^|d49708f08f45ca2afe6045e2a60cecd45714fcb5^|3.75
echo Win8.1_Pro_N_Norwegian_x64.iso^|1f06421d9263eb3c7b7fc6e0cbf10e662ff617bc^|3.77
echo Win8.1_Pro_N_Polish_x64.iso^|ecde38990d7c635e7b768284763a37f73a31d526^|3.78
echo Win8.1_Pro_N_Portuguese_x64.iso^|972486c70496793f336539e334ce8f215ce739c6^|3.78
echo Win8.1_Pro_N_Romanian_x64.iso^|b0fa6038cad66a1844d735025ed3a96c08050e43^|3.74
echo Win8.1_Pro_N_Slovak_x64.iso^|40f9c1ad24aa98e85f2bea67d32eb3d8851f666d^|3.73
echo Win8.1_Pro_N_Slovenian_x64.iso^|96d909ace95119b4f11f2c36274d0cdca8ce81df^|3.74
echo Win8.1_Pro_N_Spanish_x64.iso^|d82fbb9edc481bff8b54068b63949cf28b8080a8^|3.83
echo Win8.1_Pro_N_Swedish_x64.iso^|381c5bff4804fcc2bda10ebc7d071592ead1c7ea^|3.77
echo Win8.1_Pro_N_Bulgarian_x32.iso^|9e8755f1db5bc8a0d04d99d1ebf8c6ff2954073f^|2.76
echo Win8.1_Pro_N_Croatian_x32.iso^|403a243ba8269667c5c797a9864a34cd481fdc13^|2.75
echo Win8.1_Pro_N_Czech_x32.iso^|2c72490d3e3a2a69d07eb5c60a40b88f2f71ec82^|2.77
echo Win8.1_Pro_N_Danish_x32.iso^|e6b5487166c34cff5bd67d50fcf338d2ca7b0f32^|2.78
echo Win8.1_Pro_N_Dutch_x32.iso^|b26b6f327583a754f72ce158e707d6b030bf9fcb^|2.78
echo Win8.1_Pro_N_EnglishInternational_x32.iso^|7b96238d9c30aaadc984ce226f98cf8a3bcd1fd9^|2.82
echo Win8.1_Pro_N_English_x32.iso^|a2c2d9916a4aee87afdd0aea19459f2f8414737c^|2.82
echo Win8.1_Pro_N_Estonian_x32.iso^|140888f5c2a6bdfc4b7fa8755c8e0b91f3f9b76f^|2.75
echo Win8.1_Pro_N_Finnish_x32.iso^|d801ac4b31a9840365108e16c22355c8dca7d6af^|2.78
echo Win8.1_Pro_N_French_x32.iso^|d8910bd0f8645ffa91dcb4bbea64117f018a9256^|2.83
echo Win8.1_Pro_N_German_x32.iso^|2592b1d176f6392531dcef7a97e3ec4a6f6ac660^|2.85
echo Win8.1_Pro_N_Greek_x32.iso^|45c83668f0fff287d8adde84a5daad5f9855f436^|2.79
echo Win8.1_Pro_N_Hungarian_x32.iso^|9a01670e80c8d0c6f0151073976c53cbb55ff885^|2.77
echo Win8.1_Pro_N_Italian_x32.iso^|8ed2af183ceb1073674734ad7dcf0c1ca9cb313e^|2.79
echo Win8.1_Pro_KN_Korean_x32.iso^|c120e8b4fc39641867d0f6ce99139f0173c7e4f9^|2.82
echo Win8.1_Pro_N_Latvian_x32.iso^|eaf2cb6b1c5064a2834cbfd19b72d4d3f69276b9^|2.75
echo Win8.1_Pro_N_Lithuanian_x32.iso^|4f03cbafff47aac1a7c0bd3e42f487916316a70e^|2.75
echo Win8.1_Pro_N_Norwegian_x32.iso^|b3a4cd3b6447581fb098ea20240655d01d576432^|2.77
echo Win8.1_Pro_N_Polish_x32.iso^|9d87d88103f39cd42c48aecc623dd6bb769693ef^|2.79
echo Win8.1_Pro_N_Portuguese_x32.iso^|d47199eb9b29a58e71828cb7279ea4f86a63f273^|2.79
echo Win8.1_Pro_N_Romanian_x32.iso^|44a0779f37030910f66f689c6fb144f36a43a79a^|2.75
echo Win8.1_Pro_N_Slovak_x32.iso^|ea9c8e158dbb2143dfdf2a03beec8353ce52d48c^|2.75
echo Win8.1_Pro_N_Slovenian_x32.iso^|517a9f3697aab09ebfedb0dfd0ff2a6f2fcc5384^|2.75
echo Win8.1_Pro_N_Spanish_x32.iso^|8ea5d452d000b59478437d69d4dc254ce6f8367a^|2.83
echo Win8.1_Pro_N_Swedish_x32.iso^|da132c0c919c70c3a220df36fbede774fb152fd4^|2.78
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBVLSCLTSC STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBVLSCLTSC
>>database.vlsc.LTSC.smrt (
echo ar-sa^|0a8185d3cc65eccc0bc31b71e5af0d7bd1e0d7f4^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Arabic_MLF_X21-96407^|x64
echo bg-bg^|fb0659f6d35605fae4f386549a481228ee73b0e0^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Bulgarian_MLF_X21-96411^|x64
echo cs-cz^|d96085a6b00f9ebfae7a65c28be59cbbf9815bd1^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Czech_MLF_X21-96419^|x64
echo da-dk^|1cc73e05131b286f3486f85e5cee11a53e65295f^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Danish_MLF_X21-96421^|x64
echo de-de^|3faa84fb5533eac76e4ea8b3ee056f0148a977b9^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_German_MLF_X21-96437^|x64
echo el-gr^|4208625ce65ff9e12c2ffb1882bbe57e382dbb1f^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Greek_MLF_X21-96439^|x64
echo en-gb^|dad202319f78e8e0549966eaf8e57d54b1e7cb8f^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_English_International_MLF_X21-96427^|x64
echo en-us^|d5b2f95e3dd658517fe7c14df4f36de633ca4845^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_English_MLF_X21-96425^|x64
echo es-es^|dc66bc264ac8ffdd4764761cc578e5c4bd94a1f8^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Spanish_MLF_X21-96471^|x64
echo es-mx^|e1af525a2212a06b89fc53bc8473956bcf658196^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Spanish_Latam_MLF_X21-96473^|x64
echo et-ee^|488f4a95043050abcb961d6844a957b325f08398^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Estonian_MLF_X21-96429^|x64
echo fi-fi^|46af56d7b655d690587d98f723e44d3ca90d4f35^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Finnish_MLF_X21-96431^|x64
echo fr-ca^|52d06c9135ccc45a84b9485289a2a70d87efdb58^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_French_Canadian_MLF_X21-96434^|x64
echo fr-fr^|ef03cc0a7b5e0f16d2b0b6646fed2c1343b85ce1^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_French_MLF_X21-96433^|x64
echo he-il^|33ba3e7f44afb344fbc0e125c6631447f3a97f4c^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Hebrew_MLF_X21-96441^|x64
echo hr-hr^|60fc3fcfc5332e32bf991f2b9a4f3be3a2f21f1a^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Croatian_MLF_X21-96417^|x64
echo hu-hu^|f57c497b725f7bfff6bc4f31d20c9cb63c0db115^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Hungarian_MLF_X21-96443^|x64
echo it-it^|9a9ef958765a7eb038516790f161d3e47c4b8a6a^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Italian_MLF_X21-96445^|x64
echo ja-jp^|2f5642c2c510489ab0be999d2b473364306894ff^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Japanese_MLF_X21-96447^|x64
echo ko-kr^|5ee42e4abdc6da6a95f99fa806c41e21a99df9cc^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Korean_MLF_X21-96449^|x64
echo lt-lt^|6e199aa9e8d896b1dcb3c4421473edcfc12aa106^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Lithuanian_MLF_X21-96453^|x64
echo lv-lv^|325e70bbf4039b20a78e6242782b1fdec6a8a3d8^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Latvian_MLF_X21-96451^|x64
echo nb-no^|a0e7cc2b7c5a58b643fa0426cdab46679d1b84c2^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Norwegian_MLF_X21-96455^|x64
echo nl-nl^|c4e01e87988858c329155a6ca22f87866e5b5a0b^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Dutch_MLF_X21-96423^|x64
echo pl-pl^|195814265315820942aaaa3d412fb98f1d19f917^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Polish_MLF_X21-96457^|x64
echo pt-br^|ddc18e3e24540d465d3157f686a0771b89068f03^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Brazilian_MLF_X21-96409^|x64
echo pt-pt^|6dd358844943daf960ebddeba50e1f346d3793e1^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Portuguese_MLF_X21-96459^|x64
echo ro-ro^|c089df3326951965b262c3dbce213685586bc8b4^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Romanian_MLF_X21-96461^|x64
echo ru-ru^|e5d8d073a899917a3cc0bed51a432390694e39b5^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Russian_MLF_X21-96463^|x64
echo sr-latn-rs^|1189d0bc67a4169bac93b15bc0620f31efcc7e8a^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Serbian_Latin_MLF_X21-96465^|x64
echo sk-sk^|a4a9a9b1354a75f34f7eb9ed27dc430c683c7f98^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Slovak_MLF_X21-96467^|x64
echo sl-si^|4bff53c8bee7abeed0b24b4fddd3347ab706b93d^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Slovenian_MLF_X21-96469^|x64
echo sv-se^|c0e86ff99a1708810787e6f17cddc86bfd515e58^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Swedish_MLF_X21-96475^|x64
echo th-th^|224bace50580511e141e8dc2a2a7467614f0d83c^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Thai_MLF_X21-96477^|x64
echo tr-tr^|4547d9fb7cf2acff368964d0586b5459585bfec8^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Turkish_MLF_X21-96479^|x64
echo uk-ua^|9c5210c7e611b930d3f4cd197a138109164a27ac^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Ukrainian_MLF_X21-96481^|x64
echo zh-cn^|c0b4704e1336281c98a91438c7df0f14b8f41e46^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Chinese_Simplified_MLF_X21-96413^|x64
echo zh-tw^|0c7bd68d1796485997d1977e5d80974b1b9fa4f1^|SW_DVD5_WIN_ENT_LTSC_2019_64-bit_Chinese_Traditional_MLF_X21-96415^|x64
echo ar-sa^|890a0a85ad7ad60f2ba34bdc66c38e452279342a^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Arabic_MLF_X21-96406^|x86
echo bg-bg^|ec40ae2dac4814eddae0829ac5132d72af3bfb54^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Bulgarian_MLF_X21-96410^|x86
echo cs-cz^|da3f151b8a9b3ef5d9c9d039ecb725c5e3484f51^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Czech_MLF_X21-96418^|x86
echo da-dk^|097e27f7e4cebbda810fed104519c90a58bbd677^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Danish_MLF_X21-96420^|x86
echo de-de^|9a36adb05e7ff77353ad494dcbd6186b6a9bafe9^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_German_MLF_X21-96436^|x86
echo el-gr^|ebb4fe3eb2194396418d36be008c7b8a3287342e^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Greek_MLF_X21-96438^|x86
echo en-gb^|eb491aed6c00ff050436e9e8deb12c9d25ac8285^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_English_International_MLF_X21-96426^|x86
echo en-us^|220eb673d4aed9f1652c1ce3d2731cd96a8138f2^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_English_MLF_X21-96424^|x86
echo es-es^|cb973b46a3f7c34d09aad7e15a83a577a207daac^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Spanish_MLF_X21-96470^|x86
echo es-mx^|de023654906c2585fa7fc412ab0506d87bdebafd^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Spanish_Latam_MLF_X21-96472^|x86
echo et-ee^|033d031a033e61518d3dac11efd92417335f5b82^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Estonian_MLF_X21-96428^|x86
echo fi-fi^|3f49f36a0ad9905b257fe9231eb4a5aae3004460^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Finnish_MLF_X21-96430^|x86
echo fr-ca^|78fcaf2ed6d252b68d2652dad334822dc45ab2ee^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_French_Canadian_MLF_X21-96435^|x86
echo fr-fr^|28bc831500815f957a3ab4b79ba0d36f7354a779^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_French_MLF_X21-96432^|x86
echo he-il^|c763fc14e5d9255c0e3dd1d84ab7a7c6e3f11290^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Hebrew_MLF_X21-96440^|x86
echo hr-hr^|d38ae2f467bc3382e84b616f6112b75dec0c537e^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Croatian_MLF_X21-96416^|x86
echo hu-hu^|4d0cbe23c879244208458cef46cc58c0d8fdbbdf^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Hungarian_MLF_X21-96442^|x86
echo it-it^|5f45192f5d0be7e94c29d106511e2d70a3c31eab^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Italian_MLF_X21-96444^|x86
echo ja-jp^|85acee2ce658f0feb78a708bc405684aca93a640^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Japanese_MLF_X21-96446^|x86
echo ko-kr^|0d7ef0c9c8fe9e5cb6aeba7b5ae8a271f006d4f3^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Korean_MLF_X21-96448^|x86
echo lt-lt^|60cc366536ad5cec1b5ec2212797cb1d68450ae3^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Lithuanian_MLF_X21-96452^|x86
echo lv-lv^|074e8948ca133eab977978029f8113077c1bd882^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Latvian_MLF_X21-96450^|x86
echo nb-no^|a43d90bc1dd397910717f300cbe46f91bcd02925^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Norwegian_MLF_X21-96454^|x86
echo nl-nl^|16198d94a452f9ed4abc274575eff71de0e267e9^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Dutch_MLF_X21-96422^|x86
echo pl-pl^|9d1db4e953f9bd6fefb735806d960647c4e447c2^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Polish_MLF_X21-96456^|x86
echo pt-br^|1546b818f5489a491c8123d38b0f3fa662a2cc1e^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Brazilian_MLF_X21-96408^|x86
echo pt-pt^|69e6356e27e02e0738ac0e5b181ae7219eb0f68f^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Portuguese_MLF_X21-96458^|x86
echo ro-ro^|a72b3a16d009d52994998fb3c7f12fd57b00ad1f^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Romanian_MLF_X21-96460^|x86
echo ru-ru^|5f73ce77c5bbb86cf7fda681737c14dc0e40e273^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Russian_MLF_X21-96462^|x86
echo sr-latn-rs^|8a8f5ad0757531bc5414214afdf584fcedb47e5a^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Serbian_Latin_MLF_X21-96464^|x86
echo sk-sk^|276579d42a8ca8b35c0f61ef3fa81190c6427306^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Slovak_MLF_X21-96466^|x86
echo sl-si^|4c43e6a1e58fe111c2d7d56945e3c8bcf2ded858^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Slovenian_MLF_X21-96468^|x86
echo sv-se^|80fae11c9c380ae79b8482e92d65ce59fff69da3^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Swedish_MLF_X21-96474^|x86
echo th-th^|6a1ae5df87a1a4ab5dd1e04cd4b416af01f17ec1^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Thai_MLF_X21-96476^|x86
echo tr-tr^|5b135b43af961858288d779107a813efab2be8c7^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Turkish_MLF_X21-96478^|x86
echo uk-ua^|fca7d4acf229e5c2343239d6b7394ac080073493^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Ukrainian_MLF_X21-96480^|x86
echo zh-cn^|fbfeabde20b6f49aa0c7f8fd62a5ba029505f36f^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Chinese_Simplified_MLF_X21-96412^|x86
echo zh-tw^|13aeaf4620b04d1bb88d355fb0410d79660943d3^|SW_DVD5_WIN_ENT_LTSC_2019_32-bit_Chinese_Traditional_MLF_X21-96414^|x86
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBVLSC18092 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DBVLSC18092
>>database.vlsc.18092.smrt (
echo ar-sa^|18bdb2b745d1dc6f9df9df751d6f97e51ad7932a^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Arabic_MLF_X21-96483^|
echo bg-bg^|f68b88a11d0df463fa3a36d18bb8feee8105d081^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Bulgarian_MLF_X21-96487^|x64
echo cs-cz^|f9548122a49d7b60d6f4c3f587102fdad538eb9b^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Czech_MLF_X21-96495^|x64
echo da-dk^|55d2a91684b53cc99511c9bd3a459074303ffdb0^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Danish_MLF_X21-96497^|x64
echo de-de^|ffdbc75521c38376c8ec406846d2e49da580779d^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_German_MLF_X21-96513^|x64
echo el-gr^|2b522eaed13e6d9a07f3df5e131c232b4b29865a^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Greek_MLF_X21-96515^|x64
echo en-gb^|ac4506a86fa8013d59d5250949a8fc10490c0db6^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_English_International_MLF_X21-96503^|x64
echo en-us^|6208b319de3aaf0d8ec5b8d0f710e2744f89d0b4^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_English_MLF_X21-96501^|x64
echo es-es^|4c7b3b40ee04a89f267e5424a36b6b24d4ea1f5f^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Spanish_MLF_X21-96547^|x64
echo es-mx^|c1bfb4883b1b203f516bbb2c3ddca86b5328a14a^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Spanish_Latam_MLF_X21-96549^|x64
echo et-ee^|d13ace1ff48ad48ee35440dca7aa1e9c76650e48^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Estonian_MLF_X21-96505^|x64
echo fi-fi^|e2c987a109ea334d4cb54415d60c5e8017a59456^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Finnish_MLF_X21-96507^|x64
echo fr-ca^|cb8e9ba2f15862ff6f7bc9beba907e15684a4fdd^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_French_Canadian_MLF_X21-96511^|x64
echo fr-fr^|1096ed046a68ed144c8d1603333fec661ef9589f^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_French_MLF_X21-96509^|x64
echo he-il^|08020958a505d3ddc1f6854043f91b8565b74262^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Hebrew_MLF_X21-96517^|x64
echo hr-hr^|a8534d4706db3ebc69f9aeca897f1c938d372657^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Croatian_MLF_X21-96493^|x64
echo hu-hu^|b30f80805cf151274e1bd66a81d380d35d227630^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Hungarian_MLF_X21-96519^|x64
echo it-it^|48a950d35c6d4414ca8d84ce37d46fb9223d3fbd^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Italian_MLF_X21-96521^|x64
echo ja-jp^|d84a4c21b73ab661de886fa4c640a5ba28a4a244^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Japanese_MLF_X21-96523^|x64
echo ko-kr^|2b22370d43154ffcf3b1a5696a695edd9ea65a16^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Korean_MLF_X21-96525^|x64
echo lt-lt^|9ce78722e956551124a59c7060eb946b4b73a0de^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Lithuanian_MLF_X21-96529^|x64
echo lv-lv^|13c3369e848c76403c72442208ce360a13b99572^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Latvian_MLF_X21-96527^|x64
echo nb-no^|fe9c0729d2696f1e53e12bbc1a54d8a6d7070eec^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Norwegian_MLF_X21-96531^|x64
echo nl-nl^|f777b05e612788f76db29eee4525423c01d9b69b^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Dutch_MLF_X21-96498^|x64
echo pl-pl^|ce3c342373fee635498f87d084eafb3f504f3fb7^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Polish_MLF_X21-96533^|x64
echo pt-br^|8056be90e83c4ec580db211cca89277c7dd9a874^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Brazilian_MLF_X21-96485^|x64
echo pt-pt^|a5f5935b6b2d95f8e86cbf8dd8e512af45927280^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Portuguese_MLF_X21-96535^|x64
echo ro-ro^|eaf2b841fb418b2b918f42800efb7407bb9cda69^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Romanian_MLF_X21-96537^|x64
echo ru-ru^|58dbcd778038ce7bf9bb67e07bfdd937fea2ba6f^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Russian_MLF_X21-96539^|x64
echo sr-latn-rs^|224821e7cab82860b0143149bf37d3f41a7fac6c^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Serbian_Latin_MLF_X21-96541^|x64
echo sk-sk^|8b24b9fee6dcdf88152f82a8f5ae4b4970393164^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Slovak_MLF_X21-96543^|x64
echo sl-si^|cee76f4d168b29ebc9b2cf88247c2189828df38d^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Slovenian_MLF_X21-96545^|x64
echo sv-se^|092fe7b7046ba115c8201ee01a3517ce8743fd34^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Swedish_MLF_X21-96551^|x64
echo th-th^|027037457a8d12d8236e6ec2744f74da30db344d^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Thai_MLF_X21-96553^|x64
echo tr-tr^|28e1945ccd46f272fa85805cd4b5591355cfa1b7^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Turkish_MLF_X21-96555^|x64
echo uk-ua^|039cc17d4853a37b0e2addff8b8403428e2182e2^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Ukrainian_MLF_X21-96557^|x64
echo zh-cn^|50011551c0f006707282f0fc6e263f8781fc5f10^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Chinese_Simplified_MLF_X21-96489^|x64
echo zh-tw^|b1c83f074d44fe112709a4f839ee346237d43a51^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_64-bit_Chinese_Traditional_MLF_X21-96491^|x64
echo ar-sa^|de82ecaeab48a9157d915fbc9865bbf559be09d7^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Arabic_MLF_X21-96482^|x86
echo bg-bg^|4ebc54f93589bc32cae87c01653cb90d7535daba^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Bulgarian_MLF_X21-96486^|x86
echo cs-cz^|9a990f1f05d2cb124ab924e7b1ecbd67b7ec2f81^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Czech_MLF_X21-96494^|x86
echo da-dk^|007d1c54fda9297e128c121434ca4effbf5b4fee^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Danish_MLF_X21-96496^|x86
echo de-de^|9f8bb1462e7ff0daf960724f6dcdd4d950eb8783^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_German_MLF_X21-96512^|x86
echo el-gr^|68f1e0c0bcf2df6bf92758194db52262baeb672a^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Greek_MLF_X21-96514^|x86
echo en-gb^|2bdcc9f823843d0e671851189e79299e17401460^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_English_International_MLF_X21-96502^|x86
echo en-us^|bdeb8f7867cb8dc9bf14869d621ad9b94fa01e3c^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_English_MLF_X21-96500^|x86
echo es-es^|95211d9f58a5e9d98ce181589823967c62c14b64^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Spanish_MLF_X21-96546^|x86
echo es-mx^|4b343f6992f3d1924e8ff84f07a217b3f2a7f890^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Spanish_Latam_MLF_X21-96548^|x86
echo et-ee^|cc460079e1ba0f451ac0171ed0beb04c05bd0f25^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Estonian_MLF_X21-96504^|x86
echo fi-fi^|2a1f1962dfcfd8f662d4d42a4826a9acc3ae1b64^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Finnish_MLF_X21-96506^|x86
echo fr-ca^|afc0691ab6317239c6085902d7691b8482757a97^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_French_Canadian_MLF_X21-96510^|x86
echo fr-fr^|889405856de5969a78021d35eb044c53ee34c4d2^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_French_MLF_X21-96508^|x86
echo he-il^|ad8f4025d3968a0e3315e6179796de75e7467115^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Hebrew_MLF_X21-96516^|x86
echo hr-hr^|a04ceb35a114d11469db3e1f288010b44dbdaeb3^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Croatian_MLF_X21-96492^|x86
echo hu-hu^|31b7cf4a74dd4a53aaee85eae801eecd08068b52^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Hungarian_MLF_X21-96518^|x86
echo it-it^|11d713056e39c862fe856cda35d91cfaf9538182^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Italian_MLF_X21-96520^|x86
echo ja-jp^|bb85f9017ce48f5ff2cdc7a6300e6da15e9cc73e^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Japanese_MLF_X21-96522^|x86
echo ko-kr^|61b6b1ef4bb5b30b8bd3ead0f594ca49701302a6^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Korean_MLF_X21-96524^|x86
echo lt-lt^|6f9bea56eb4c1e881cc04349decb59bb6516210e^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Lithuanian_MLF_X21-96528^|x86
echo lv-lv^|a17993a0b23e6da3678158187e96cb78ef5b9902^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Latvian_MLF_X21-96526^|x86
echo nb-no^|77f309c215d0cf21ba11eb1d951cc555ec3980f0^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Norwegian_MLF_X21-96530^|x86
echo nl-nl^|292553aadf56e6303c78a915d434e9db256988d3^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Dutch_MLF_X21-96499^|x86
echo pl-pl^|17edd9fa70a4375ce496cea45c0637b5ba2fb5e2^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Polish_MLF_X21-96532^|x86
echo pt-br^|8ebadc2358905ae2475c46adbb6596538943549d^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Brazilian_MLF_X21-96484^|x86
echo pt-pt^|084e43bcf9e279803672df12c26693b8837cf595^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Portuguese_MLF_X21-96534^|x86
echo ro-ro^|1a6e94b66e0553c9099ea485efb0f8ba3c9f548c^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Romanian_MLF_X21-96536^|x86
echo ru-ru^|8a13d66a0f254c7f8a7395000aa4f312f7fa2b42^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Russian_MLF_X21-96538^|x86
echo sr-latn-rs^|f8c92f3fdfefdf2e922f5523c2a9fec37616aad6^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Serbian_Latin_MLF_X21-96540^|x86
echo sk-sk^|197941e0c5580955e9076cc8e9d770b774999549^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Slovak_MLF_X21-96542^|x86
echo sl-si^|dd80f7cac4fd185a86685fb91488dc498b9852d6^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Slovenian_MLF_X21-96544^|x86
echo sv-se^|961f8b9cefbca07a95365f6d59ba95d6d8bb5da8^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Swedish_MLF_X21-96550^|x86
echo th-th^|5c74a47b1ba41edf0557c2dd02e3f202ced5d611^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Thai_MLF_X21-96552^|x86
echo tr-tr^|7a6171dd914a9506f3d4fffc1fb20cf418c86287^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Turkish_MLF_X21-96554^|x86
echo uk-ua^|b352b938a9b4c7d253165c2fe91de7bfd4dab3ae^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Ukrainian_MLF_X21-96556^|x86
echo zh-cn^|39e13bad06c89041d6053fef41616c6f68b9e27a^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Chinese_Simplified_MLF_X21-96488^|x86
echo zh-tw^|e4807873342c04fc6cebe2c32417f139cf127869^|SW_DVD9_Win_Pro_Ent_Edu_N_10_1809_32-bit_Chinese_Traditional_MLF_X21-96490^|x86
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::Encrypted64 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:EncryptedStream64
>>encrypted.txt (
echo a16702dff2e200e49b67bf550dcb4c78^|c32f35e8130c72e103694a8ad4926c8c34317c50c0d03933a0c8a9dad1d7dace^|d3471276721b20f374846a70f7d1c8bc
echo c34586e7e513f589dc06786270f85385^|52659bd484fe1a4952e96c6296e26a855fed403d1583a4b81dffcc1d8a0d9d74^|baf13f96a98a1a8926ff4dc041b17a24
echo 573429c1ed8dc1d390235f61b0d0d712^|8b928bd791c09c3d8056685eeb4341289bbd41f2fe3ca5b5074dce0a17d2c7f4^|7e657b755e0e46864213701e48a54ab5
echo 272e9bbe871ec83e58b54856aee5ffc3^|6b6e7f772458638d816b62dfd302fc7c4bada345c773326b6f3ba630a888e762^|601602e62207e75252d0507501e32f21
echo 5d03c461ac14c8892c818017a789d923^|94eaa76f0c0833d61777e389f86eb97d46bcd783eea404b349e1e004e419b11b^|fb1ec082e8cd5ed1c6b6c91c0135db2f
echo 0c4269dd5c6a3672d4954bd6b0022d34^|6020e090c54004adff791fe9c2fbce444da6f9b2b5557999b236cba2c4218e20^|12474eadc501a3bdd684d13503e9310f
echo 1873cebca657b3cda464c24834a07fcf^|190659a5e84c93cdb5c7c5b31fb4da74551ca1dce7fd89ef9605c1dd18e995a7^|45a904a2e0c2bd22ced836147466894a
echo f2c86923e4be0c724ab9269c48d2fa31^|01f54810d94d0ed8cdfa076e232305020f09bb414217092cde90823523df350d^|7a9780fcd74ef69efb810298b4c13ba7
echo a39bf2e512acf05da4cb879d99e6997a^|ebd5cab6cd6b2801f5c42c9d2266e6bd46b091425a9a1648ca12aa4368fe34ba^|f1704157c9cf6bb426bc8974916f32d9
echo 3db8482eb0153c2764ccc3211fc346cc^|eee35feb332fbd1b1b510134dd79ffa55c18d990dcba0b368dd2bcb67f2afc35^|031d27346cf8dd8aa00a07d357caae4e
echo ee95af07331a27c5b2fd272466587da1^|7462e95b63d617419c0d850c61b3c8d168a9c7c001212f4875b93631eac40b12^|b39e77baea8981a68e5f2a1d510d90b6
echo 115e726661722faf95273da83174851a^|c647e02b46d8ce52e4d0b095fe2a2690415ab5c4638d5d23c5ec3d558de9153b^|53c115e0555831db0e00b4fbe161240a
echo dfb1a6ec6131d8514c8accd775a94012^|7f9f4ce5455efc88e63d41cab902d00d0c8c4cc9efac6d1ad928b423d4b3726d^|65014e5ae59e2fd38815e9c3d49bb7fc
echo 02cdd27a0510e30f3a3245024d253d91^|086915dcfb08d54912f206f1cd8a23dbb95007ce71337fbd1dec35df71241ff8^|9c9abfc4377a42ebb8a86a080397f041
echo 8a5205b1786b8e21345fb29267a3e8b3^|9aa952e4a2ef04dd0664868a87cbff8362a72c09aaad4e3850e040e4788cab7a^|197a1ce239f3298ed52f7511dc54e14e
echo 723cdfa44d7ea775e60856a35bf0a107^|54068bdb113639de5bb986423fb0369ecac3d4ec49a387af210053d8eabb4fe1^|c30a6a26f1f0e9daacc53a1c09ff9816
echo 4b2074a6cba5bd32aa9050441661704d^|2a9930f6d0a44a2fca7eea254b68c2919aea730fc9ff7d2b6ff75c5c4ff53f88^|f19eeddd3d640f9a2d4eb74fa43e6e1c
echo 665efa9efb538a76aa821295c358f930^|6419144cc47a34727c113275933e604adda778bb135e08fb04649b5e2389c52e^|e6171fe2d6026a507fc65e937b22e2b0
echo a30404f1a5327bd2e1bee4f94d3adeba^|7a5a4b1dfe92165e7664a2ea2efb393470062bc381ba1dc9294ba50a93f05ec1^|b69314823ccdd75d4a7776e158965373
echo ffe0ec695df6fea4c1f46a523f349d46^|6daecbb063a07d635b1a9d424e32a5d1e23121e2d6fca843d4c64d5643842196^|3f8b446404127b721db403a1837fa8a7
echo d4437c437d36bb371eaef726d7ad6137^|9dc2ae6e8014c11bcdeb589836681b9335b417d97b4b6cc68aec10c77442f0aa^|2202b0abe0bf6517d8c7b119ffe791d9
echo e7b588dcf33af7fb84d5bee64f16400c^|79fe3ef905040fbe5d163c3359aa1d32b72bb5d74839dcc9aab706a2c55a79dd^|ddb1a9a491058a7ef15f3de42aae432f
echo c391db480088cb08a8d0b524239d32a6^|ab90122c27e561561aed0c3bcbbb5d4429d5d6c38baff439d7530d175d7b6e8f^|67874c8f1e6836aa76320f64bc5c7995
echo d3aac209455f1e45b4035f79516d66a4^|b2c9f2749f49a65741227a432962a63953d2c5256afcd9dbe54a9ec77529ca21^|249faf67ad67aa930de338fca0c3237e
echo 714d1f0e406e3c0fa8356a26350e1087^|a3b8674ea4129e19206bd93469062b185cb7d6140d74f4f8afd802fcb28a891c^|f5642ebd53f7f9297e1b84be73bbeca5
echo 3f9c356e411e295fe9fc3a9dc2fc73a8^|61b8e2d997be2dcc7755e683268f12b40bd95589bca999e357b21044465e2aed^|1c4aaf82ab02ca5b3e9e1eac4dc5bf9e
echo 8cde614062a68dd71cc7ba0eab08aa67^|b9266927197b0efec11f875e5611841ced77ac3997cf328fe495f1654d116315^|446d8afd8dacb49a4babfb4176d8b996
echo 2b7d5d677fbbe295f6d16ef3b619eddf^|0e719883cb487917fffde7d0714b5bd2fb0a0044a257f31f494c89bd69fa7b27^|ce372bdb5c4013fb2da8cb0432b54838
echo e29977f808469f219352f12f82fdc844^|0d8eee159f6906db2b7a59f8788629d49c170a80729f78c07e6350d6845df8e8^|fffea074f21add958f3da30917b66cc8
echo c5edc421331a0775fb1f297025cb74a2^|6bfba22bb54c44b5e48377acfc38481277f06bd67660da14b0cb5f0304d341d7^|21b8f54dea3f3f84a22195438f3e02c7
echo b6f63c59940b79b9fa906698d7e6ca4d^|2cb08124706a2758bfbc7b684a42444b7f60d87dbf23cc0d17a22b821df3656b^|82d0984973d264f8ac614ed04b2e956d
echo 8cece8faa8372d9a7cea89aa963fdc8a^|5515431ab114cdec0c65550d079a8cc178a170d1e331b84ed25b9df70cd0440f^|ba8b5377051fe26b711d3146a0e2a80e
echo 15cf6de72c4022701a585c7dc21357ce^|c01999e5be51a3bc2f591304763be1ebf6a5a715dcb5969941b08ea113e7365a^|473d26e73c1e66c9802b3d8527075481
echo e8eb9c825154d293959d93a2d8c61c08^|2e6227b6c3894a760f9bce986bfe09b4237fa385de64d6b517f3b5f6215d4135^|ebb74a759e21050d223312ba08b1c704
echo d4d4158222c56d38ae947dd3d2faaf27^|36f08533200b412a0c4a8693d9b45af24a4d4bdd1d7ca038f06cdd2c4e72e794^|2b9a193c71058f2d194a1527a30caafd
echo 641c419a7e2ff478ec9d68c45d5f7b7f^|67a067ee161c0486331cef8aef69b3040a9ec7355ab1c9bf25adfa5541c8422c^|1a7ace487d827d77fd6200316e8e231e
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::Encrypted86 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:EncryptedStream86
>>encrypted.txt (
echo 752684fc58b7dcf0935e726bad1b0901^|4257140a1635b3080064ec9b26a46a42044c224f94d96f86c6fde0f1a9dc1256^|b4026ea1e6f3ced556408d3c6ba367e0
echo 4114b28a0df7810cd215f81fc87fcac3^|dadf483467207d477f03473af83651ccaac0a27cbc0bb44258922241185b1ace^|1bba0abb3e95e72a95417f4894c1e54f
echo 97433aada51fb3af3a9d43b748f73155^|1ef4f21b3b58454ea310172f24105499f200ebf7ff5dad3848d1c42cc91aecb6^|0c0ebdbf6207a1df1bc73fa4589d8009
echo db53352e475d4b21906137496a71a508^|3f5e0b4a06bd3fd992c4d2bbd45934301815746aba1caef55b5f303155749eec^|518f2c294be526294b0ae2feab3361e8
echo cf365c1f0b72fe19df57a8850f6541d4^|538304da90b42cc5d465dff64cef308e91a58731c88f486d3c6224029665b7dc^|8cfddb17cf483bf1042fc5b478dbb292
echo 26ab3151b1886c7044f1a248e09ef946^|15c41155faa2966484c86362117ba3cb8c1ee981a591417cf5293000ad38e519^|0b4a6154069f3be5a05e8ccbf56d08f1
echo f3235b2d471b85dc80e70b2c2f7227b3^|0c7a7da477f2e66135f81c24949470a0d79f6e07190e69a7e2dce0d027350864^|0530819dac6a84a9694f8840e20e19a9
echo b5872cbb26756fc2681a492f6db58067^|ce7b551bef26edb2008dfa6574955a14fbd2620ad8b5fbb4bdc3b249c817bd4b^|812c53c69bc5c3fdb986a1e4de9cf154
echo ef246ff406f2cd05e3959a9fc75d7db8^|8d91ec779928079ee46dcec33411af85bb36a491202c7babd16ef9a6591b1f17^|33b99c16ab034157fbb5bb7a8f7743e3
echo 07ef2dbaac9479c87335692ef48c91f9^|e913b7fc2bccd6c41950ee2987a5353a404a88219cbe58234a4474f23a6a8750^|cf10a0d353d1ac3451a55ddf1595b309
echo 3360418c2bf736356367ca8228278a7b^|d5b6fc6d0ac090a98437a74b006e72b7123386b906c311bb2d664e221c14917c^|c2389e409bda87e8ef28515df76bb9ae
echo e371123fdb820ad3a972a228022e3e51^|17f67bec926d31be34700c8414c3c2144859bd2353c63ab350dd1a03982e469a^|e2842398186b45d8de17610a7543525a
echo f25a8f99a5fbf95ae24b1fdee7514244^|dfc348309609107b25d01e41c2c53f418b963db22c3481ce9ae27ef48e8c9a56^|90ba31acbcdf127220216b1670472d7c
echo 0d50e08b825661b946ba705ace14e6cd^|d0e8304f8c1688a566ebee2865352797c479729a73feacf438e82713b5248481^|fa31371eac40b75a39523124b8b84437
echo 5e21d4abca9f30a250c494eaaa5ccf57^|0869e953bf62094a28ff077015dc56979790a1cf622063a41ffd860405818ab8^|fa58ba1bdfd75a1aaff69148a2526585
echo 9d368dad2385e115de765f1493f78fea^|04582603859675507524c839cc62f35128ce7ecd25674ecb44b6efe0eeba786c^|44e21dd21e15cdfe7b4c9695170f99fa
echo 4cae17c61ed9b8e37bf7e293f99e6d53^|e72df8cca2218f88bf4790ea126ca71dfe7dafde268a5e85d1a2538eff7c8459^|04bd6e55922061dbbc25d8e22c54864d
echo 4ea4d7a89f80d1a46b6dea8c1f12fb25^|ea7aaf4ebbcc80e2e852608b03fe34ceda8a1b6c64d1ebfe114359f28a74c8dd^|f43673fdb302b2566adac97014267946
echo 4abb17d1c9c822072a8a78ed0c1d895b^|eb1208990b4e2d7dc71578d6704fd38a36b2dda182cb5478b3a6dc0e3b3cc929^|705934ccd09e940d9d7fc848bec3018d
echo 7a81a69f9a46e6cb291fbabfaed0a458^|9700f80fa5d82ca6c31a43ad5b63b72f3505e1c6152f9ffd858355637d79ac02^|6cd835d8241d54a039c31fbf75673711
echo 524a933f46857af2605b90a5f64780ac^|15491855c9838aecaa7fac665f3852543056a8821a49770de6455ec6ede40bb9^|d9d6e10b8554c6eb92b07227ed875ca6
echo 41c106ebffec6e16741d250e98c32cfd^|e51e08d4253b012a10787f4d3d0c9160112602a14b3b1f4095dbd0b66279a9d5^|0eae8835f9dac8bddfac255610e12efc
echo 68d28bdce7aebe88230a53146534a54c^|a48709dadacddca27ba41b466b27491e90a72d49c540b08897b9ae0b7114f99a^|c21de176dd7947b7039a3de2ca71e7ff
echo 7d8f9b2cd45b1848e74a3e1e999f08cb^|6a018d35c4496cac170db1de660bd634b3944d43ebf3652390c910cda6bbd30d^|a726e283e33307730808b110f76ff32d
echo 1830d7a52f85627e225820a957058a1d^|986e68a3db03bcd6e062adb2fb0d19ad5d56c42e27caeb287d38967b625d63c5^|b56dc628d54901afdd7929a3eef16f14
echo 7fadcb049f2d1184ac71416cb550625d^|055265b822a8d3656cb330baa387a262968818517618ac6df5239613bf604bea^|a2e2e38f1e34fd4619bd16b2e5f4df95
echo b833c2d7f02e48ead07181939e1e8720^|3100b2d9b26d860d526c9d155d0482ce7572e7f4ff10afef2cf3190369bb63ef^|7342f8b36e592d855360e06d66e59eb2
echo 08985f6521af00453ec5492000281d61^|0fbf587f701e4d56087051ccf7fb275259b73077157934dee3f3113bba8303f9^|2f89952dc09112d910adf5e68f985d51
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::Download64 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DownloadStream64
>>download.txt (
echo a16702dff2e200e49b67bf550dcb4c78^|d38f1fe71f7d87787b13ed796c7a89e21f85994e^|https://0x0.st/sk9y.bin
echo c34586e7e513f589dc06786270f85385^|d824c1269f3eed5cff30adb8bc8a415e1aec3457^|https://0x0.st/sk9t.bin
echo 573429c1ed8dc1d390235f61b0d0d712^|f4e3db19c6e5cc561e39cff1983434c0cebc88dc^|https://0x0.st/sk9v.bin
echo 272e9bbe871ec83e58b54856aee5ffc3^|8972bce2dd76e8c9dcebc6adb0eebac1f0126ee9^|https://0x0.st/sk9w.bin
echo 5d03c461ac14c8892c818017a789d923^|581b518c16fbcb57e08e70e33abecbd68e7e7ba3^|https://0x0.st/sk9x.bin
echo 0c4269dd5c6a3672d4954bd6b0022d34^|aabc3a0e64b342f7d9f716d67ed82540c9cd531f^|https://0x0.st/sk93.bin
echo 1873cebca657b3cda464c24834a07fcf^|25b6a1248f9b7d369ac180c55a78161f218a15dc^|https://0x0.st/sk9Y.bin
echo f2c86923e4be0c724ab9269c48d2fa31^|a33e7663821d692f2f6e8cfc38caeb72c2b50596^|https://0x0.st/sk9g.bin
echo a39bf2e512acf05da4cb879d99e6997a^|c916bfaa84d5ad0164d390fe9244898de87a5eb8^|https://0x0.st/sk9E.bin
echo 3db8482eb0153c2764ccc3211fc346cc^|022eb9ae273acbfb2afc751702f87cf47058a3fd^|https://0x0.st/sk96.bin
echo ee95af07331a27c5b2fd272466587da1^|260c314dc98f7ec8d0d3d2b9ed7ca1712fe982de^|https://0x0.st/sk9I.bin
echo 115e726661722faf95273da83174851a^|e4a2a6fa6aff0a7a48e59ecf42fc8ffbc1b2b1a8^|https://0x0.st/sk9l.bin
echo dfb1a6ec6131d8514c8accd775a94012^|2b94ddb2035a9c1a2199f35cebcfab502263a8ce^|https://0x0.st/sk9U.bin
echo 02cdd27a0510e30f3a3245024d253d91^|f7003095a6c0682262c3a0f8b65d969ffbfad742^|https://0x0.st/sk90.bin
echo 8a5205b1786b8e21345fb29267a3e8b3^|50d0920ec30ba2095fd1e2bf5f9bcef14e9e05cc^|https://0x0.st/sk9G.bin
echo 723cdfa44d7ea775e60856a35bf0a107^|43ddab5f03b6ef3a58442a325e52a21a69054a9a^|https://0x0.st/sk9D.bin
echo 4b2074a6cba5bd32aa9050441661704d^|20077293d582acb23cd01d79667abe9b150139ad^|https://0x0.st/sk9k.bin
echo 665efa9efb538a76aa821295c358f930^|ac0025fa8720c5d46d68f1345fee6de02bcf94cf^|https://0x0.st/sk9d.bin
echo a30404f1a5327bd2e1bee4f94d3adeba^|8691485150c71cd50be419fbad2f1560308a64ed^|https://0x0.st/sk9n.bin
echo ffe0ec695df6fea4c1f46a523f349d46^|fb0161ccf2eac7ca7e7f0be3fd03947d6199526a^|https://0x0.st/sk95.bin
echo d4437c437d36bb371eaef726d7ad6137^|3952bdd4398f776debd55cdf6e9c7087d8039f62^|https://0x0.st/sk9R.bin
echo e7b588dcf33af7fb84d5bee64f16400c^|381fb1d49121c8336a1ff119b0ecd2d0ca300b3a^|https://0x0.st/sk97.bin
echo c391db480088cb08a8d0b524239d32a6^|a86d4c4e030b9d20ee5a58a43aba377acae0ac0d^|https://0x0.st/sk9h.bin
echo d3aac209455f1e45b4035f79516d66a4^|1c8493e16e2415f1b1ed46360236cf64551b7d33^|https://0x0.st/sk9F.bin
echo 714d1f0e406e3c0fa8356a26350e1087^|a17c8271928a913d5a8f5f24217289e26d7297f2^|https://0x0.st/sk9C.bin
echo 3f9c356e411e295fe9fc3a9dc2fc73a8^|14c3b205f128647244670eb4f0eb24738ed92de3^|https://0x0.st/skpr.bin
echo 8cde614062a68dd71cc7ba0eab08aa67^|6ad049a9b814b629bb74dd0de20e58444254fe91^|https://0x0.st/skps.bin
echo 2b7d5d677fbbe295f6d16ef3b619eddf^|e3c8be4d6fe7537860e272229f70ec3e703f5b34^|https://0x0.st/skpz.bin
echo e29977f808469f219352f12f82fdc844^|c402c59b1a37a1d093ca562acad73512157f6dbc^|https://0x0.st/skpi.bin
echo c5edc421331a0775fb1f297025cb74a2^|da0d64fb7f7077b9fb6b5003b220aeb3f81401e4^|https://0x0.st/skp-.bin
echo b6f63c59940b79b9fa906698d7e6ca4d^|99c5fde8bdbc848355ee9e52634ce2656796fe4e^|https://0x0.st/skpo.bin
echo 8cece8faa8372d9a7cea89aa963fdc8a^|386f48b9f32bdb999a57c72a312b249e520ef045^|https://0x0.st/skpH.bin
echo 15cf6de72c4022701a585c7dc21357ce^|9f4310e1c961e9c4db111bb0780f69eb91c09521^|https://0x0.st/skpX.bin
echo e8eb9c825154d293959d93a2d8c61c08^|547353830918fb6ba96ce4a82d82e07acc56cc5a^|https://0x0.st/skp8.bin
echo d4d4158222c56d38ae947dd3d2faaf27^|a979ede361a42de03b20cb3e36ca3aac8c0f8c3a^|https://0x0.st/skpK.bin
echo 641c419a7e2ff478ec9d68c45d5f7b7f^|7de25305927bdbded6bb799eda82c13ec1a93261^|https://0x0.st/skpP.bin
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::Download86 STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DownloadStream86
>>download.txt (
echo 752684fc58b7dcf0935e726bad1b0901^|bed042a7543d24e5e7abcdba95ad83dd4bb99386^|https://0x0.st/skpF.bin
echo 4114b28a0df7810cd215f81fc87fcac3^|5a3cb8faeebf287b415ecca46f326147f41c1c1f^|https://0x0.st/skpC.bin
echo 97433aada51fb3af3a9d43b748f73155^|e6c974f970755792bb293f9a650b31346bf6a669^|https://0x0.st/skfr.bin
echo db53352e475d4b21906137496a71a508^|cda4886f948f035c92875d9b2c5e0db40a455c10^|https://0x0.st/skfs.bin
echo cf365c1f0b72fe19df57a8850f6541d4^|87d3afd687a37491e12f5d9c4119f12da2ccd02b^|https://0x0.st/skfz.bin
echo 26ab3151b1886c7044f1a248e09ef946^|fc6977fc580303314d240fe74ff15f81ead547ea^|https://0x0.st/skf-.bin
echo f3235b2d471b85dc80e70b2c2f7227b3^|74be1fdc7a9e31c0f4475ba8365cd1d61bb05cd1^|https://0x0.st/skfo.bin
echo b5872cbb26756fc2681a492f6db58067^|2d5f0f7918673836326aa3836e712c634bdd1441^|https://0x0.st/skfH.bin
echo ef246ff406f2cd05e3959a9fc75d7db8^|dd042c85e7812092b3e4ac9d05273d38a8c70fc0^|https://0x0.st/skfX.bin
echo 07ef2dbaac9479c87335692ef48c91f9^|1f00b6a973704aec161f1614e8a6b1be1250e69d^|https://0x0.st/skf8.bin
echo 3360418c2bf736356367ca8228278a7b^|8323c92d81cd4d03fe8607e961777a7603adbf21^|https://0x0.st/skfK.bin
echo e371123fdb820ad3a972a228022e3e51^|43f454d8275aef4f11e7c5753ad1059b551f843a^|https://0x0.st/skfP.bin
echo f25a8f99a5fbf95ae24b1fdee7514244^|12240169b0979458d24d733334afb0c9a9c78bbc^|https://0x0.st/skfN.bin
echo 0d50e08b825661b946ba705ace14e6cd^|3c314e1e9b2c049723393641a4c28e1e2accfc0f^|https://0x0.st/skfq.bin
echo 5e21d4abca9f30a250c494eaaa5ccf57^|a8dd6270b8c159408ad366116d3cddebe7982da4^|https://0x0.st/skfb.bin
echo 9d368dad2385e115de765f1493f78fea^|a92105cade06cd2313dfc2c255eb05a5c3e1c5eb^|https://0x0.st/skfc.bin
echo 4cae17c61ed9b8e37bf7e293f99e6d53^|8497ef3c3829634fc2345df135156fc152da88e3^|https://0x0.st/skfA.bin
echo 4ea4d7a89f80d1a46b6dea8c1f12fb25^|02085d7a59b58ed9131038e581eebe23b22ca566^|https://0x0.st/skfm.bin
echo 4abb17d1c9c822072a8a78ed0c1d895b^|92a8193b2c80f667f146642c83c4af038b11311c^|https://0x0.st/skfa.bin
echo 7a81a69f9a46e6cb291fbabfaed0a458^|0649e06bd332c2437c179a33460442fc5902ba73^|https://0x0.st/skfB.bin
echo 524a933f46857af2605b90a5f64780ac^|03d9c41f2b60f1c0d950b2349219d670970cb508^|https://0x0.st/skfu.bin
echo 41c106ebffec6e16741d250e98c32cfd^|301875839bd51ba469a70e5a5de382e17b4dcf7a^|https://0x0.st/skfS.bin
echo 68d28bdce7aebe88230a53146534a54c^|7977d9bd0d64cf8933316355f47188f2eb3009d9^|https://0x0.st/skfQ.bin
echo 7d8f9b2cd45b1848e74a3e1e999f08cb^|9285dae1181a9de948a8ae7fca259ce565eb326c^|https://0x0.st/skfj.bin
echo 1830d7a52f85627e225820a957058a1d^|d0d0a74c86207e7f3f4eea185eef8062e15d79f9^|https://0x0.st/skfe.bin
echo 7fadcb049f2d1184ac71416cb550625d^|3f6ea767d80ad2978e0845a4a043ef9561b4046e^|https://0x0.st/skf2.bin
echo b833c2d7f02e48ead07181939e1e8720^|bddecb9e075fbbfe21316a85561f77e259eba61e^|https://0x0.st/skf_.bin
echo 08985f6521af00453ec5492000281d61^|d53f8d1ada051eb688232e028e32a31246f6c092^|https://0x0.st/skfL.bin
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBDownSh STREAMLINED
::===============================================================================================================
::===============================================================================================================
:DownShStream
>>download.sh (
echo #^^!/bin/bash
echo:
echo if [ -z "$1" ]; then
echo    echo "Please specify sharelink"
echo    exit
echo fi
echo:
echo share="$1"
echo fileName="$2"
echo:
echo link="https://pcorakel.stackstorage.com/s/$share"
echo dlLink="https://pcorakel.stackstorage.com/public-share/$share/download"
echo:
echo output=`./curl "$link" -D- -s`
echo token=`echo "$output" ^| sed 's/^>/^>\n/g' ^| grep -i CSRF-TOKEN ^| sed 's/.*content="//g;s/"^>//g'`
echo cookie=`echo "$output" ^| grep -i Set-Cookie ^| sed 's/Set-Cookie: /Cookie: /g;s/;.*//g'`
echo:
echo download="archive=zip&all=false&query=&CSRF-Token=$token&paths[]=/$fileName"
echo:
echo ./curl "$dlLink" -d "$download" -O -J -H"$cookie"
)
goto:eof
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
:================================================================================================================
::DBgetLinkSh STREAMLINED
::===============================================================================================================
::===============================================================================================================
:getLinkShStream
>>getLink.sh (
echo #^^!/bin/bash
echo:
echo if [ -z "$1" ]; then
echo    echo "Please specify product ID"
echo    exit
echo elif  [ -z "$2" ]; then
echo    echo "Please specify file name"
echo    exit
echo fi
echo:
echo function uuidGen {
echo    local tmp
echo    local i=0
echo    local string=
echo:
echo    while [ $i -lt 32 ]; do
echo        i=$^(^( i+1 ^)^)
echo        tmp=$^(^( $RANDOM%%16 ^)^)
echo:
echo        case $tmp in
echo        10^) tmp='a' ;;
echo        11^) tmp='b' ;;
echo        12^) tmp='c' ;;
echo        13^) tmp='d' ;;
echo        14^) tmp='e' ;;
echo        15^) tmp='f' ;;
echo        esac
echo:
echo        case $i in
echo        8^|12^|16^|20^) tmp=$tmp- ;;
echo        esac
echo:
echo        string=$string$tmp
echo    done
echo:
echo    printf "$string"
echo }
echo:
echo uuid=`uuidGen`
echo:
echo productId="$1"
echo fileName="$2"
echo:
echo getLangs="http://www.microsoft.com/en-us/api/controls/contentinclude/html?pageId=a8f8f489-4c7f-463a-9ca6-5cff94d8d041&host=www.microsoft.com&segments=software-download%%2cwindows10ISO&query=&action=getskuinformationbyproductedition&sessionId=$uuid&productEditionId=$productId&sdVersion=2"
echo getLink="https://www.microsoft.com/en-us/api/controls/contentinclude/html?pageId=160bb813-f54e-4e9f-bffc-38c6eb56e061&host=www.microsoft.com&segments=software-download%%2cwindows10ISO&query=&action=GetProductDownloadLinkForFriendlyFileName&sessionId=$uuid&friendlyFileName=$fileName&sdVersion=2"
echo postData="controlAttributeMapping="
echo errorText="We encountered a problem processing your request"
echo:
echo ./curl "$getLangs" -d"$postData" ^> /dev/null
echo output=`./curl "$getLink" -d"$postData" -s`
echo:
echo if ^(echo $output ^| grep "$errorText" ^> /dev/null^); then
echo    echo "ERROR"
echo    exit
echo fi
echo:
echo echo "$output" ^| grep -o 'http.*software-download.*"' | sed 's/",download.*//g'
)
goto:eof
