echo "source ~/dotfiles/.vimrc" > "~/.vimrc"
echo "source ~/dotfiles/.tmux.conf" > "~/.tmux.conf"
echo "source ~/dotfiles/.zshrc" > "~/.zshrc"

mkdir "~/.vimundo/"
mkdir "~/.tmux/"
mkdir "~/.zsh/"

vim \
  -c 'PluginClean' \
  -c 'PluginInstall' \
  -c 'TmuxlineSnapshot ~/.tmux/tmuxline' \
  -c 'PromptlineSnapshot! ~/.zsh/promptline airline' \
  -c 'qa!'
