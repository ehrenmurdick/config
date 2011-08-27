# Tab completion with Rake

_rake () {
  if [ -f Rakefile ]; then
    if [ ! -f .zsh_rake_cache ]; then
      rake --silent --tasks | cut -d " " -f 2 > .zsh_rake_cache
    fi
    compadd `cat .zsh_rake_cache`
  fi
}

compdef _rake rake
