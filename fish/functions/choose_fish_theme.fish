function choose_fish_theme --argument-names theme
  switch $theme
    case dark
      fish_config theme choose 'lava'
    case light
      fish_config theme choose 'snow-day'
    case '*'
      echo "bad param '$theme' passed to choose_fish_theme"
      return 1
  end
end
