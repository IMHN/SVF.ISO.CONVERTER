:: Code by s1ave77 [frontend script] // [forums.mydigitallife.info]
:: Bash script for File download by mkuba50 // [forums.mydigitallife.info]
:: SVF Provider Enthousiast // [forums.mydigitallife.info]
:================================================================================================================
::===============================================================================================================
@echo off
pushd %~dp0
if NOT "%cd%"=="%cd: =%" (
	call :SpaceTest
    goto :EOF
)
(cd /d "%~dp0")&&(NET FILE||(powershell start-process -FilePath '%0' -verb runas)&&(exit /B)) >NUL 2>&1
setlocal EnableExtensions
setlocal EnableDelayedExpansion
:================================================================================================================
::===============================================================================================================
pushd %~dp0
set "database1803=files\database.1803.smrt"
set "database1709_1=files\database.1709.1.smrt"
set "database1709_2=files\database.1709.2.smrt"
set "databaseLTSB=files\database.LTSB.smrt"
set "aria2c=files\aria2c\aria2c.exe"
set "busybox=files\ISO\busybox.cmd"
set "busybox2=files\ISO\busybox.2.cmd"
set "svfx=files\svfx.exe"
::===============================================================================================================
::===============================================================================================================
for /f "tokens=2* delims= " %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do if "%%b"=="AMD64" (set vera=x64) else (set vera=x86)

