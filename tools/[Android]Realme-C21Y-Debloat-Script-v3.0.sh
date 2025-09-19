#!/system/bin/sh
# Realme C21Y Debloat Script v3.0
# Author: KeishaXD @github
# Note: ROOT access required

LandingPage() {
    while true; do
        clear
        echo "==============================================="
        echo "   Realme C21Y Debloat Script"
        echo "   Version : v3.0"
        echo "   Author  : KeishaXD @github"
        echo "==============================================="
        echo
        echo "==============================================="
        echo "   Make sure:"
        echo "   1. Root access is available"
        echo "   2. Run this script with su"
        echo "==============================================="
        echo
        echo "==============================================="
        echo "   Select an option:"
        echo "   1) Verify Root Access"
        echo "   2) Continue to Debloat Script"
        echo "   3) Exit Script"
        echo "==============================================="
        echo -n "Enter choice (1-3): "
        read usbchoice

        case "$usbchoice" in
            1) VerifyRoot ;;
            2) MainMenu ;;
            3) ExitScript ;;
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

VerifyRoot() {
    clear
    echo "Checking root access..."
    if [ "$(id -u)" -eq 0 ]; then
        echo "Root access verified!"
    else
        echo "Root access NOT available. Please run with su."
    fi
    echo
    echo "Press Enter to return..."
    read
}

MainMenu() {
    while true; do
        clear
        echo "==============================================="
        echo "   Select debloat option:"
        echo "   1) Debloat All"
        echo "   2) Debloat Partial"
        echo "   3) Back to Landing Page"
        echo "==============================================="
        echo -n "Enter choice (1-3): "
        read mainchoice

        case "$mainchoice" in
            1) DebloatAll ;;
            2) PartialMenu ;;
            3) return ;;  # back to LandingPage
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

PartialMenu() {
    while true; do
        clear
        echo "==============================================="
        echo "   Select category to debloat:"
        echo "   1) Google Apps"
        echo "   2) Social & Entertainment"
        echo "   3) E-Commerce"
        echo "   4) Realme Bloatware"
        echo "   5) Office"
        echo "   6) Auto-downloaded Apps"
        echo "   7) Back to Main Menu"
        echo "==============================================="
        echo -n "Enter choice (1-7): "
        read partialchoice

        case "$partialchoice" in
            1) DebloatGoogle ;;
            2) DebloatSocial ;;
            3) DebloatEcom ;;
            4) DebloatRealme ;;
            5) DebloatOffice ;;
            6) DebloatAuto ;;
            7) return ;; # back to MainMenu
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

Spinner() {
    for i in $(seq 1 10); do
        perc=$((i * 10))
        mod=$((i % 4))
        case $mod in
            0) spin="|" ;;
            1) spin="/" ;;
            2) spin="-" ;;
            3) spin="\\" ;;
        esac
        clear
        echo "Debloat in progress... ${perc}% $spin"
        sleep 0.5
    done
}

DebloatAll() {
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
    pm uninstall -k --user 0 cn.wps.moffice_eng
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
    echo "==============================================="
    echo "  Debloat All Completed!"
    echo "==============================================="
    echo "Press Enter to return..."
    read
    return
}

DebloatGoogle() {
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
    echo "Debloat Google Apps Completed!"
    echo "Press Enter to continue..."
    read
    return
}

DebloatSocial() {
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
    echo "Debloat Social & Entertainment Completed!"
    echo "Press Enter to continue..."
    read
    return
}

DebloatEcom() {
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
    echo "Debloat E-Commerce Completed!"
    echo "Press Enter to continue..."
    read
    return
}

DebloatRealme() {
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
    echo "Debloat Realme Bloatware Completed!"
    echo "Press Enter to continue..."
    read
    return
}

DebloatOffice() {
    pm uninstall -k --user 0 cn.wps.moffice_eng
    echo "Debloat Office Completed!"
    echo "Press Enter to continue..."
    read
    return
}

DebloatAuto() {
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
    echo "Debloat Auto-download Apps Completed!"
    echo "Press Enter to continue..."
    read
    return
}

ExitScript() {
    clear
    for dots in "" "." ".." "..."; do
        echo "Exiting script$dots"
        sleep 1
        clear
    done
    exit 0
}

# Run Landing Page saat pertama
LandingPage