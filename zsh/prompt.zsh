git_prompt_info () {
 ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
 echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
}

project_name () {
  name=$(pwd | awk -F'projects/' '{print $2}' | awk -F/ '{print $1}')
  echo $name
}

project_name_color () {
  name=$(project_name)
  echo "%{\e[0;35m%}${name}%{\e[0m%}"
}

export PROMPT=$'%{\e[0;36m%}%1/%{\e[0m%}/ '
set_prompt () {
  export RPROMPT="$(project_name_color)$(git_prompt_info)"
}

set_iterm_title() {
  echo -ne "\e]2;$(pwd)\a" 
}

set_iterm_tab() {
	echo -ne "\e]1;$(project_name)\a" 
}

precmd() {
  set_prompt
  set_iterm_title
  set_iterm_tab
}

