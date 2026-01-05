import subprocess

ADB = "adb"

# ================= APP LIST =================

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

OFFICE_APPS = ["cn.wps.moffice_eng"]

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

def run(cmd):
    return subprocess.run(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

def check_adb():
    result = run([ADB, "devices"])
    return "device" in result.stdout

def debloat(apps, logger=None):
    for pkg in apps:
        result = run([
            ADB, "shell", "pm", "uninstall", "-k", "--user", "0", pkg
        ])

        if logger:
            if "Success" in result.stdout:
                logger(f"[OK] Debloat: {pkg}")
            else:
                logger(f"[SKIP] {pkg}")

def restore(apps, logger=None):
    for pkg in apps:
        result = run([
            ADB, "shell", "cmd", "package", "install-existing", pkg
        ])

        if logger:
            if "installed" in result.stdout.lower():
                logger(f"[OK] Restore: {pkg}")
            else:
                logger(f"[SKIP] {pkg}")

def get_device_info():
    props = {
        "Brand": "ro.product.brand",
        "Model": "ro.product.model",
        "Android": "ro.build.version.release",
        "SDK": "ro.build.version.sdk",
        "Device": "ro.product.device",
    }

    info = {}

    for label, prop in props.items():
        result = subprocess.run(
            [ADB, "shell", "getprop", prop],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        value = result.stdout.strip()
        info[label] = value if value else "Unknown"

    return info
