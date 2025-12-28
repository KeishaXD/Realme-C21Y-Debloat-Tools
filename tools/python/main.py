import tkinter as tk
from tkinter import messagebox
import threading
import subprocess
import core

# =====================
# UTILITY FUNCTIONS
# =====================

def info(msg):
    root.after(0, lambda: messagebox.showinfo("Info", msg))

def log(msg):
    def write():
        terminal.insert(tk.END, msg + "\n")
        terminal.see(tk.END)
    root.after(0, write)

def run_task(func, apps, name):
    threading.Thread(
        target=func,
        args=(apps, name),
        daemon=True
    ).start()

# =====================
# WARNING
# =====================

def warn_auto_apps():
    messagebox.showwarning(
        "Warning - Auto Download Apps",
        "⚠ WARNING ⚠\n\n"
        "Auto-Download Apps are NOT recommended to debloat\n"
        "unless your phone is:\n\n"
        "• Fresh / new device\n"
        "• Recently flashed / factory reset\n\n"
        "Removing these apps on daily-used phones\n"
        "may cause unexpected issues.\n\n"
        "Proceed with caution!"
    )

# =====================
# ADB VERIFICATION
# =====================

def verify_adb():
    def task():
        log("[INFO] Checking ADB connection...")

        try:
            result = subprocess.run(
                ["adb", "devices"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            output = result.stdout.strip()
            log(output)

            if "unauthorized" in output:
                log("[WARN] Device unauthorized")
                info(
                    "ADB Device Unauthorized!\n\n"
                    "• Unlock your phone\n"
                    "• Allow USB debugging\n"
                    "• Reconnect USB cable"
                )

            elif "\tdevice" in output:
                log("[OK] Device authorized")
                info("ADB Connected!\nDevice authorized and ready.")

            elif len(output.splitlines()) <= 1:
                log("[WAIT] Waiting for device")
                info(
                    "Waiting for device...\n\n"
                    "• USB cable connected\n"
                    "• USB debugging enabled"
                )

            else:
                log("[ERROR] Unknown ADB state")
                info("Unknown ADB state.\nCheck terminal output.")

        except FileNotFoundError:
            log("[FATAL] ADB not found")
            info(
                "ADB not found!\n\n"
                "Please install Android Platform Tools\n"
                "and add ADB to PATH."
            )

        except Exception as e:
            log(f"[ERROR] {e}")
            info("ADB error.\nCheck terminal log.")

    threading.Thread(target=task, daemon=True).start()

# =====================
# CORE ACTIONS
# =====================

def debloat(apps, name):
    log(f"[START] Debloat {name}")
    core.debloat(apps, logger=log)
    info(f"Debloat {name} Completed!")

def restore(apps, name):
    log(f"[START] Restore {name}")
    core.restore(apps, logger=log)
    info(f"Restore {name} Completed!")

def debloat_all():
    def task():
        log("[START] Debloat ALL")
        for apps in (
            core.GOOGLE_APPS,
            core.SOCIAL_APPS,
            core.ECOM_APPS,
            core.REALME_APPS,
            core.OFFICE_APPS,
            core.AUTO_APPS,
        ):
            core.debloat(apps, logger=log)
        info("Debloat ALL Completed!")
    threading.Thread(target=task, daemon=True).start()

def restore_all():
    def task():
        log("[START] Restore ALL")
        for apps in (
            core.GOOGLE_APPS,
            core.SOCIAL_APPS,
            core.ECOM_APPS,
            core.REALME_APPS,
            core.OFFICE_APPS,
            core.AUTO_APPS,
        ):
            core.restore(apps, logger=log)
        info("Restore ALL Completed!")
    threading.Thread(target=task, daemon=True).start()

# =====================
# GUI ROOT
# =====================

root = tk.Tk()
root.title("Realme C21Y Debloat Tool v6.1 [GUI]")
root.geometry("700x520")
root.resizable(False, False)

content_frame = tk.Frame(root)
content_frame.pack(fill="both", expand=True)

tk.Label(
    content_frame,
    text="Realme C21Y Debloat Tool",
    font=("Segoe UI", 18, "bold")
).pack(pady=12)

# =====================
# CATEGORY LIST
# =====================

frame = tk.Frame(content_frame)
frame.pack(pady=(6, 20))

categories = [
    ("Google Apps", core.GOOGLE_APPS),
    ("Social / Entertainment", core.SOCIAL_APPS),
    ("E-Commerce", core.ECOM_APPS),
    ("Realme Bloatware", core.REALME_APPS),
    ("Office Apps", core.OFFICE_APPS),
    ("Auto-Download Apps", core.AUTO_APPS),
]

for i, (name, apps) in enumerate(categories):
    tk.Label(
        frame,
        text=name,
        width=24,
        anchor="w",
        font=("Segoe UI", 10)
    ).grid(row=i, column=0, padx=8, pady=6)

    tk.Button(
        frame,
        text="Debloat",
        width=12,
        command=lambda a=apps, n=name: run_task(debloat, a, n)
    ).grid(row=i, column=1, padx=6)

    tk.Button(
        frame,
        text="Restore",
        width=12,
        command=lambda a=apps, n=name: run_task(restore, a, n)
    ).grid(row=i, column=2, padx=6)

    if name == "Auto-Download Apps":
        tk.Button(
            frame,
            text="⚠️",
            width=3,
            font=("Segoe UI", 10, "bold"),
            fg="white",
            bg="#f39c12",
            command=warn_auto_apps
        ).grid(row=i, column=3, padx=6)

# =====================
# TERMINAL
# =====================

terminal_frame = tk.Frame(content_frame)
terminal_frame.pack(padx=12, pady=10, fill="both")

terminal = tk.Text(
    terminal_frame,
    height=9,
    bg="black",
    fg="lime",
    font=("Consolas", 9)
)
terminal.pack(side="left", fill="both", expand=True)

scroll = tk.Scrollbar(terminal_frame, command=terminal.yview)
scroll.pack(side="right", fill="y")
terminal.config(yscrollcommand=scroll.set)

log("[INFO] Application started.")

# =====================
# ACTION BUTTONS
# =====================

action_frame = tk.Frame(content_frame)
action_frame.pack(pady=(10, 16))

BTN_STYLE = {
    "relief": "raised",
    "bd": 2,
    "highlightthickness": 0
}

tk.Button(
    action_frame,
    text="VERIFY ADB",
    width=16,
    height=2,
    bg="#2980b9",
    fg="white",
    font=("Segoe UI", 10, "bold"),
    command=verify_adb,
    **BTN_STYLE
).grid(row=0, column=0, padx=10)

tk.Button(
    action_frame,
    text="DEBLOAT ALL",
    width=16,
    height=2,
    bg="#c0392b",
    fg="white",
    font=("Segoe UI", 10, "bold"),
    command=debloat_all,
    **BTN_STYLE
).grid(row=0, column=1, padx=10)

tk.Button(
    action_frame,
    text="RESTORE ALL",
    width=16,
    height=2,
    bg="#27ae60",
    fg="white",
    font=("Segoe UI", 10, "bold"),
    command=restore_all,
    **BTN_STYLE
).grid(row=0, column=2, padx=10)

tk.Button(
    action_frame,
    text="EXIT",
    width=14,
    height=2,
    font=("Segoe UI", 10),
    command=root.destroy,
    **BTN_STYLE
).grid(row=0, column=3, padx=10)

root.mainloop()
