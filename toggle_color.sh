#!/bin/zsh

MODE_FILE="$HOME/.config/.theme_mode"
TMUX_FILE="$HOME/.config/tmux/.tmux_theme_dark"
NVIM_FILE="$HOME/.config/nvim/.nvim_theme_dark"

current_mode=$(cat "$MODE_FILE" 2>/dev/null)

if [ "$current_mode" = "dark" ]; then
  new_mode="light"
  rm -f "$TMUX_FILE" "$NVIM_FILE"
  printf "\033]50;SetProfile=latte_mode\a" && ITERM_PROFILE=latte_mode
else
  new_mode="dark"
  touch "$TMUX_FILE" "$NVIM_FILE"
  printf "\033]50;SetProfile=mocha_mode\a" && ITERM_PROFILE=mocha_mode
fi

echo "$new_mode" > "$MODE_FILE"

# tmux source-file ~/.config/tmux/tmux.conf

# # Reload tmux config and catppuccin theme in ALL sessions
# if command -v tmux &>/dev/null; then
#   # List all tmux sessions and send reload commands to each session's first window and pane
#   tmux list-sessions -F '#{session_name}' | while read -r session; do
#     tmux send-keys -t "${session}:0.0" 'source-file ~/.config/tmux/tmux.conf' Enter
#     tmux send-keys -t "${session}:0.0" 'run-shell ~/.config/tmux/plugins/catppuccin/catppuccin.tmux' Enter
#   done
# fi

