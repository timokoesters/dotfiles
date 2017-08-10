set-option -g default-shell /bin/zsh                    # Make zsh default shell
set-option -ga terminal-overrides ",xterm-256color:Tc"  # Force truecolor support
set -g @plugin 'tmux-plugins/tpm'                       # Let tpm manage itself

set -g mouse on

set -g @plugin 'tmux-plugins/tmux-sensible'             # Basic tmux settings
source ~/.tmux/tmuxline                                 # Load statusline created with vim

run '~/.tmux/plugins/tpm/tpm'                           # Initialize plugin manager

set -sg escape-time 0

bind | split-window -h
bind _ split-window -v
unbind '"'
unbind %
