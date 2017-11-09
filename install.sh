#!/bin/sh

rm $HOME/.zshrc $HOME/.tmux.conf $HOME/.emacs $HOME/.emacs.d/init.el $HOME/.config/sway/config $HOME/.config/nvim/init.vim $HOME/.local/share/konsole/gruvbox.colorscheme
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.emacs $HOME/.emacs
ln -s $HOME/dotfiles/.emacs.d/init.el $HOME/.emacs.d/init.el
ln -s $HOME/dotfiles/.config/sway/config $HOME/.config/sway/config
ln -s $HOME/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/.local/share/konsole/gruvbox.colorscheme $HOME/.local/share/konsole/gruvbox.colorscheme
