#!/system/bin/sh
# ===============================================
#  Realme C21Y Debloat Script v5.0 [EOL]
#  Author : KeishaXD @github
#  Note   : ROOT access required
# ===============================================

# ---------- [ LANDING PAGE ] ----------
LandingPage() {
    while true; do
        clear
        echo "==============================================="
        echo "   Realme C21Y Debloat Script"
        echo "   Version : v5.0 [EOL]"
        echo "   Author  : KeishaXD @github"
        echo "==============================================="
        echo
        echo "Make sure:"
        echo " 1. Root access is available"
        echo " 2. Run this script with 'su'"
        echo "==============================================="
        echo
        echo "Select an option:"
        echo " 1) Verify Root Access"
        echo " 2) Continue to Debloat Script"
        echo " 3) Continue to Restore Script"
        echo " 4) Exit Script"
        echo "==============================================="
        echo -n "Enter choice (1-4): "
        read usbchoice

        case "$usbchoice" in
            1) VerifyRoot ;;
            2) MainMenu ;;
            3) RestoreMenu ;;
            4) ExitScript ;;
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

# ---------- [ VERIFY ROOT ] ----------
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

# ---------- [ MAIN MENU ] ----------
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
            3) return ;;
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

# ---------- [ PARTIAL MENU ] ----------
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
            7) return ;;
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

# ---------- [ SPINNER ANIMATION ] ----------
Spinner() {
    for i in $(seq 1 10); do
        perc=$((i * 10))
        case $((i % 4)) in
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

# ---------- [ DEBLOAT SECTIONS ] ----------
DebloatAll() {
    # Semua kategori dijalankan
    DebloatGoogle
    DebloatSocial
    DebloatEcom
    DebloatRealme
    DebloatOffice
    DebloatAuto
    echo "==============================================="
    echo "  Debloat All Completed!"
    echo "==============================================="
    echo "Press Enter to return..."
    read
}

DebloatGoogle() {
    for pkg in \
        com.google.android.apps.magazines \
        com.google.android.apps.podcasts \
        com.google.android.videos \
        com.google.android.apps.tachyon \
        com.google.android.apps.subscriptions.red \
        com.google.android.apps.youtube.music \
        com.google.android.apps.maps \
        com.google.android.keep \
        com.google.android.apps.docs \
        com.google.android.gm \
        com.google.android.apps.photos \
        com.google.android.feedback \
        com.google.ar.lens \
        com.google.android.apps.wellbeing
    do
        pm uninstall -k --user 0 "$pkg"
    done
    echo "Debloat Google Apps Completed!"
    echo "Press Enter to continue..."
    read
}

DebloatSocial() {
    for pkg in \
        com.facebook.katana \
        com.facebook.system \
        com.facebook.appmanager \
        com.facebook.services \
        com.facebook.orca \
        com.zhiliaoapp.musically \
        com.spotify.music \
        world.social.group.video.share \
        com.ss.android.buzz \
        com.linkedin.android \
        com.kwai.bulldog \
        com.yxcorp.gifshow.homepage \
        com.truecaller \
        com.ss.android.ugc.trill
    do
        pm uninstall -k --user 0 "$pkg"
    done
    echo "Debloat Social & Entertainment Completed!"
    echo "Press Enter to continue..."
    read
}

DebloatEcom() {
    for pkg in \
        com.shopee.id \
        com.lazada.android \
        com.alibaba.aliexpresshd \
        com.msd.JTClient \
        com.booking \
        com.fintech.life \
        com.fintech.uangmudah \
        com.tokopedia.tkpd \
        com.agoda.mobile.consumer \
        com.realmestore.app
    do
        pm uninstall -k --user 0 "$pkg"
    done
    echo "Debloat E-Commerce Completed!"
    echo "Press Enter to continue..."
    read
}

DebloatRealme() {
    for pkg in \
        com.oppoex.afterservice \
        com.nearme.statistics.rom \
        com.nearme.romupdate \
        com.heytap.openid \
        com.heytap.mcs \
        com.coloros.weather.service \
        com.coloros.lockassistant \
        com.coloros.activation \
        com.heytap.market \
        com.oplus.phonemanager \
        com.coloros.filemanager \
        com.coloros.video \
        com.realme.as.music \
        com.heytap.browser \
        com.heytap.quickgame \
        com.realmecomm.app \
        com.oplus.phoneclone \
        com.coloros.gamespace \
        com.coloros.healthcheck \
        com.heytap.themestore \
        com.heytap.music \
        com.glance.lockscreenRealme
    do
        pm uninstall -k --user 0 "$pkg"
    done
    echo "Debloat Realme Bloatware Completed!"
    echo "Press Enter to continue..."
    read
}

DebloatOffice() {
    pm uninstall -k --user 0 cn.wps.moffice_eng
    echo "Debloat Office Completed!"
    echo "Press Enter to continue..."
    read
}

DebloatAuto() {
    for pkg in \
        com.finaccel.android \
        com.instagram.android \
        com.lenovo.anyshare.gps \
        com.whatsapp.w4b \
        com.opera.mini.native \
        com.nexstreaming.app.kinemasterfree \
        com.telkom.tracencare \
        com.bca \
        com.idntimes.idntimes \
        ru.zdevs.zarchiver \
        com.whatsapp \
        com.intsig.camscanner \
        id.dana \
        com.mobile.legends \
        id.co.bri.brimo \
        com.picsart.studio \
        com.alightcreative.motion \
        com.zhiliaoapp.musically.go \
        com.lemon.lvoverseas \
        com.facebook.lite \
        free.vpn.unblock.proxy.turbovpn \
        com.dts.freefireth
    do
        pm uninstall -k --user 0 "$pkg"
    done
    echo "Debloat Auto-download Apps Completed!"
    echo "Press Enter to continue..."
    read
}

# ---------- [ RESTORE MENU ] ----------
RestoreMenu() {
    while true; do
        clear
        echo "==============================================="
        echo "  Note: Restore only works for Gapps & Realme Bloatware!"
        echo "==============================================="
        echo "Select restore option:"
        echo " 1) Restore All"
        echo " 2) Back to Landing Page"
        echo "==============================================="
        echo -n "Enter choice (1-2): "
        read restorechoice

        case "$restorechoice" in
            1) RestoreAll ;;
            2) return ;;
            *) echo "Invalid choice. Try again."; sleep 1 ;;
        esac
    done
}

