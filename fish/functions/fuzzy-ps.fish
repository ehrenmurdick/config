function fuzzy-ps
  ps aux | fzf --prompt="ctrl-k to kill >" --bind 'ctrl-k:execute(_fuzzy-kill {})'
end

