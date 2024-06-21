#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'breeze'
/home/timo/Development/Repos/plasma-theme-switcher/cmake-build-release/plasma-theme plasma-theme -c /usr/share/color-schemes/BreezeLight.colors -w Breeze 
