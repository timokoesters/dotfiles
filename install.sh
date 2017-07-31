#!/usr/bin/env bash

echo "source ~/dotfiles/.vimrc" > "$HOME/.vimrc"
echo "source ~/dotfiles/.tmux.conf" > "$HOME/.tmux.conf"
echo "source ~/dotfiles/.zshrc" > "$HOME/.zshrc"

mkdir "$HOME/.vimundo/"
mkdir "$HOME/.tmux/"
mkdir "$HOME/.zsh/"

vim \
  -c 'PluginClean' \
  -c 'PluginInstall' \
  -c 'TmuxlineSnapshot ~/.tmux/tmuxline' \
  -c 'PromptlineSnapshot! ~/.zsh/promptline airline' \
  -c 'qa!'
