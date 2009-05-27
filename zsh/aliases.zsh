# My aliases
alias ss='./script/server'
alias sc='./script/console'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'
alias mysql_config='/opt/local/bin/mysql_config5'
alias pull="git pull"
alias ci="git commit"
alias st="git st"
alias "log"="git log"
alias add="git add"
alias railstags="rtags --vi -a -f tags -R app"
alias push="git push"
alias ¡="pull && push"

function reload () {
  touch tmp/restart.txt
}

function rm () {
  mv $* ~/.Trash
}

function git_deleted () {
  git st | rak deleted | awk '{print $3}'
}

function gco () {
  git checkout $*
}

# cd to the default working directory set by current_working_project
function cdefault { 
  export wdir=`cat $HOME/bin/config/current_project_path`
  cd $wdir 
}

cdefault

function cdproject { cd $HOME/projects/$* }
compctl -W "$HOME/projects" -g '*(-/)' cdproject


function pgrep {
  ps aux | grep $*
}


function sp {
  script/spec -cfs spec/$*
}
compctl -W "spec" -g '*' sp


function setIcon () {
  echo "read 'icns' (-16455) \"${1}\";" | /Developer/Tools/Rez -o ${2}
  /Developer/Tools/SetFile -a "C" ${2}
}

function follow () {
  tail -n 0 -f $*
}

function cuke () {
  if [[ -e ./script/cucumber ]]
  then
    ./script/cucumber -f progress features/$*
  else
    cucumber -f progress features/$*
  fi
}
compctl -W "features" -g '*.feature' cuke

function :w () {
  echo "Ugh. You're not in vim, and your shits all retarded"
}

function v () {
   ssh vm "$*"
}
