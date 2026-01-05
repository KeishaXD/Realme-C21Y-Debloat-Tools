import tkinter as tk
from tkinter import messagebox
import threading
import subprocess
import core
import json
import os

# =====================
# THEME
# =====================

dark_mode = False

LIGHT_THEME = {
    "bg": "#f2f2f2",
    "fg": "#000000",
    "terminal_bg": "black",
    "terminal_fg": "lime"
}

DARK_THEME = {
    "bg": "#1e1e1e",
    "fg": "#ffffff",
    "terminal_bg": "#000000",
    "terminal_fg": "#00ff9c"
}

# =====================
# UTILITY
# =====================

def info(msg):
    root.after(0, lambda: messagebox.showinfo("Info", msg))

def confirm_action(title, message):
    return messagebox.askyesno(title, message)

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
# THEME APPLY
# =====================

CONFIG_FILE = "config.json"

CONFIG_FILE = "config.json"

def load_config():
    global dark_mode
    if not os.path.exists(CONFIG_FILE):
        dark_mode = False
        return
    try:
        with open(CONFIG_FILE, "r") as f:
            data = json.load(f)
            dark_mode = data.get("dark_mode", False)
    except Exception:
        dark_mode = False


def save_config():
    try:
        with open(CONFIG_FILE, "w") as f:
            json.dump({"dark_mode": dark_mode}, f)
    except Exception:
        pass



def save_config():
    try:
        with open(CONFIG_FILE, "w") as f:
            json.dump({"dark_mode": dark_mode}, f)
    except Exception:
        pass

def apply_theme():
    theme = DARK_THEME if dark_mode else LIGHT_THEME

    root.configure(bg=theme["bg"])
    content_frame.configure(bg=theme["bg"])
    top_bar.configure(bg=theme["bg"])
    frame.configure(bg=theme["bg"])
    terminal_frame.configure(bg=theme["bg"])
    action_frame.configure(bg=theme["bg"])

    title_label.configure(bg=theme["bg"], fg=theme["fg"])

    terminal.configure(
        bg=theme["terminal_bg"],
        fg=theme["terminal_fg"],
        insertbackground=theme["terminal_fg"]
    )

    for lbl in category_labels:
        lbl.configure(bg=theme["bg"], fg=theme["fg"])

    dark_btn.configure(
        bg="#34495e" if not dark_mode else "#7f8c8d",
        fg="white"
    )

def toggle_dark_mode():
    global dark_mode
    dark_mode = not dark_mode
    save_config()
    apply_theme()

def update_dark_button():
    if dark_mode:
        dark_btn.config(text="☀️")
    else:
        dark_btn.config(text="🌙")


# =====================
# WARNING
# =====================

def warn_auto_apps():
    messagebox.showwarning(
        "Warning",
        "⚠ Auto-Download Apps NOT recommended\n\n"
        "Only safe if device is:\n"
        "- Fresh\n"
        "- Recently flashed"
    )

# =====================
# ADB
# =====================

