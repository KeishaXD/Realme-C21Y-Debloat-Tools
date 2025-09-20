:: --- Landing Page ---
: LandingPage
cls
@echo off
title Realme C21Y Debloat Script v4.0
color 0A
echo ================================================
echo    Realme C21Y Debloat Script via ADB
echo    Version : v4.0
echo    Author  : KeishaXD @github
echo ================================================
echo.
echo ===============================================
echo    Make sure:
echo    1. USB Debugging is enabled
echo    2. Phone is connected to the PC
echo    3. ADB is installed and added to PATH
echo ===============================================
echo. 
echo ===============================================
echo    Select an option:
echo    1. Verify USB Debugging
echo    2. Continue to Debloat Script
echo    3. Continue to Restore Script
echo    4. Exit Script 
echo ===============================================
set /p usbchoice="Enter choice (1-4): "
if "%usbchoice%"=="1" goto VerifyUSB
if "%usbchoice%"=="2" goto MainMenu
if "%usbchoice%"=="3" goto RestoreMenu
if "%usbchoice%"=="4" goto ExitScript
goto :eof

:VerifyUSB
adb devices
echo.
pause
goto LandingPage

:: --- Verify USB Debugging ---
:VerifyUSB
cls
adb devices
pause
goto LandingPage

:: --- Main menu ---
:MainMenu
cls
echo ===============================================
echo    Select debloat option:
echo    1. Debloat All
echo    2. Debloat Partial
echo    3. Main Menu
echo ===============================================
set /p mainchoice="Enter choice (1-3): "
if "%mainchoice%"=="1" goto DebloatAll
if "%mainchoice%"=="2" goto PartialMenu
if "%mainchoice%"=="3" goto LandingPage
goto MainMenu

