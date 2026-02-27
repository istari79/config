function __apply_theme_from_tmux --on-event fish_prompt

    if test "$theme_mode" = "$__last_applied_theme"
        return
    end

    set -g __last_applied_theme $theme_mode

    choose_fish_theme $theme_mode
end
