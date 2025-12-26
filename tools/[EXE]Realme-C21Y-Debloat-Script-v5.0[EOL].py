import os
import subprocess
import time
import sys

ADB = "adb"  # atau path ke adb.exe

# ================= UTILITY =================

def cls():
    os.system("cls")

def pause():
    input("\nPress Enter to continue...")

def run(cmd):
    subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def spinner():
    for i in range(1, 11):
        perc = i * 10
        spin = "|/-\\"[i % 4]
        cls()
        print(f"Processing... Please wait... {perc}% {spin}")
        time.sleep(0.3)

# ================= DEBLOAT LIST =================

GOOGLE_APPS = [
    "com.google.android.apps.magazines",
    "com.google.android.apps.podcasts",
    "com.google.android.videos",
    "com.google.android.apps.tachyon",
    "com.google.android.apps.subscriptions.red",
    "com.google.android.apps.youtube.music",
    "com.google.android.apps.maps",
    "com.google.android.keep",
    "com.google.android.apps.docs",
    "com.google.android.gm",
    "com.google.android.apps.photos",
    "com.google.android.feedback",
    "com.google.ar.lens",
    "com.google.android.apps.wellbeing",
]

SOCIAL_APPS = [
    "com.facebook.katana",
    "com.facebook.system",
    "com.facebook.appmanager",
    "com.facebook.services",
    "com.facebook.orca",
    "com.zhiliaoapp.musically",
    "com.spotify.music",
    "world.social.group.video.share",
    "com.ss.android.buzz",
    "com.linkedin.android",
    "com.kwai.bulldog",
    "com.yxcorp.gifshow.homepage",
    "com.truecaller",
    "com.ss.android.ugc.trill",
]

ECOM_APPS = [
    "com.shopee.id",
    "com.lazada.android",
    "com.alibaba.aliexpresshd",
    "com.msd.JTClient",
    "com.booking",
    "com.fintech.life",
    "com.fintech.uangmudah",
    "com.tokopedia.tkpd",
    "com.agoda.mobile.consumer",
    "com.realmestore.app",
]

REALME_APPS = [
    "com.oppoex.afterservice",
    "com.nearme.statistics.rom",
    "com.nearme.romupdate",
    "com.heytap.openid",
    "com.heytap.mcs",
    "com.coloros.weather.service",
    "com.coloros.lockassistant",
    "com.coloros.activation",
    "com.heytap.market",
    "com.oplus.phonemanager",
    "com.coloros.filemanager",
    "com.coloros.video",
    "com.realme.as.music",
    "com.heytap.browser",
    "com.heytap.quickgame",
    "com.realmecomm.app",
    "com.oplus.phoneclone",
    "com.coloros.gamespace",
    "com.coloros.healthcheck",
    "com.heytap.themestore",
    "com.heytap.music",
    "com.glance.lockscreenRealme",
]

OFFICE_APPS = [
    "cn.wps.moffice_eng"
]

AUTO_APPS = [
    "com.finaccel.android",
    "com.instagram.android",
    "com.lenovo.anyshare.gps",
    "com.whatsapp.w4b",
    "com.opera.mini.native",
    "com.nexstreaming.app.kinemasterfree",
    "com.telkom.tracencare",
    "com.bca",
    "com.idntimes.idntimes",
    "ru.zdevs.zarchiver",
    "com.whatsapp",
    "com.intsig.camscanner",
    "id.dana",
    "com.mobile.legends",
    "id.co.bri.brimo",
    "com.picsart.studio",
    "com.alightcreative.motion",
    "com.zhiliaoapp.musically.go",
    "com.lemon.lvoverseas",
    "com.facebook.lite",
    "free.vpn.unblock.proxy.turbovpn",
    "com.dts.freefireth",
]

# ================= CORE =================

def debloat(apps):
    for pkg in apps:
        run([ADB, "shell", "pm", "uninstall", "-k", "--user", "0", pkg])

def restore(apps):
    for pkg in apps:
        run([ADB, "shell", "cmd", "package", "install-existing", pkg])

def restore_google():
    spinner()
    restore(GOOGLE_APPS)
    print("\nRestore Google Apps Completed!")
    pause()

def restore_realme():
    spinner()
    restore(REALME_APPS)
    print("\nRestore Realme Bloatware Completed!")
    pause()

def restore_all():
    spinner()
    restore(GOOGLE_APPS)
    restore(REALME_APPS)
    print("\nRestore All Completed!")
    pause()


# ================= MENUS =================

def verify_usb():
    cls()
    subprocess.run([ADB, "devices"])
    pause()

def debloat_all():
    spinner()
    debloat(GOOGLE_APPS)
    debloat(SOCIAL_APPS)
    debloat(ECOM_APPS)
    debloat(REALME_APPS)
    debloat(OFFICE_APPS)
    debloat(AUTO_APPS)
    print("\nDebloat All Completed!")
    pause()

def partial_menu():
    while True:
        cls()
        print("Select Category to Debloat:")
        print("1. Google Apps")
        print("2. Social & Entertainment")
        print("3. E-Commerce")
        print("4. Realme Bloatware")
        print("5. Office")
        print("6. Auto-Download Apps")
        print("7. Back")
        c = input("Choice: ")

        if c == "1":
            debloat(GOOGLE_APPS)
            print("\nDebloat Google Apps Completed!")
            pause()

        elif c == "2":
            debloat(SOCIAL_APPS)
            print("\nDebloat Social & Entertainment Apps Completed!")
            pause()

        elif c == "3":
            debloat(ECOM_APPS)
            print("\nDebloat E-Commerce Apps Completed!")
            pause()

        elif c == "4":
            debloat(REALME_APPS)
            print("\nDebloat Realme Bloatware Completed!")
            pause()

        elif c == "5":
            debloat(OFFICE_APPS)
            print("\nDebloat Office Apps Completed!")
            pause()

        elif c == "6":
            debloat(AUTO_APPS)
            print("\nDebloat Auto-Download Apps Completed!")
            pause()

        elif c == "7":
            return


def restore_menu():
    while True:
        try:
            cls()
            print("Restore Menu:")
            print("1. Restore Google Apps")
            print("2. Restore Realme Bloatware")
            print("3. Restore All")
            print("4. Back")

            c = input("Choice: ")

            if c == "1":
                restore_google()
            elif c == "2":
                restore_realme()
            elif c == "3":
                restore_all()
            elif c == "4":
                return

        except Exception as e:
            print("\nERROR:", e)
            pause()


def main():
    while True:
        cls()
        print("Realme C21Y Debloat Script v5.0 [EOL]")
        print("1. Verify USB Debugging")
        print("2. Debloat")
        print("3. Restore")
        print("4. Exit")
        c = input("Choice: ")

        if c == "1": verify_usb()
        elif c == "2":
            cls()
            print("1. Debloat All")
            print("2. Debloat Partial")
            print("3. Back")
            m = input("Choice: ")
            if m == "1": debloat_all()
            elif m == "2": partial_menu()
        elif c == "3": restore_menu()
        elif c == "4": sys.exit()

if __name__ == "__main__":
    main()
