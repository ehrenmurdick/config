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

url() {
  echo "https://raw.github.com/ehrenmurdick/config/master/$1"
}

install() {
  curl -s $(url $1) > ~/.$1
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


if promptInstall 'vimrc'; then
  echo 'Installing bundles...'
  tmp=$(mktemp -t vimrc)
  echo "BundleInstall" > $tmp
  vim -c "source $tmp|qa"
fi

promptInstall 'gvimrc'
