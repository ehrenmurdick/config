# My aliases
alias ss='./script/server'
alias sc='./script/console'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'
alias mysql_config='/opt/local/bin/mysql_config5'

function reload () {
  touch tmp/restart.txt
}

function unpushed () {
  git cherry -v origin
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


function see {
  script/focused_selenium spec/selenium/$*
}
compctl -W "spec/selenium" -g '*.rb' see


function sp {
  script/spec -cfs spec/$*
}
compctl -W "spec" -g '*' sp


function pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}
compdef _man pman


function setIcon () {
  echo "read 'icns' (-16455) \"${1}\";" | /Developer/Tools/Rez -o ${2}
  /Developer/Tools/SetFile -a "C" ${2}
}

function rm () {
  mv $* ~/.Trash
}

function follow () {
  tail -n 0 -f $*
}

