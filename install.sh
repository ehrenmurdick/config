url() {
  echo "https://raw.githubusercontent.com/ehrenmurdick/config/master/$1"
}

install() {
  curl -s $(url $1) > ~/.$1
}

backup() {
  cp ~/.$1 ~/.$1~
}

safeInstall() {
  echo "Installing $1..."
  if [ -f ~/.$1 ]; then
    echo "File ~/.$1 exists. Backing it up to ~/.$1~"
    backup $1
  fi
  install $1
  return 0;
}

gitConfig() {
  git config --global alias.st status
  git config --global alias.co checkout
  git config --global alias.di duet-commit
  git config --global alias.lola "log --oneline --decorate --all"
  git config --global core.editor /usr/bin/vim
}

safeInstall 'vimrc'
safeInstall 'gvimrc'
safeInstall 'irbrc'
safeInstall 'ackrc'

echo 'Installing bundles...'
vim +PluginInstall +qa
echo

echo "Configuring git to not suck..."
gitConfig
