@echo off
title Realme C21Y Debloat Script v2.0
color 0A
echo ================================================
echo   Realme C21Y Debloat Script via ADB
echo   Version : v2.0
echo   Author  : KeishaXD @github
echo ================================================
echo.
echo Make sure:
echo 1. USB Debugging is enabled
echo 2. Phone is connected to the PC
echo 3. ADB is installed and added to PATH
echo.
pause

adb devices
echo.

set /p confirm="Do you want to start debloat? (Y/N): "
if /i "%confirm%"=="Y" goto debloat
if /i "%confirm%"=="N" goto exit

:debloat
cls
color 0B
echo Starting debloat process...
echo Please wait...
echo.

:: --- Spinner Loading Effect ---
for /l %%i in (1,1,30) do (
    set /a perc=%%i*3
    setlocal enabledelayedexpansion
    set /a mod=%%i %% 4
    if !mod! equ 0 set spin=^|
    if !mod! equ 1 set spin=/
    if !mod! equ 2 set spin=-
    if !mod! equ 3 set spin=\
    cls
    echo Debloat in progress... !perc!%% !spin!
    ping -n 1 127.0.0.1 >nul
    endlocal
)

:: --- Google Apps ---
adb shell pm uninstall -k --user 0 com.google.android.apps.magazines
adb shell pm uninstall -k --user 0 com.google.android.apps.podcasts
adb shell pm uninstall -k --user 0 com.google.android.videos
adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
adb shell pm uninstall -k --user 0 com.google.android.apps.subscriptions.red
adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
adb shell pm uninstall -k --user 0 com.google.android.apps.maps
adb shell pm uninstall -k --user 0 com.google.android.keep
adb shell pm uninstall -k --user 0 com.google.android.apps.docs
adb shell pm uninstall -k --user 0 com.google.android.gm
adb shell pm uninstall -k --user 0 com.google.android.apps.photos
adb shell pm uninstall -k --user 0 com.google.android.feedback
adb shell pm uninstall -k --user 0 com.google.ar.lens
adb shell pm uninstall -k --user 0 com.google.android.apps.wellbeing

:: --- Social & Entertainment ---
adb shell pm uninstall -k --user 0 com.facebook.katana
adb shell pm uninstall -k --user 0 com.facebook.system
adb shell pm uninstall -k --user 0 com.facebook.appmanager
adb shell pm uninstall -k --user 0 com.facebook.services
adb shell pm uninstall -k --user 0 com.facebook.orca
adb shell pm uninstall -k --user 0 com.zhiliaoapp.musically
adb shell pm uninstall -k --user 0 com.spotify.music
adb shell pm uninstall -k --user 0 world.social.group.video.share
adb shell pm uninstall -k --user 0 com.ss.android.buzz
adb shell pm uninstall -k --user 0 com.linkedin.android
adb shell pm uninstall -k --user 0 com.kwai.bulldog
adb shell pm uninstall -k --user 0 com.yxcorp.gifshow.homepage
adb shell pm uninstall -k --user 0 com.truecaller
adb shell pm uninstall -k --user 0 com.ss.android.ugc.trill

:: --- E-Commerce ---
adb shell pm uninstall -k --user 0 com.shopee.id
adb shell pm uninstall -k --user 0 com.lazada.android
adb shell pm uninstall -k --user 0 com.alibaba.aliexpresshd
adb shell pm uninstall -k --user 0 com.msd.JTClient
adb shell pm uninstall -k --user 0 com.booking
adb shell pm uninstall -k --user 0 com.fintech.life
adb shell pm uninstall -k --user 0 com.fintech.uangmudah
adb shell pm uninstall -k --user 0 com.tokopedia.tkpd
adb shell pm uninstall -k --user 0 com.agoda.mobile.consumer
adb shell pm uninstall -k --user 0 com.realmestore.app

:: --- OEM / Realme-ColorOS Bloatware ---
adb shell pm uninstall -k --user 0 com.oppoex.afterservice
adb shell pm uninstall -k --user 0 com.nearme.statistics.rom
adb shell pm uninstall -k --user 0 com.nearme.romupdate
adb shell pm uninstall -k --user 0 com.heytap.openid
adb shell pm uninstall -k --user 0 com.heytap.mcs
adb shell pm uninstall -k --user 0 com.coloros.weather.service
adb shell pm uninstall -k --user 0 com.coloros.lockassistant
adb shell pm uninstall -k --user 0 com.coloros.activation
adb shell pm uninstall -k --user 0 com.heytap.market
adb shell pm uninstall -k --user 0 com.oplus.phonemanager
adb shell pm uninstall -k --user 0 com.coloros.filemanager
adb shell pm uninstall -k --user 0 com.coloros.video
adb shell pm uninstall -k --user 0 com.realme.as.music
adb shell pm uninstall -k --user 0 com.heytap.browser
adb shell pm uninstall -k --user 0 com.heytap.quickgame
adb shell pm uninstall -k --user 0 com.realmecomm.app
adb shell pm uninstall -k --user 0 com.oplus.phoneclone
adb shell pm uninstall -k --user 0 com.coloros.gamespace
adb shell pm uninstall -k --user 0 com.coloros.healthcheck
adb shell pm uninstall -k --user 0 com.heytap.themestore
adb shell pm uninstall -k --user 0 com.heytap.music

:: --- Office ---
adb shell pm uninstall -k --user 0 cn.wps.moffice_eng

:: --- Auto-downloaded Apps ---
adb shell pm uninstall -k --user 0 com.finaccel.android
adb shell pm uninstall -k --user 0 com.instagram.android
adb shell pm uninstall -k --user 0 com.lenovo.anyshare.gps
adb shell pm uninstall -k --user 0 com.whatsapp.w4b
adb shell pm uninstall -k --user 0 com.opera.mini.native
adb shell pm uninstall -k --user 0 com.nexstreaming.app.kinemasterfree
adb shell pm uninstall -k --user 0 com.telkom.tracencare
adb shell pm uninstall -k --user 0 com.bca
adb shell pm uninstall -k --user 0 com.idntimes.idntimes
adb shell pm uninstall -k --user 0 ru.zdevs.zarchiver
adb shell pm uninstall -k --user 0 com.whatsapp
adb shell pm uninstall -k --user 0 com.intsig.camscanner
adb shell pm uninstall -k --user 0 id.dana
adb shell pm uninstall -k --user 0 com.mobile.legends
adb shell pm uninstall -k --user 0 id.co.bri.brimo
adb shell pm uninstall -k --user 0 com.picsart.studio
adb shell pm uninstall -k --user 0 com.alightcreative.motion
adb shell pm uninstall -k --user 0 com.zhiliaoapp.musically.go
adb shell pm uninstall -k --user 0 com.lemon.lvoverseas
adb shell pm uninstall -k --user 0 com.facebook.lite
adb shell pm uninstall -k --user 0 free.vpn.unblock.proxy.turbovpn
adb shell pm uninstall -k --user 0 com.dts.freefireth

cls
color 0A
echo ================================================
echo   Debloat process finished!
echo   Restart your Realme C21Y to apply changes.
echo ================================================
pause
goto exit

:exit
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