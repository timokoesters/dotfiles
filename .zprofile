# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH="/home/playlucky/.local/share/cargo/bin:${PATH}:/opt/grim:/opt/slurp:$HOME/Downloads/Ndless/ndless-sdk/toolchain/install/bin:$HOME/Downloads/Ndless/ndless-sdk/bin"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# Alacritty
export WINIT_HIDPI_FACTOR=1

# Sway
export XDG_CURRENT_DESKTOP=KDE
export KDE_SESSION_VERSION="5"

# Default editor
export EDITOR=/usr/bin/nvim

# Keyboard options (sway)
export XKB_DEFAULT_OPTIONS=caps:escape

# XDG dirs
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# Unclutter home
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android

export _JAVA_AWT_WM_NONREPARENTING=1
export TERM='xterm-256color'