:: --- Partial Menu ---
:PartialMenu
cls
echo ===============================================
echo    Select category to debloat:
echo    1. Google Apps
echo    2. Social and Entertainment
echo    3. E-Commerce
echo    4. Realme Bloatware
echo    5. Office
echo    6. Auto-download Apps [Dont use this if you didn't do a clean flash!]
echo    7. Back to Main Menu
echo ===============================================
set /p partialchoice="Enter choice (1-7): "
if "%partialchoice%"=="1" goto DebloatGoogle
if "%partialchoice%"=="2" goto DebloatSocial
if "%partialchoice%"=="3" goto DebloatEcom
if "%partialchoice%"=="4" goto DebloatRealme
if "%partialchoice%"=="5" goto DebloatOffice
if "%partialchoice%"=="6" goto DebloatAuto
if "%partialchoice%"=="7" goto MainMenu
goto PartialMenu

:: --- Spinner ---
:Spinner
for /l %%i in (1,1,10) do (
    set /a perc=%%i*10
    setlocal enabledelayedexpansion
    set /a mod=%%i %% 4
    if !mod! equ 0 set spin=^|
    if !mod! equ 1 set spin=/
    if !mod! equ 2 set spin=-
    if !mod! equ 3 set spin=\
    cls
    echo Processing... Please wait... !perc!%% !spin!
    ping -n 1 127.0.0.1 >nul
    endlocal
)
exit /b

:: --- Debloat All ---
:DebloatAll
call :Spinner
call :DebloatGoogle
call :DebloatSocial
call :DebloatEcom
call :DebloatRealme
call :DebloatOffice
call :DebloatAuto
echo.
echo =================================================
echo    Debloat All Completed!
echo =================================================
pause
goto MainMenu

:: --- Debloat Google Apps ---
:DebloatGoogle
adb shell pm uninstall -k --user 0 com.google.android.apps.magazines >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.podcasts >nul
adb shell pm uninstall -k --user 0 com.google.android.videos >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.subscriptions.red >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.maps >nul
adb shell pm uninstall -k --user 0 com.google.android.keep >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.docs >nul
adb shell pm uninstall -k --user 0 com.google.android.gm >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.photos >nul
adb shell pm uninstall -k --user 0 com.google.android.feedback >nul
adb shell pm uninstall -k --user 0 com.google.ar.lens >nul
adb shell pm uninstall -k --user 0 com.google.android.apps.wellbeing >nul
echo.
echo =================================================
echo    Debloat Google Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Debloat Social & Entertainment ---
:DebloatSocial
adb shell pm uninstall -k --user 0 com.facebook.katana >nul
adb shell pm uninstall -k --user 0 com.facebook.system >nul
adb shell pm uninstall -k --user 0 com.facebook.appmanager >nul
adb shell pm uninstall -k --user 0 com.facebook.services >nul
adb shell pm uninstall -k --user 0 com.facebook.orca >nul
adb shell pm uninstall -k --user 0 com.zhiliaoapp.musically >nul
adb shell pm uninstall -k --user 0 com.spotify.music >nul
adb shell pm uninstall -k --user 0 world.social.group.video.share >nul
adb shell pm uninstall -k --user 0 com.ss.android.buzz >nul
adb shell pm uninstall -k --user 0 com.linkedin.android >nul
adb shell pm uninstall -k --user 0 com.kwai.bulldog >nul
adb shell pm uninstall -k --user 0 com.yxcorp.gifshow.homepage >nul
adb shell pm uninstall -k --user 0 com.truecaller >nul
adb shell pm uninstall -k --user 0 com.ss.android.ugc.trill >nul
echo.
echo =================================================
echo    Debloat Social and Entertainment Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Debloat E-Commerce ---
:DebloatEcom
adb shell pm uninstall -k --user 0 com.shopee.id >nul
adb shell pm uninstall -k --user 0 com.lazada.android >nul
adb shell pm uninstall -k --user 0 com.alibaba.aliexpresshd >nul
adb shell pm uninstall -k --user 0 com.msd.JTClient >nul
adb shell pm uninstall -k --user 0 com.booking >nul
adb shell pm uninstall -k --user 0 com.fintech.life >nul
adb shell pm uninstall -k --user 0 com.fintech.uangmudah >nul
adb shell pm uninstall -k --user 0 com.tokopedia.tkpd >nul
adb shell pm uninstall -k --user 0 com.agoda.mobile.consumer >nul
adb shell pm uninstall -k --user 0 com.realmestore.app >nul
echo.
echo =================================================
echo    Debloat E-Comerce Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Debloat Realme Bloatware ---
:DebloatRealme
adb shell pm uninstall -k --user 0 com.oppoex.afterservice >nul
adb shell pm uninstall -k --user 0 com.nearme.statistics.rom >nul
adb shell pm uninstall -k --user 0 com.nearme.romupdate >nul
adb shell pm uninstall -k --user 0 com.heytap.openid >nul
adb shell pm uninstall -k --user 0 com.heytap.mcs >nul
adb shell pm uninstall -k --user 0 com.coloros.weather.service >nul
adb shell pm uninstall -k --user 0 com.coloros.lockassistant >nul
adb shell pm uninstall -k --user 0 com.coloros.activation >nul
adb shell pm uninstall -k --user 0 com.heytap.market >nul
adb shell pm uninstall -k --user 0 com.oplus.phonemanager >nul
adb shell pm uninstall -k --user 0 com.coloros.filemanager >nul
adb shell pm uninstall -k --user 0 com.coloros.video >nul
adb shell pm uninstall -k --user 0 com.realme.as.music >nul
adb shell pm uninstall -k --user 0 com.heytap.browser >nul
adb shell pm uninstall -k --user 0 com.heytap.quickgame >nul
adb shell pm uninstall -k --user 0 com.realmecomm.app >nul
adb shell pm uninstall -k --user 0 com.oplus.phoneclone >nul
adb shell pm uninstall -k --user 0 com.coloros.gamespace >nul
adb shell pm uninstall -k --user 0 com.coloros.healthcheck >nul
adb shell pm uninstall -k --user 0 com.heytap.themestore >nul
adb shell pm uninstall -k --user 0 com.heytap.music >nul
adb shell pm uninstall -k --user 0 com.glance.lockscreenRealme >nul
echo.
echo =================================================
echo    Debloat Realme Bloatware Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Debloat Office ---
:DebloatOffice
adb shell pm uninstall -k --user 0 cn.wps.moffice_eng >nul
echo.
echo =================================================
echo    Debloat Office Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Debloat Auto-download Apps ---
:DebloatAuto
adb shell pm uninstall -k --user 0 com.finaccel.android >nul
adb shell pm uninstall -k --user 0 com.instagram.android >nul
adb shell pm uninstall -k --user 0 com.lenovo.anyshare.gps >nul
adb shell pm uninstall -k --user 0 com.whatsapp.w4b >nul
adb shell pm uninstall -k --user 0 com.opera.mini.native >nul
adb shell pm uninstall -k --user 0 com.nexstreaming.app.kinemasterfree >nul
adb shell pm uninstall -k --user 0 com.telkom.tracencare >nul
adb shell pm uninstall -k --user 0 com.bca >nul
adb shell pm uninstall -k --user 0 com.idntimes.idntimes >nul
adb shell pm uninstall -k --user 0 ru.zdevs.zarchiver >nul
adb shell pm uninstall -k --user 0 com.whatsapp >nul
adb shell pm uninstall -k --user 0 com.intsig.camscanner >nul
adb shell pm uninstall -k --user 0 id.dana >nul
adb shell pm uninstall -k --user 0 com.mobile.legends >nul
adb shell pm uninstall -k --user 0 id.co.bri.brimo >nul
adb shell pm uninstall -k --user 0 com.picsart.studio >nul
adb shell pm uninstall -k --user 0 com.alightcreative.motion >nul
adb shell pm uninstall -k --user 0 com.zhiliaoapp.musically.go >nul
adb shell pm uninstall -k --user 0 com.lemon.lvoverseas >nul
adb shell pm uninstall -k --user 0 com.facebook.lite >nul
adb shell pm uninstall -k --user 0 free.vpn.unblock.proxy.turbovpn >nul
adb shell pm uninstall -k --user 0 com.dts.freefireth >nul
echo.
echo =================================================
echo    Debloat Auto-Downloads Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto PartialMenu
goto :eof

:: --- Restore menu ---
:RestoreMenu
cls
echo ===============================================
echo    Note : Restore only work for Gapps and Realme Bloatware !
echo ===============================================
echo    Select Restore option:
echo    1. Restore All
echo    2. Main Menu
echo ===============================================
set /p mainchoice="Enter choice (1-2): "
if "%mainchoice%"=="1" goto RestoreAll
if "%mainchoice%"=="2" goto LandingPage
goto RestoreMenu 

:: --- Restore All ---
:RestoreAll
call :Spinner
call :RestoreGoogle
call :RestoreRealme
echo.
echo =================================================
echo    Restore All Completed!
echo =================================================
pause
goto RestoreMenu

:: --- Restore Google Apps ---
:RestoreGoogle
adb shell cmd package install-existing com.google.android.apps.magazines >nul
adb shell cmd package install-existing com.google.android.apps.podcasts >nul
adb shell cmd package install-existing com.google.android.videos >nul
adb shell cmd package install-existing com.google.android.apps.tachyon >nul
adb shell cmd package install-existing com.google.android.apps.subscriptions.red >nul
adb shell cmd package install-existing com.google.android.apps.youtube.music >nul
adb shell cmd package install-existing com.google.android.apps.maps >nul
adb shell cmd package install-existing com.google.android.keep >nul
adb shell cmd package install-existing com.google.android.apps.docs >nul
adb shell cmd package install-existing com.google.android.gm >nul
adb shell cmd package install-existing com.google.android.apps.photos >nul
adb shell cmd package install-existing com.google.android.feedback >nul
adb shell cmd package install-existing com.google.ar.lens >nul
adb shell cmd package install-existing com.google.android.apps.wellbeing >nul
echo.
echo =================================================
echo    Restore Google Apps Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto RestoreMenu
goto :eof

:: --- Restore Realme Bloatware ---
:RestoreRealme
adb shell cmd package install-existing com.oppoex.afterservice >nul
adb shell cmd package install-existing com.nearme.statistics.rom >nul
adb shell cmd package install-existing com.nearme.romupdate >nul
adb shell cmd package install-existing com.heytap.openid >nul
adb shell cmd package install-existing com.heytap.mcs >nul
adb shell cmd package install-existing com.coloros.weather.service >nul
adb shell cmd package install-existing com.coloros.lockassistant >nul
adb shell cmd package install-existing com.coloros.activation >nul
adb shell cmd package install-existing com.heytap.market >nul
adb shell cmd package install-existing com.oplus.phonemanager >nul
adb shell cmd package install-existing com.coloros.filemanager >nul
adb shell cmd package install-existing com.coloros.video >nul
adb shell cmd package install-existing com.realme.as.music >nul
adb shell cmd package install-existing com.heytap.browser >nul
adb shell cmd package install-existing com.heytap.quickgame >nul
adb shell cmd package install-existing com.realmecomm.app >nul
adb shell cmd package install-existing com.oplus.phoneclone >nul
adb shell cmd package install-existing com.coloros.gamespace >nul
adb shell cmd package install-existing com.coloros.healthcheck >nul
adb shell cmd package install-existing com.heytap.themestore >nul
adb shell cmd package install-existing com.heytap.music >nul
adb shell cmd package install-existing com.glance.lockscreenRealme >nul
echo.
echo =================================================
echo    Restore Realme Bloatware Completed!
echo =================================================
if "%mainchoice%"=="2" pause & goto RestoreMenu
goto :eof


:: --- Exit Script ---
:ExitScript
cls
color 0C
echo Exiting script
ping -n 2 127.0.0.1 >nul
cls
echo Exiting script .
ping -n 2 127.0.0.1 >nul
cls
echo Exiting script ..
ping -n 2 127.0.0.1 >nul
cls
echo Exiting script ...
ping -n 2 127.0.0.1 >nul
exit