:================================================================================================================
::===============================================================================================================
:================================================================================================================
::===============================================================================================================
:SVFISOMainMenu
for /f %%I in ('powershell ^(Get-Host^).UI.RawUI.WindowSize.width') do set "cw=%%I"
call :TITLE
cls
call :MenuHeader "[HEADER] MAIN MENU [SYSTEM: %vera%]"
echo:
echo [CREDIT] Enthousiast for SVF Repo [forums.mydigitallife.net]
echo [CREDIT] mkuba50 for SVF Download Script [forums.mydigitallife.net]
echo:
call :MenuFooter
echo:
echo      [1] START 1803 PROCESS [17134.1]
echo:
echo      [2] START 1709 PROCESS [16299.125]
echo:
echo      [3] START LTSB 2016 PROCESS [14393.0]
call :Footer
echo      [D] DOWNLOAD/RESUME SOURCE ISO FILES
call :Footer
echo      [E] EXIT
echo:
call :MenuFooter
echo:
CHOICE /C 123DE /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 (
	set "show=1803"
	set "build=17134.1"
	goto:SVFISOProcess1803
)
if %errorlevel%==2 (
	set "show=1709"
	set "build=16299.125"
	goto:SVFISOProcess1803
)
if %errorlevel%==3 goto:SVFISOProcessLTSB16
if %errorlevel%==4 goto:SourceISODownload
if %errorlevel%==5 goto:EXIT
goto:SVFISOMainMenu
:================================================================================================================
::===============================================================================================================
::1803 PROCESS
:SVFISOProcess1803
pushd %~dp0
::===============================================================================================================
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
CHOICE /C CB /N /M "[ USER ] [C]onsumer or [B]usiness (VL) ISO ?:"
if %errorlevel%==1 (
	if "%build%"=="17134.1" set "type=consumer"
	if "%build%"=="16299.125" set "type=edition_version"
)
if %errorlevel%==2 (
	if "%build%"=="17134.1" set "type=business"
	if "%build%"=="16299.125" set "type=edition_vl_version"
)
call :Footer
call :LangChoice
::===============================================================================================================
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
if "%build%"=="17134.1" (
	for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%database1803%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
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
if "%build%"=="16299.125" (
	for /f "tokens=1,2,3* delims=|" %%a in ('type "%database1709_2%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
		set "fshare=MLATBBhtSajfaLz"
		set "fhash=%%b"
		set "fname=%%c"
	)
	if "%type%"=="edition_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406359"
		set "sihash=36005d054f732119bbb00fd9a0e141d54712d751"
		set "sishare=9JpXNkAkwCUsqcy"
	)
	if "%type%"=="edition_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406711"
		set "sihash=ea214ee684a5bb8230707104c54a3b74d92f1d69"
		set "sishare=Mfxoh7M2KNorBaE"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x86" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us"
		set "siehash=4a75747a47eb689497fe57d64cec375c7949aa97"
		set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406182"
		set "sihash=6eeff9574366042ed5ad50c48f406ce10ef20e10 "
		set "sishare=VRdCKPETWzFHOGH"
	)
	if "%type%"=="edition_vl_version" if "%arch%"=="x64" (
		set "siename=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
		set "siehash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
		set "sielink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
		set "siname=en_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406172"
		set "sihash=1851a0007321fa084145ea24b8d30bf7a72bf1c6"
		set "sishare=SB0WYFMT6ZItmmc"
))
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
if %errorlevel%==2 goto:SVFISOMainMenu
::===============================================================================================================
cls
call :Header "[HEADER] %show% SVF ISO CONVERSION"
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
if not exist "%siname%.iso" (
	if not exist "%siename%.iso" (
		echo [ INFO ] Downloading Eval ISO.
		call :Footer
		call :AriaWrite "%sielink%", "%siename%.iso", "%siehash%"
		"%aria2c%" -x16 -s16 -d"%cd%" -i "aria.txt" -R -c --file-allocation=none --check-certificate=false
		call :Footer
		if exist "aria.txt" del /f /q "aria.txt" >nul 2>&1
	)
	if exist "%siename%.iso" (
		echo [ INFO ] Source Eval ISO present.
		echo [ INFO ] Checking Eval ISO Hash.
		echo [ INFO ] Hash  : %siehash%
		call :Footer
		xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
		for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %siename%.iso') do set "dhash=%%a"
		if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
		if not !dhash! equ %siehash% (
			files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
			echo [ INFO ] Hash  : !dhash!
			call :Footer
			pause
			goto:SVFISOMainMenu
		)
		if !dhash! equ %siehash% (
			files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
			echo [ INFO ] Hash  : !dhash!
			call :Footer
		)
	)
	if not exist "%siname%.svf" (
		echo [ INFO ] Downloading Source ISO SVF.
		echo [ INFO ] Name  : %siname%
		call :Footer
		if "%build%"=="17134.1" call %busybox% "%sishare%", ""
		if "%build%"=="16299.125" call %busybox% "%sishare%", ""
		call :Footer
		pushd "%~dp0"
		move "files\ISO\%siname%.svf" ".\" >nul 2>&1
	)
	echo [ INFO ] Creating Source ISO.
	echo [ INFO ] Name  : %siname%
	call :Footer
	xcopy "files\ISO\smv.exe" /s ".\" /Q /Y >nul 2>&1
	smv x %siname%.svf -br .
	if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
	call :Footer
)
echo [ INFO ] Checking Source ISO Hash.
echo [ INFO ] Hash  : %sihash%
call :Footer
xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %siname%.iso') do set "dhash=%%a"
if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
if not %dhash% equ %sihash% (
	files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
	pause
	goto:SVFISOMainMenu
)
if %dhash% equ %sihash% (
	files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
)
if "%lang%"=="en-us" goto:SourceChoiceOTHER
echo [ INFO ] Downloading SVF ^(if not already pesent^).
echo [ INFO ] Name  : %fname%
call :Footer
if not exist "%fname%.iso" (
	if not exist "%fname%.svf" (
		if "%build%"=="17134.1" call %busybox% "%fshare%", "%fname%.svf"
		if "%build%"=="16299.125" call %busybox% "%fshare%", "%fname%.svf", "%arch%", "%type%
		call :Footer
		pushd "%~dp0"
		move "files\ISO\%fname%.svf" ".\" >nul 2>&1
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Target: %fname%
	echo [ INFO ] Hash  : %fhash%
	call :Footer
	xcopy "files\ISO\smv.exe" /s ".\" /Q /Y >nul 2>&1
	smv x %fname%.svf -br .
	if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
	call :Footer
)
echo [ INFO ] Checking Target ISO Hash.
echo [ INFO ] Hash  : %fhash%
call :Footer
xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %fname%.iso') do set "dhash=%%a"
if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
if not %dhash% equ %fhash% (
	files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
	pause
	goto:SVFISOMainMenu
)
if %dhash% equ %fhash% (
	files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
)
:SourceChoiceOTHER
pause
goto:SVFISOMainMenu
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
for /f "tokens=1,2,3,4* delims=|" %%a in ('type "%databaseLTSB%" ^| findstr /i "%lang%" ^| findstr /i "%arch%" ^| findstr /i "%type%"') do (
	set "fshare=%%d"
	set "fhash=%%b"
	set "fname=%%c"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x86" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=fd65bfe31af5fd59d8537210cd829fe3e83feeb2"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_x86_dvd_9060010"
	set "sihash=45e72d02ff17125c699558719eb946d8e140c9cc"
	set "siphash=f60802ce368c3e1ce29fa81630af1cb82f579ace"
	set "sipname=2016_LTSB_SVF/%arch%/%fname%.svf"
	set "silink=https://www.upload.ee/download/8416235/31e3310275e913777bb8/9060010.svf"
)
if "%type%"=="_ltsb_x" if "%arch%"=="x64" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=ed6e357cba8d716a6187095e3abd016564670d5b"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_x64_dvd_9059483"
	set "sihash=031ed6acdc47b8f582c781b039f501d83997a1cf"
	set "siphash=f60802ce368c3e1ce29fa81630af1cb82f579ace"
	set "sipname=2016_LTSB_SVF/%arch%/%fname%.svf"
	set "silink=https://www.upload.ee/download/8416239/93f0de2ff3e913777bec/9059483.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x86" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US"
	set "siehash=fd65bfe31af5fd59d8537210cd829fe3e83feeb2"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058202"
	set "sihash=3f8f9811a7e72adf88215060e38ba81340dfb0c0"
	set "siphash=e3067f61491a87a8cf2d0873e43d340e24dcdc6e"
	set "sipname=2016_LTSB_N_SVF/%arch%/%fname%.svf"
	set "silink=https://www.upload.ee/download/8416253/2fbe99201c0113777c32/9058202.svf"
)
if "%type%"=="_ltsb_n" if "%arch%"=="x64" (
	set "siename=14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X64FRE_EN-US"
	set "siehash=ed6e357cba8d716a6187095e3abd016564670d5b"
	set "sielink=http://download.microsoft.com/download/1/B/F/1BFE5194-5951-452C-B62C-B2F667F9B86D/14393.0.160715-1616.RS1_RELEASE_CLIENTENTERPRISE_S_EVAL_X86FRE_EN-US.ISO"
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057894"
	set "sihash=b5d4911bd53ec5029781ade0937dad43c4ed90f6"
	set "siphash=c093f60e8d50794460f3ec5789f4e65e477fc047"
	set "sipname=2016_LTSB_N_SVF/%arch%/%fname%.svf"
	set "silink=https://www.upload.ee/download/8416249/b6cf9cc1119413777c0d/9057894.svf"
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
if %errorlevel%==2 goto:SVFISOMainMenu
::===============================================================================================================
cls
call :Header "[HEADER] LTSB 2016 SVF ISO CONVERSION"
echo [ INFO ] Source: %siename%
echo [ INFO ] Hash  : %siehash%
call :Footer
echo [ INFO ] Downloading Source ISO ^(if not already pesent^).
call :Footer
if not exist "%siname%.iso" (
	if not exist "%siename%.iso" (
		echo [ INFO ] Downloading Eval ISO.
		call :Footer
		call :AriaWrite "%sielink%", "%siename%.iso", "%siehash%"
		"%aria2c%" -x16 -s16 -d"%cd%" -i "aria.txt" -R -c --file-allocation=none --check-certificate=false
		call :Footer
		if exist "aria.txt" del /f /q "aria.txt" >nul 2>&1
	)
	if exist "%siename%.iso" (
		echo [ INFO ] Source Eval ISO present.
		echo [ INFO ] Checking Eval ISO Hash.
		echo [ INFO ] Hash  : %siehash%
		call :Footer
		xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
		for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %siename%.iso') do set "dhash=%%a"
		if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
		if not !dhash! equ %siehash% (
			files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
			echo [ INFO ] Hash  : !dhash!
			call :Footer
			pause
			goto:SVFISOMainMenu
		)
		if !dhash! equ %siehash% (
			files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
			echo [ INFO ] Hash  : !dhash!
			call :Footer
		)
	)
	if not exist "%siname%.svf" (
		echo [ INFO ] Downloading Source ISO SVF.
		echo [ INFO ] Name  : %siname%
		call :Footer
		"%aria2c%" -x16 -s16 -d"%cd%" -o"%siname%.svf" "%silink%"
		call :Footer
		if exist "aria.txt" del /f /q "aria.txt" >nul 2>&1
		pushd "%~dp0"
	)
	echo [ INFO ] Creating Source ISO.
	echo [ INFO ] Name  : %siname%
	call :Footer
	xcopy "files\ISO\smv.exe" /s ".\" /Q /Y >nul 2>&1
	smv x %siname%.svf -br .
	if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
	call :Footer
)
echo [ INFO ] Checking Source ISO Hash.
echo [ INFO ] Hash  : %sihash%
call :Footer
xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %siname%.iso') do set "dhash=%%a"
if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
if not %dhash% equ %sihash% (
	files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
	pause
	goto:SVFISOMainMenu
)
if %dhash% equ %sihash% (
	files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
)
if "%lang%"=="en-us" goto:SourceChoiceLTSB
echo [ INFO ] Downloading SVF ^(if not already pesent^).
echo [ INFO ] Name  : %fname%
call :Footer
if not exist "%fname%.iso" (
	if not exist "%fname%.svf" (
		call %busybox% "%fshare%", "%sipname%"
		call :Footer
		pushd "%~dp0"
		move "files\ISO\%fname%.svf" ".\" >nul 2>&1
	)
	echo [ INFO ] Creating Target ISO.
	echo [ INFO ] Target: %fname%
	echo [ INFO ] Hash  : %fhash%
	call :Footer
	xcopy "files\ISO\smv.exe" /s ".\" /Q /Y >nul 2>&1
	smv x %fname%.svf -br .
	if exist "smv.exe" del /f /q "smv.exe" >nul 2>&1
	call :Footer
)
echo [ INFO ] Checking Target ISO Hash.
echo [ INFO ] Hash: %fhash%
call :Footer
xcopy "files\ISO\busybox.exe" /s ".\" /Q /Y >nul 2>&1
for /f "tokens=1 delims= " %%a in ('busybox.exe sha1sum %fname%.iso') do set "dhash=%%a"
if exist "busybox.exe" del /f /q "busybox.exe" >nul 2>&1
if not %dhash% equ %fhash% (
	files\ISO\busybox echo -e "\033[31;1m[ WARN ] Hash Mismatch!\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
	pause
	goto:SVFISOMainMenu
)
if %dhash% equ %fhash% (
	files\ISO\busybox echo -e "\033[32;1m[ INFO ] ISO Hash matching.\033[0m"
	echo [ INFO ] Hash  : %dhash%
	call :Footer
)
:SourceChoiceLTSB
pause
goto:SVFISOMainMenu
:================================================================================================================
::===============================================================================================================
::SOURCE ISO DOWNLOAD
:SourceISODownload
pushd %~dp0
::===============================================================================================================
cls
call :MenuHeader "[HEADER] SOURCE ISO DOWNLOAD"
echo:
echo      [1] 1803
echo:
echo      [2] 1709
echo:
echo      [3] LTSB 2016
call :Footer
echo      [B] BACK
call :Footer
CHOICE /C 123B /N /M "[ USER ] YOUR CHOICE ?:"
if %errorlevel%==1 set "build=1803"
if %errorlevel%==2 set "build=1709"
if %errorlevel%==3 set "build=1607"
if %errorlevel%==4 goto:SVFISOMainMenu
cls
call :Header "[HEADER] SOURCE ISO DOWNLOAD"
CHOICE /C 68 /N /M "[ USER ] x[6]4 or x[8]6 architecture ?:"
if %errorlevel%==1 set "arch=x64"
if %errorlevel%==2 set "arch=x86"
call :Footer
if "%build%"=="1607" (
	CHOICE /C SN /N /M "[ USER ] [S]tandard or [N] Version ISO ?:"
	if !errorlevel!==1 set "type=_ltsb_x"
	if !errorlevel!==2 set "type=_ltsb_n"
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
	set "silink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x86FRE_en-us.iso"
)
if "%build%"=="1709" if "%arch%"=="x64" (
	set "siname=16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us"
	set "sihash=3b5f9494d870726d6d8a833aaf6169a964b8a9be"
	set "silink=http://care.dlservice.microsoft.com/dl/download/6/5/D/65D18931-F626-4A35-AD5B-F5DA41FE6B76/16299.15.170928-1534.rs3_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
)
if "%build%"=="1607" if "%arch%"=="x86" if "%type%"=="_ltsb_x" (
	set "siname=en_windows_10_enterprise_2016_ltsb_x86_dvd_9060010"
	set "sihash=45e72d02ff17125c699558719eb946d8e140c9cc"
	set "ariascript=files\aria2c\aria.ltsb.%arch%.txt"
)
if "%build%"=="1607" if "%arch%"=="x64" if "%type%"=="_ltsb_x" (
	set "siname=en_windows_10_enterprise_2016_ltsb_x64_dvd_9059483"
	set "sihash=031ed6acdc47b8f582c781b039f501d83997a1cf"
	set "ariascript=files\aria2c\aria.ltsb.%arch%.txt"
)
if "%build%"=="1607" if "%arch%"=="x86" if "%type%"=="_ltsb_n" (
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x86_dvd_9058202"
	set "sihash=3f8f9811a7e72adf88215060e38ba81340dfb0c0"
	set "ariascript=files\aria2c\aria.ltsb.%arch%.n.txt"
)
if "%build%"=="1607" if "%arch%"=="x64" if "%type%"=="_ltsb_n" (
	set "siname=en_windows_10_enterprise_2016_ltsb_n_x64_dvd_9057894"
	set "sihash=b5d4911bd53ec5029781ade0937dad43c4ed90f6"
	set "ariascript=files\aria2c\aria.ltsb.%arch%.n.txt"
)
cls
call :Header "[HEADER] SOURCE ISO DOWNLOAD"
echo [ INFO ] Source: %siname%
echo [ INFO ] Hash  : %sihash%
call :Footer
CHOICE /C SB /N /M "[ USER ] [S]tart or [B]ack ?:"
if %errorlevel%==2 goto:SourceISODownload
call :Footer
echo [ INFO ] Downloading.
call :Footer
if "%build%"=="1607" (
	"%aria2c%" -x16 -s16 -d"%cd%" -i "%ariascript%" -R -c --file-allocation=none --check-certificate=false
)
if not "%build%"=="1607" (
	call :AriaWrite "%silink%", "%siname%.iso", "%sihash%"
	"%aria2c%" -x16 -s16 -d"%cd%" -i "aria.txt" -R -c --file-allocation=none --check-certificate=false
	if exist "aria.txt" del /f /q "aria.txt" >nul 2>&1
)
call :Footer
pause
goto:SourceISODownload
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
title s1ave77s þ S-M-R-T SVF ISO CONVERTER þ v0.03.15
goto:eof
::===============================================================================================================
::VERSION
:VERSION
set "svfisoconverter=v0.03.15"
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