def verify_adb():
    def task():
        log("[INFO] Checking ADB...")
        try:
            r = subprocess.run(
                ["adb", "devices"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            out = r.stdout.strip()
            log(out)

            if "unauthorized" in out:
                info("ADB Unauthorized!\nAllow USB debugging.")
            elif "\tdevice" in out:
                info("ADB Connected & Authorized.")
            else:
                info("Waiting for device...")
        except FileNotFoundError:
            info("ADB not found.\nInstall platform-tools.")

    threading.Thread(target=task, daemon=True).start()

def show_device_info():
    def task():
        log("[INFO] Fetching device info...")
        try:
            data = core.get_device_info()
            log("===== DEVICE INFO =====")
            for k, v in data.items():
                log(f"{k:<12}: {v}")
            log("=======================")
        except Exception as e:
            log(f"[ERROR] {e}")

    threading.Thread(target=task, daemon=True).start()

# =====================
# CORE ACTIONS
# =====================

def debloat(apps, name):
    if not confirm_action("Confirm", f"Debloat {name}?"):
        return
    log(f"[START] Debloat {name}")
    core.debloat(apps, logger=log)
    info(f"Debloat {name} completed")

def restore(apps, name):
    if not confirm_action("Confirm", f"Restore {name}?"):
        return
    log(f"[START] Restore {name}")
    core.restore(apps, logger=log)
    info(f"Restore {name} completed")

def debloat_all():
    def task():
        if not confirm_action("⚠ WARNING", "Debloat ALL categories?"):
            return
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
        info("Debloat ALL completed")

    threading.Thread(target=task, daemon=True).start()

def restore_all():
    def task():
        if not confirm_action("Confirm", "Restore ALL apps?"):
            return
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
        info("Restore ALL completed")

    threading.Thread(target=task, daemon=True).start()

# =====================
# GUI ROOT
# =====================

root = tk.Tk()
root.iconbitmap("assets/icon.ico")
root.title("Realme C21Y Debloat Tool v5.0 EOL [GUI]")
root.geometry("720x550")
root.resizable(False, False)

content_frame = tk.Frame(root)
content_frame.pack(fill="both", expand=True)

# =====================
# TITLE + TOP BAR
# =====================

top_bar = tk.Frame(content_frame)
top_bar.pack(fill="x", pady=(5, 0))
top_bar.grid_columnconfigure(0, weight=1)

dark_btn = tk.Button(
    top_bar,
    text="DARK MODE",
    width=12,
    font=("Segoe UI", 9, "bold"),
    command=toggle_dark_mode
)
dark_btn.grid(row=0, column=1, padx=10, sticky="e")

title_label = tk.Label(
    content_frame,
    text="Realme C21Y Debloat Tool",
    font=("Segoe UI", 18, "bold")
)
title_label.pack(pady=10)

# =====================
# CATEGORY LIST
# =====================

frame = tk.Frame(content_frame)
frame.pack(pady=(6, 18))

categories = [
    ("Google Apps", core.GOOGLE_APPS),
    ("Social / Entertainment", core.SOCIAL_APPS),
    ("E-Commerce", core.ECOM_APPS),
    ("Realme Bloatware", core.REALME_APPS),
    ("Office Apps", core.OFFICE_APPS),
    ("Auto-Download Apps", core.AUTO_APPS),
]

category_labels = []

for i, (name, apps) in enumerate(categories):
    lbl = tk.Label(frame, text=name, width=24, anchor="w", font=("Segoe UI", 10))
    lbl.grid(row=i, column=0, padx=8, pady=6)
    category_labels.append(lbl)

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
            text="⚠",
            width=3,
            bg="#f39c12",
            fg="white",
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
    font=("Consolas", 9)
)
terminal.pack(side="left", fill="both", expand=True)

scroll = tk.Scrollbar(terminal_frame, command=terminal.yview)
scroll.pack(side="right", fill="y")
terminal.config(yscrollcommand=scroll.set)

log("[INFO] Application started")

# =====================
# ACTION BUTTONS
# =====================

action_frame = tk.Frame(content_frame)
action_frame.pack(pady=(10, 16))

BTN_STYLE = {"relief": "raised", "bd": 2, "cursor": "hand2"}

tk.Button(action_frame, text="VERIFY ADB", width=14, height=2,
          bg="#2980b9", fg="white", command=verify_adb, **BTN_STYLE).grid(row=0, column=0, padx=6)

tk.Button(action_frame, text="DEVICE INFO", width=14, height=2,
          bg="#8e44ad", fg="white", command=show_device_info, **BTN_STYLE).grid(row=0, column=1, padx=6)

tk.Button(action_frame, text="DEBLOAT ALL", width=14, height=2,
          bg="#c0392b", fg="white", command=debloat_all, **BTN_STYLE).grid(row=0, column=2, padx=6)

tk.Button(action_frame, text="RESTORE ALL", width=14, height=2,
          bg="#27ae60", fg="white", command=restore_all, **BTN_STYLE).grid(row=0, column=3, padx=6)

tk.Button(action_frame, text="EXIT", width=14, height=2,
          command=root.destroy, **BTN_STYLE).grid(row=0, column=4, padx=6)

# =====================
# INIT
# =====================

load_config()
apply_theme()
root.mainloop()
