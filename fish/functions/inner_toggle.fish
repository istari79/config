function inner_toggle

  set MODE_FILE "$HOME/.config/.theme_mode"
    
  test -f $MODE_FILE; or exit 1
  set -l current_mode (cat $MODE_FILE)

  if test "$current_mode" = "dark"
      set -U theme_mode "light"
      tmux source-file ~/.config/tmux/tmux.conf &
      choose_ghostty_theme light
      choose_fish_theme light
  else
      set -U theme_mode "dark"
      tmux source-file ~/.config/tmux/tmux.conf &
      choose_ghostty_theme dark
      choose_fish_theme dark
  end

  echo $theme_mode > $MODE_FILE
  
  # tmux kill-server
end


