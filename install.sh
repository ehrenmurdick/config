url() {
  echo "https://raw.githubusercontent.com/ehrenmurdick/config/master/$1"
}

install() {
  curl -s $(url $1) > ~/.$1
}

backup() {
  if [ -f ~/.$1~ ]; then
    echo "File ~/.$1~ exists. Backing it up to ~/.$1~~"
    backup $1~
  fi

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

echo "Configuring git to not suck..."
git config --global alias.cb "rev-parse --abbrev-ref HEAD"
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.dci duet-commit
git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit"
git config --global alias.pl "pull --ff-only"
git config --global alias.st status
git config --global alias.story '!f() { n=$1; story=$(sed -e "s/#//" <<< $n); branch=$(git branch -a | grep -o "$story[-_a-zA-Z]*" | head -n 1); git checkout $branch; }; f'
git config --global core.editor /usr/bin/vim
git config --global core.excludesfile '~/.gitignore_global'
git config --global alias.pf "pull --ff-only"
git config --global alias.sn "!git show-branch --color=always | less -R"
safeInstall 'vimrc'
safeInstall 'gvimrc'
safeInstall 'irbrc'
safeInstall 'ackrc'
safeInstall 'bash_profile'
safeInstall 'inputrc'

echo 'Installing bundles...'
vim +PluginInstall +qa
echo

