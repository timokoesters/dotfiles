#!/bin/sh

ln -sf ~/.config/alacritty/dark.yaml ~/.config/alacritty/theme.yaml
ln -sf ~/.config/helix/themes/github_dark_high_contrast.toml ~/.config/helix/themes/manual.toml
pkill -USR1 hx
