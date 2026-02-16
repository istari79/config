function switch_ghostty_theme
    set -g dynamic_theme_file "$HOME/.config/ghostty/dynamic-theme"
  
    function set_theme
        echo "theme = $argv[1]" > $dynamic_theme_file
        killall -SIGUSR2 ghostty # reset (in Linux)
    end
  
    if test "$argv[1]" = "light"
        set_theme "Catppuccin Latte"
    else
        set_theme "Catppuccin Mocha"
    end
end
