
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/joshwentzien/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


set fish_greeting
eval "$(/opt/homebrew/bin/brew shellenv fish)"

set theme_file ~/.config/.theme_mode

if test -f $theme_file
  set mode (string trim (cat $theme_file))

  choose_fish_theme $mode
end
