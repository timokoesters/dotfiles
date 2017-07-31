autoload -Uz compinit promptinit
compinit 
promptinit

setopt COMPLETEINWORD
setopt CORRECTALL

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

setopt auto_cd

alias ll='ls -la'

source ~/.zsh/promptline
