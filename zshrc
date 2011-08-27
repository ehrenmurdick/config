autoload -U compinit && compinit
autoload -U zmv
autoload colors && colors

source ~/.zsh/path.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/history.zsh
source ~/.zsh/set_options.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/completion_rake.zsh 
source ~/.zsh/completion_sake.zsh 
source ~/.zsh/projects.zsh



if [[ -s /Users/ehrenmurdick/.rvm/scripts/rvm ]] ; then source /Users/ehrenmurdick/.rvm/scripts/rvm ; fi

ruby -v
