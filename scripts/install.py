#!/usr/bin/env python3

from sys import platform
import json
import os


home = os.environ['HOME']
configroot = os.path.join(home, ".config")
dotfiles = os.path.join(configroot, "dotfiles")
zshfiles = os.path.join(configroot, "zsh")
gopath = os.path.join(home, "Go")
operatingsystem = "unknown"

if platform == "linux" or platform == "linux2":
    if os.path.isfile("/etc/debian_version"):
        operatingsystem = "debian"
    if os.path.isfile("/etc/fedora-release"):
        operatingsystem = "fedora"
elif platform == "darwin":
    operatingsystem = "mac"
elif platform == "win32":
    operatingsystem = "windows"

with open(os.path.join(dotfiles, "config.json")) as configfile:
    config = json.load(configfile)

for link in config["links"]:
    print("Linking:", os.path.join(home, *link["src"]), "to", os.path.join(home, *link["dest"]))
    if "os" in link:
        linked = False
        if link["os"] != operatingsystem:
            print("Skipping, requires", link["os"], "but current operating system is", operatingsystem)
            continue

    if os.path.exists(os.path.join(home, *link["dest"])):
        print("Skipping, destination already exists")
        continue
    print("Linked")
    # os.symlink(os.path.join(home, *link["src"]), os.path.join(home, *link["dest"]))




for package in config["packages"]:
    print("Installing package:", package["name"])



# my_file = Path("/path/to/file")
# if my_file.is_file():
#     # file exists

# if my_file.is_dir():
#     # directory exists

# if my_file.exists():
#     # path exists

# os.makedirs(path, mode)

# os.symlink(src, dst)

