function inner_toggle

  set MODE_FILE "$HOME/.config/.theme_mode"
  set TMUX_FILE "$HOME/.config/tmux/.tmux_theme_dark"
  set NVIM_FILE "$HOME/.config/nvim/.nvim_theme_dark"
    
  test -f $MODE_FILE; or exit 1
  set -l current_mode (cat $MODE_FILE)

  set -l new_mode
  if test "$current_mode" = "dark"
      set new_mode "light"
      rm -f $TMUX_FILE $NVIM_FILE
      choose_ghostty_theme light
      choose_fish_theme light
  else
      set new_mode "dark"
      touch $TMUX_FILE $NVIM_FILE
      choose_ghostty_theme dark
      choose_fish_theme dark
  end

  echo $new_mode > $MODE_FILE

  # tmux kill-server
end


