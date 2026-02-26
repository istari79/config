function toggle
  if test "$TERM" = "screen-256color" -a -n "$TMUX"
    set session_name (tmux display-message -p '#S')
    tmux detach -E "inner_toggle && tmux attach -t $session_name"
  else
    inner_toggle
  end
  # The file is not updated quick enough, so sleep for a small period of time.
  sleep 0.05
  source ~/.config/fish/config.fish
end
