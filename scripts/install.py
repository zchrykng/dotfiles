#!/bin/env python

from pathlib2 import Path
from sys import platform
import os


home = os.environ['HOME']
configroot = os.path.join(home, ".config")
dotfiles = os.path.join(configroot, "dotfiles")
zshfiles = os.path.join(configroot, "zsh")
gopath = os.path.join(home, "Go")
operatingsystem = "unknown"

if platform == "linux" or platform == "linux2":
    print "linux"
    debcheck = Path("/etc/debian_version")
    if debcheck.exists():
        print "debian"
        operatingsystem = "debian"
    fedcheck = Path("/etc/fedora-release")
    if fedcheck.exists():
        print "fedora"
        operatingsystem = "fedora"
elif platform == "darwin":
    print "macOS"
    operatingsystem = "mac"
elif platform == "win32":
    print "windows"
    operatingsystem = "windows"





my_file = Path("/path/to/file")
if my_file.is_file():
    # file exists

if my_file.is_dir():
    # directory exists

if my_file.exists():
    # path exists

os.makedirs(path, mode)

os.symlink(src, dst)

