#!/bin/sh

rm ~/.zshrc ~/.tmux.conf ~/.emacs ~/.emacs.d/init.el ~/.config/sway/config ~/.config/nvim/init.vim
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.emacs ~/.emacs
ln -s ~/dotfiles/.emacs.d/init.el ~/.emacs.d/init.el
ln -s ~/dotfiles/.config/sway/config ~/.config/sway/config
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
