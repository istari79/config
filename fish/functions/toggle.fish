function toggle
  if test "$TERM" = "screen-256color" -a -n "$TMUX"
    set session_name (tmux display-message -p '#S')
    tmux detach -E "inner_toggle && tmux attach -t $session_name"
  else
    inner_toggle
  end
end
