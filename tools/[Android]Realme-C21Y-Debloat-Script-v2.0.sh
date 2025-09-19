#!/bin/bash

# Realme C21Y Debloat Script v2.1 (Android - Root Only)
# Author: KeishaXD @github

clear
echo "==============================================="
echo "  Realme C21Y Debloat Script (Root Only)"
echo "  Version : v2.1"
echo "  Author  : KeishaXD @github"
echo "==============================================="
echo
echo "Make sure:"
echo "1. Root access is available"
echo "2. Script is executed in a shell with root permissions (su)"
echo
read -p "Press Enter to continue..."

read -p "Do you want to start debloat? (Y/N): " confirm
case "$confirm" in
    [Yy]*) ;;
    [Nn]*) exit ;;
    *) exit ;;
esac

# --- Debloat Process ---
clear
echo "Starting debloat process..."
echo "Please wait..."
echo

# --- Spinner Loading Effect ---
for i in $(seq 1 30); do
    perc=$((i * 3))
    mod=$((i % 4))
    case $mod in
        0) spin="|" ;;
        1) spin="/" ;;
        2) spin="-" ;;
        3) spin="\\" ;;
    esac
    clear
    echo "Debloat in progress... ${perc}% $spin"
    sleep 1
done

# --- Google Apps ---
pm uninstall -k --user 0 com.google.android.apps.magazines
pm uninstall -k --user 0 com.google.android.apps.podcasts
pm uninstall -k --user 0 com.google.android.videos
pm uninstall -k --user 0 com.google.android.apps.tachyon
pm uninstall -k --user 0 com.google.android.apps.subscriptions.red
pm uninstall -k --user 0 com.google.android.apps.youtube.music
pm uninstall -k --user 0 com.google.android.apps.maps
pm uninstall -k --user 0 com.google.android.keep
pm uninstall -k --user 0 com.google.android.apps.docs
pm uninstall -k --user 0 com.google.android.gm
pm uninstall -k --user 0 com.google.android.apps.photos
pm uninstall -k --user 0 com.google.android.feedback
pm uninstall -k --user 0 com.google.ar.lens
pm uninstall -k --user 0 com.google.android.apps.wellbeing

# --- Social & Entertainment ---
pm uninstall -k --user 0 com.facebook.katana
pm uninstall -k --user 0 com.facebook.system
pm uninstall -k --user 0 com.facebook.appmanager
pm uninstall -k --user 0 com.facebook.services
pm uninstall -k --user 0 com.facebook.orca
pm uninstall -k --user 0 com.zhiliaoapp.musically
pm uninstall -k --user 0 com.spotify.music
pm uninstall -k --user 0 world.social.group.video.share
pm uninstall -k --user 0 com.ss.android.buzz
pm uninstall -k --user 0 com.linkedin.android
pm uninstall -k --user 0 com.kwai.bulldog
pm uninstall -k --user 0 com.yxcorp.gifshow.homepage
pm uninstall -k --user 0 com.truecaller
pm uninstall -k --user 0 com.ss.android.ugc.trill

# --- E-Commerce ---
pm uninstall -k --user 0 com.shopee.id
pm uninstall -k --user 0 com.lazada.android
pm uninstall -k --user 0 com.alibaba.aliexpresshd
pm uninstall -k --user 0 com.msd.JTClient
pm uninstall -k --user 0 com.booking
pm uninstall -k --user 0 com.fintech.life
pm uninstall -k --user 0 com.fintech.uangmudah
pm uninstall -k --user 0 com.tokopedia.tkpd
pm uninstall -k --user 0 com.agoda.mobile.consumer
pm uninstall -k --user 0 com.realmestore.app

# --- OEM / Realme-ColorOS Bloatware ---
pm uninstall -k --user 0 com.oppoex.afterservice
pm uninstall -k --user 0 com.nearme.statistics.rom
pm uninstall -k --user 0 com.nearme.romupdate
pm uninstall -k --user 0 com.heytap.openid
pm uninstall -k --user 0 com.heytap.mcs
pm uninstall -k --user 0 com.coloros.weather.service
pm uninstall -k --user 0 com.coloros.lockassistant
pm uninstall -k --user 0 com.coloros.activation
pm uninstall -k --user 0 com.heytap.market
pm uninstall -k --user 0 com.oplus.phonemanager
pm uninstall -k --user 0 com.coloros.filemanager
pm uninstall -k --user 0 com.coloros.video
pm uninstall -k --user 0 com.realme.as.music
pm uninstall -k --user 0 com.heytap.browser
pm uninstall -k --user 0 com.heytap.quickgame
pm uninstall -k --user 0 com.realmecomm.app
pm uninstall -k --user 0 com.oplus.phoneclone
pm uninstall -k --user 0 com.coloros.gamespace
pm uninstall -k --user 0 com.coloros.healthcheck
pm uninstall -k --user 0 com.heytap.themestore
pm uninstall -k --user 0 com.heytap.music
pm uninstall -k --user 0 com.glance.lockscreenRealme

# --- Office ---
pm uninstall -k --user 0 cn.wps.moffice_eng

# --- Auto-downloaded Apps ---
pm uninstall -k --user 0 com.finaccel.android
pm uninstall -k --user 0 com.instagram.android
pm uninstall -k --user 0 com.lenovo.anyshare.gps
pm uninstall -k --user 0 com.whatsapp.w4b
pm uninstall -k --user 0 com.opera.mini.native
pm uninstall -k --user 0 com.nexstreaming.app.kinemasterfree
pm uninstall -k --user 0 com.telkom.tracencare
pm uninstall -k --user 0 com.bca
pm uninstall -k --user 0 com.idntimes.idntimes
pm uninstall -k --user 0 ru.zdevs.zarchiver
pm uninstall -k --user 0 com.whatsapp
pm uninstall -k --user 0 com.intsig.camscanner
pm uninstall -k --user 0 id.dana
pm uninstall -k --user 0 com.mobile.legends
pm uninstall -k --user 0 id.co.bri.brimo
pm uninstall -k --user 0 com.picsart.studio
pm uninstall -k --user 0 com.alightcreative.motion
pm uninstall -k --user 0 com.zhiliaoapp.musically.go
pm uninstall -k --user 0 com.lemon.lvoverseas
pm uninstall -k --user 0 com.facebook.lite
pm uninstall -k --user 0 free.vpn.unblock.proxy.turbovpn
pm uninstall -k --user 0 com.dts.freefireth

clear
echo "==============================================="
echo "  Debloat process finished!"
echo "  Restart your Realme C21Y to apply changes."
echo "==============================================="
read -p "Press Enter to exit..."

# Exit animation
for dots in "" "." ".." "..."; do
    clear
    echo "Exiting script$dots"
    sleep 1
done

exit 0