# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# ** is recursive
shopt -s globstar

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|alacritty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi







#gpgconf --launch gpg-agent

# SSH agent
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

alias edit='$EDITOR'
hexedit() {
    xxd $1 $1.hex && edit $1.hex && xxd -r $1.hex $1
}
alias ledger='edit $HOME/Documents/hledger.journal'
alias hledger='hledger -f $HOME/Documents/hledger.journal'
alias hledger-ui='hledger-ui -f $HOME/Documents/hledger.journal'
alias hledger-web='hledger-web -f $HOME/Documents/hledger.journal'
alias echome='pactl load-module module-loopback latency_msec=1'
alias echooff='pactl unload-module module-loopback'
alias diary='edit /home/timo/Documents/typst/diary.typ +99999'
alias dream='edit /home/timo/Documents/typst/dreams.typ +99999'
alias write='edit /home/timo/Documents/Write/'
alias todo='edit /home/timo/Documents/Write/todo.md'
alias scan='gocr $HOME/screenshot.png'
alias backup='sudo borgmatic --verbosity 1 --list --stats'

llama() {
    /home/timo/Development/Repos/llama.cpp/main \
        -m /home/timo/Development/Repos/llama.cpp/model-llama2-uncensored \
        --keep -1 \
        --repeat_penalty 1.0 \
        --prompt-cache /home/timo/Development/Repos/llama.cpp/prompt-cache \
        -i -r "

" --in-prefix "### HUMAN:
" --in-suffix "
### RESPONSE:
" -f /home/timo/Development/Repos/llama.cpp/prompt-$1.txt \
        2> /dev/null \
        | while IFS= read -r -n1 -d$ c; do
            echo -n "$c"
            if [[ $c = "." ]]; then echo ""; fi
         done \
        | awk '/HUMAN:/ {f=0} /HUMAN:/ && g {printf "> "} f && g && NF {print; fflush()} /start/ {g=1}  /RESPONSE:/ {f=1}'
}
askbot() {
    llama bot | tee >( \
        sed -u -e 's/"//g' -e 's/^.*$/(voice_kal_diphone)(SayText "&")/' \
        | festival \
    )
}
askbob() {
    llama bob | tee >( \
        sed -u -e 's/"//g' -e 's/^.*$/(voice_kal_diphone)(SayText "&")/' \
        | festival \
    )
}
askanna() {
    llama anna | tee >( \
        sed -u -e 's/"//g' -e 's/^.*$/(voice_cmu_us_slt_cg)(SayText "&")/' \
        | festival \
    )
}
askdenis() {
    llama denis | tee >( \
        sed -u -e 's/"//g' -e 's/^.*$/(voice_kal_diphone)(SayText "&")/' \
        | festival \
    )
}

alias xwaylaunch='GDK_BACKEND=x11 QT_QPA_PLATFORM=xcb CLUTTER_BACKEND= SDL_VIDEODRIVER= XDG_SESSION_TYPE= WAYLAND_DISPLAY= '
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export XDG_SESSION_TYPE=wayland

PATH="/home/timo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/timo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/timo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/timo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/timo/perl5"; export PERL_MM_OPT;
. "/home/timo/.local/share/cargo/env"


# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
# custom theming
#export QT_QPA_PLATFORMTHEME=gnome
#export QT_STYLE_OVERRIDE=kvantum
if [ "$HOSTNAME" = "desktop" ]; then export XDG_CURRENT_DESKTOP=KDE; fi
if [ "$HOSTNAME" = "laptop" ]; then export XDG_CURRENT_DESKTOP=sway; fi
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export XDG_SESSION_TYPE=wayland
# make firefox use dolphin - this breaks wofi
#export GTK_USE_PORTAL=1
#export GDK_DEBUG=portals
# removes window outlines and stuff
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Firefox fix just in case
export MOZ_ENABLE_WAYLAND=1
# java fix
export _JAVA_AWT_WM_NONREPARENTING=1
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl

export SDL_AUDIODRIVER=alsa

# cuda=rocm weirdness
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# cuda
export PATH=/opt/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/opt/cuda/lib64

export KDE_SESSION_VERSION="5"

# Default editor
export EDITOR=/home/timo/.local/share/cargo/bin/hx
export VISUAL=$EDITOR
export TERMINAL=alacritty

export HELIX_RUNTIME="$HOME"/Development/Repos/helix/runtime

# Keyboard options (sway)
export XKB_DEFAULT_OPTIONS=caps:escape

# XDG dirs
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# Android Studio
export ANDROID_HOME=/home/timo/Android/Sdk/
export ANDROID_NDK_HOME=/home/timo/Android/Sdk/ndk/25.2.9519653/
export LIBRARY_PATH=/home/timo/Android/Sdk/ndk/25.2.9519653/toolchains/llvm/prebuilt/linux-x86_64/lib64/clang/14.0.7/lib/

# Unclutter home
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
source "$HOME/.cargo/env"

#export TERM='xterm-256color'
