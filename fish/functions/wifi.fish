function wifi
  echo $argv[1]
  sudo netctl switch-to $argv[1]
  sudo netctl wait-online $argv[1]
end
