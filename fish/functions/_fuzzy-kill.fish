function _fuzzy-kill
  echo $argv[1] | tr -s ' ' | cut -d' ' -f 2 | xargs kill -9
end

