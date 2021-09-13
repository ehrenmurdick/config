function getip
  ip addr show | sed -n -e 's/\s*inet \(192.[0-9.]*\).*/\1/p'
end
