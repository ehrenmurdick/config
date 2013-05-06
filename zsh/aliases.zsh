alias ss='./script/server'
alias sc='./script/console'
alias pull="git pull"
alias ci="git commit"
alias st="git st"
alias fetch="git fetch"
alias "log"="git log"
alias push="git push"
alias add="git add"
alias tag="ctags -R config -R app -R lib -R script -R spec"
alias tag!="ctags -R ."
alias fx='git fetch && gitx'
alias giff='git diff | gitx'
alias gitx='gitx --all'
alias stamp='date +%Y%m%d%H%M'
alias be="bundle exec"
alias booya="git pull && git push && git push staging staging:master"

alias easy_off='sudo kextunload -v /System/Library/Extensions/EasyTetherUSBEthernet.kext'

alias c='bundle exec cucumber'
alias s='bundle exec rspec'
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | 
   cut -d\   -f2"

alias last_migration="ls db/migrate | tail -n1 | head -c 14"

# reloads passenger and pow
function reload! () {
  touch tmp/restart.txt
}

function card () {
  git co `git branch -a | grep $1 | tail -n1 | sed 's/.*\///'`
}

# better than rm -rf
function trash () {
  mv $* ~/.Trash
}

# cd to the default working directory set by current_working_project
function cdefault { 
  export wdir=`cat $HOME/bin/config/current_project_path`
  cd $wdir 
}

function current_working_project {
  pwd > ~/bin/config/current_project_path
}
cdefault

function :w () {
  echo "Ugh. You're not in vim, and your shits all retarded"
}

function internet {
  # count 3 packets
  # timeout 3 seconds
  # /dev/null unix devices that doesn't go anywhere
  # 1 is stdout, 2 is stderr, 2 follow 1
  if (ping -c 3 -t 3 google.com > /dev/null 2>&1)
  then
    echo 'yep'
  else
    echo 'nope'
  fi
}

function git-check() {
  git log --format="%H %d" | ack $@
}

function rmb {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
    echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    echo -n "Continue? (y/n):"
    read choice
    echo
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}
