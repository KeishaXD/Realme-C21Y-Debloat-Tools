import tkinter as tk
from tkinter import messagebox
import threading
import core

# ================= UTILITY =================

def info(msg):
    root.after(0, lambda: messagebox.showinfo("Info", msg))

def run_task(func, apps, name):
    threading.Thread(
        target=func,
        args=(apps, name),
        daemon=True
    ).start()

# ================= ACTIONS =================

def debloat(apps, name):
    core.debloat(apps)
    info(f"Debloat {name} Completed!")

def restore(apps, name):
    core.restore(apps)
    info(f"Restore {name} Completed!")

def debloat_all():
    def task():
        core.debloat(core.GOOGLE_APPS)
        core.debloat(core.SOCIAL_APPS)
        core.debloat(core.ECOM_APPS)
        core.debloat(core.REALME_APPS)
        core.debloat(core.OFFICE_APPS)
        core.debloat(core.AUTO_APPS)
        info("Debloat ALL Completed!")
    threading.Thread(target=task, daemon=True).start()

def restore_all():
    def task():
        core.restore(core.GOOGLE_APPS)
        core.restore(core.REALME_APPS)
        info("Restore ALL Completed!")
    threading.Thread(target=task, daemon=True).start()

# ================= GUI =================

root = tk.Tk()
root.title("Realme C21Y Debloat Tool v6.0 [GUI]")
root.geometry("650x450")
root.resizable(False, False)

title = tk.Label(
    root,
    text="Realme C21Y Debloat Tool",
    font=("Segoe UI", 18, "bold")
)
title.pack(pady=12)

frame = tk.Frame(root)
frame.pack(pady=10)

# ================= CATEGORY ROWS =================

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

# ================= GLOBAL ACTIONS =================

bottom = tk.Frame(root)
bottom.pack(pady=25)

tk.Button(
    bottom,
    text="DEBLOAT ALL",
    width=18,
    height=2,
    bg="#c0392b",
    fg="white",
    font=("Segoe UI", 10, "bold"),
    command=debloat_all
).grid(row=0, column=0, padx=10)

tk.Button(
    bottom,
    text="RESTORE ALL",
    width=18,
    height=2,
    bg="#27ae60",
    fg="white",
    font=("Segoe UI", 10, "bold"),
    command=restore_all
).grid(row=0, column=1, padx=10)

tk.Button(
    bottom,
    text="EXIT",
    width=10,
    height=2,
    command=root.destroy
).grid(row=0, column=2, padx=10)

root.mainloop()
