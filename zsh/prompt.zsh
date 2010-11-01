git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(git st 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo " "
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo " "
    else
      echo "*"
    fi
  fi
}

git_pair() {
  git pair -si
}

git_prompt_info () {
 ref=$(git symbolic-ref HEAD 2>/dev/null) || return
 echo "(%{\e[0;35m%}${ref#refs/heads/}%{\e[0m%}/$(git_pair))"
}

project_name () {
  name=$(pwd | awk -F'projects/' '{print $2}' | awk -F/ '{print $1}')
  echo $name
}

project_name_color () {
  name=$(project_name)
  echo "%{\e[0;35m%}${name}%{\e[0m%}"
}

unpushed () {
  git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo "%{\e[0;33m%}$%{\e[0m%}"
  fi
}

export PROMPT=$'%{\e[0;36m%}%1/%{\e[0m%}/ '
set_prompt () {
  export RPROMPT="$(git_prompt_info)$(git_dirty)$(need_push)"
}

set_iterm_title() {
  echo -ne "\e]2;$(pwd)\a" 
}

set_iterm_tab() {
  if [ $TABNAME ]
  then
    echo -ne "\e]1;$TABNAME\a" 
  else
    echo -ne "\e]1;$(project_name)\a" 
  fi
}

precmd() {
  set_prompt
  set_iterm_title
  set_iterm_tab
}