RestoreAll() {
    cmd="cmd package install-existing"
    for pkg in \
        com.google.android.apps.magazines \
        com.google.android.apps.podcasts \
        com.google.android.videos \
        com.google.android.apps.tachyon \
        com.google.android.apps.subscriptions.red \
        com.google.android.apps.youtube.music \
        com.google.android.apps.maps \
        com.google.android.keep \
        com.google.android.apps.docs \
        com.google.android.gm \
        com.google.android.apps.photos \
        com.google.android.feedback \
        com.google.ar.lens \
        com.google.android.apps.wellbeing \
        com.oppoex.afterservice \
        com.nearme.statistics.rom \
        com.nearme.romupdate \
        com.heytap.openid \
        com.heytap.mcs \
        com.coloros.weather.service \
        com.coloros.lockassistant \
        com.coloros.activation \
        com.heytap.market \
        com.coloros.filemanager \
        com.coloros.video \
        com.realme.as.music \
        com.heytap.browser \
        com.heytap.quickgame \
        com.realmecomm.app \
        com.oplus.phoneclone \
        com.glance.lockscreenRealme
    do
        $cmd "$pkg"
    done

    echo "==============================================="
    echo "  Restore All Completed!"
    echo "==============================================="
    echo "Press Enter to return..."
    read
}

# ---------- [ EXIT SCRIPT ] ----------
ExitScript() {
    clear
    for dots in "" "." ".." "..."; do
        echo "Exiting script$dots"
        sleep 1
        clear
    done
    exit 0
}

# ---------- [ RUN SCRIPT ] ----------
LandingPage
