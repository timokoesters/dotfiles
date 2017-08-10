#!/usr/bin/env bash

test -f $HOME/.config/nvim/init.vim \
  && echo "Found existing .vimrc; Skipping" \
  || echo "source ~/dotfiles/init.vim" > "$HOME/.config/.nvim/init.vim"
  
test -f $HOME/.tmux.conf \
  && echo "Found existing .tmux.conf; Skipping" \
  || echo "source ~/dotfiles/.tmux.conf" > "$HOME/.tmux.conf"
  
test -f $HOME/.zshrc \
  && echo "Found existing .zshrc; Skipping" \
  || echo "source ~/dotfiles/.zshrc" > "$HOME/.zshrc"

mkdir "$HOME/.vim"
mkdir "$HOME/.config/nvim"
mkdir "$HOME/.vimundo/"
mkdir "$HOME/.tmux/"
mkdir "$HOME/.zsh/"

vim \
  -c 'PluginClean' \
  -c 'PluginInstall' \
  -c 'TmuxlineSnapshot ~/.tmux/tmuxline' \
  -c 'PromptlineSnapshot! ~/.zsh/promptline airline' \
  -c 'qa!'
