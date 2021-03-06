# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"

zplug load

# Rustup autocomplete
fpath+=~/.zfunc

# Use modern completion system
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt correct
setopt sharehistory
setopt extendedhistory

bindkey -e
bindkey $terminfo[kLFT5] backward-word
bindkey $terminfo[kRIT5] forward-word
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal<Paste>

# More aliases
alias present='pdfpc'
alias present_with_notes='pdfpc --notes right'
alias sshfspi='sshfs koesters.ddns.net /media/playlucky/koesters.ddns.net/'
alias stbig='st -f"Inconsolata:pixelsize=26:antialias=true:autohint=true";'
alias offline='sudo unshare -n sudo -u timokoesters'
alias ls='ls --color'
alias ll='ls --color -lAh'
alias echome='pactl load-module module-loopback latency_msec=1'
alias newsongs='youtube-dl -xwci'

# Update system
alias aa='sudo apt update && sudo apt upgrade'
alias ai='sudo apt install'
alias as='apt-cache search'
alias al-'sudo apt list'
alias ar='sudo apt remove'
alias au='sudo apt update'
alias pa='sudo pacman -Syu'
alias pi='sudo pacman -Sy'
alias ea='sudo emerge --sync && sudo emerge -uDUav --keep-going --with-bdeps=y @world'

# Change programs
alias rm='echo "Please use trash instead"; false'
alias ranger='ranger --choosedir=$HOME/.rangerdir; cd `cat $HOME/.rangerdir`'
alias tintin='tintin $HOME/.config/tintin/run.tin'
alias grep='grep --color=auto'
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias bc='bc -l'

gpg-connect-agent /bye

clear
