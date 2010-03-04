_sake_does_task_list_need_generating () {
  if [ ! -f ~/.zsh_sake_cache ]; then return 0;
  else
    accurate=$(stat -f%m ~/.zsh_sake_cache)
    changed=$(stat -f%m ~/.sake)
    return $(expr $accurate '>=' $changed)
  fi
}

_sake () {
  if [ -f ~/.sake ]; then
    if _sake_does_task_list_need_generating; then
      sake -Tv | cut -d " " -f 2 > ~/.zsh_sake_cache
    fi
    compadd `cat ~/.zsh_sake_cache`
  fi
}

compdef _sake sake
