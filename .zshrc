autoload -Uz compinit promptinit predict-on
compinit 
promptinit
predict-on

setopt COMPLETEINWORD
setopt CORRECTALL

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

setopt auto_cd

alias ll='ls -la'

source ~/.zsh/promptline
