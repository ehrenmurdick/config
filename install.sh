promptyn () {
    while true
    do
        read -p "$1 [y/n] " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer y or n";;
        esac
    done
}

install() {
  curl -s "https://raw.github.com/ehrenmurdick/config/master/$1" > ~/.$1
}

safeInstall() {
  if [ -f ~/.$1 ]; then
    if promptyn "file ~/.$1 exists. overwrite?"; then
      install $1
      return 0;
    fi
  fi
  return 1;
}

promptInstall() {
  if promptyn "install $1?"; then
    if safeInstall $1; then
      echo $2
      echo
      return 0;
    else
      echo
      return 1;
    fi
  else
    echo
    return 1;
  fi
}


promptInstall 'vimrc' 'Run :BundleInstall the first time you start vim'
promptInstall 'gvimrc'
