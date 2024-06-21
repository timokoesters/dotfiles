#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface icon-theme 'breeze-dark'
/home/timo/Development/Repos/plasma-theme-switcher/cmake-build-release/plasma-theme plasma-theme -c /usr/share/color-schemes/BreezeDark.colors -w Breeze
