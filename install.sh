#!/bin/sh

rm $HOME/.zshrc $HOME/.tmux.conf $HOME/.emacs $HOME/.emacs.d/init.el $HOME/.config/sway/config $HOME/.config/nvim/init.vim $HOME/.local/share/konsole/gruvbox.colorscheme $HOME/.tmux/tmuxline $HOME/.zsh/promptline
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.emacs $HOME/.emacs
ln -s $HOME/dotfiles/.emacs.d/init.el $HOME/.emacs.d/init.el
ln -s $HOME/dotfiles/.config/sway/config $HOME/.config/sway/config
ln -s $HOME/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/.local/share/konsole/gruvbox.colorscheme $HOME/.local/share/konsole/gruvbox.colorscheme
ln -s $HOME/dotfiles/.tmux/tmuxline $HOME/.tmux/tmuxline
ln -s $HOME/dotfiles/.zsh/promptline $HOME/.zsh/promptline
ln -s $HOME/dotfiles/.config/ranger/bookmarks $HOME/.config/ranger/bookmarks
ln -s $HOME/dotfiles/.config/ranger/commands $HOME/.config/ranger/commands
ln -s $HOME/dotfiles/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -s $HOME/dotfiles/.config/ranger/scope.sh $HOME/.config/ranger/scope.sh
ln -s $HOME/dotfiles/.config/i3status/config $HOME/.config/i3status/config
ln -s $HOME/dotfiles/.config/termite/config $HOME/.config/termite/config
ln -s $HOME/dotfiles/.zprofile $HOME/.zprofile
ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
