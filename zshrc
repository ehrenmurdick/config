# START: EXPORTS
export PATH="/opt/local/lib/postgresql82/bin/:/usr/local/bin:/opt/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/sw/bin:$HOME/bin:/opt/local/lib/postgresql83/bin"
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'
# END: EXPORTS

function reload () {
  touch tmp/restart.txt
}

function load_pg_on_reboot () {
  sudo launchctl load -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist
}

function cdproject { cd $HOME/projects/$* }
compctl -W "$HOME/projects" -g '*(-/)' cdproject

function unload_pg_on_reboot() {
  sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql83-server.plist
}

# START RAKE COMPLETION (caching rake tasks per project directory, not globally)
function _rake_does_task_list_need_generating () {
  if [ ! -f .zsh_rake_cache ]; then
    return 0;
  else
    accurate=$(stat -f%m .zsh_rake_cache)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

function _rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating zsh rake cache..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .zsh_rake_cache
    fi
    reply=( `cat .zsh_rake_cache` )
  fi
}
compctl -K _rake rake
# ENDING RAKE COMPLETION

# color module
autoload colors ; colors	
###########################################
#   iTerm Tab and Title Customization     #
###########################################

# Put the string "hostname::/full/directory/path" in the title bar:
set_iterm_title() { 
	echo -ne "\e]2;$HOST:r:r::$PWD\a" 
}

# Put the parentdir/currentdir in the tab
set_iterm_tab() {
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

set_iterm_running_app() {
 printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

precmd() { 
	set_iterm_title
	set_iterm_tab
}
preexec() { 
  set_iterm_running_app
}

postexec() {
  set_iterm_running_app
}

# Keeps the paths from growing too big    
typeset -U path manpath fpath

# HISTORY
HISTSIZE=600
SAVEHIST=600
HISTFILE=~/.zsh_history
setopt append_history 
setopt inc_append_history 

# MISC CONFIG
setopt complete_in_word         # Not just at the end
setopt always_to_end            # When complete from middle, move cursor
setopt nohup										# In general, we don't kill background jobs upon logging out

# COMPLETION
zmodload -i zsh/complist
zstyle ':completion:*' menu select=10
zstyle ':completion:*' verbose yes

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Prevent CVS/SVN files/directories from being completed:
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)SVN'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#SVN'

## With commands like `rm' it's annoying if one gets offered the same filename
## again even if it is already on the command line. To avoid that:
zstyle ':completion:*:rm:*' ignore-line yes

# Force 'sudo zsh' to start root as a logging shell to avoid problems with environment clashes:
function sudo {
	if [[ $1 = "zsh" ]]; then
        command sudo /opt/local/bin/zsh -l
	else
        command sudo "$@"
	fi
}

     
# ALIASES
alias ls='ls -G'
alias ll='ls -hl'
alias tar='nocorrect /usr/bin/tar'
alias sudo='nocorrect sudo'
alias rmate='mate app config doc db lib public script spec test stories liquid'
alias ri='ri -Tf ansi'
alias rtasks='rake --tasks'
alias sp='./script/spec -cfs'
alias ss='./script/server'
alias sc='./script/console'
alias cruise='svn up; rake cruise'
alias vi='vim'
alias postgres_start='pg_ctl -D ~/.pgdata -l ~/.pgdata/psql.log start'
alias vim='vim -p'
alias postgres_stop='pg_ctl -D ~/.pgdata stop'
alias mysql='/opt/local/bin/mysql5 -u root --socket=/tmp/mysql.sock'
alias mysqladmin='/opt/local/bin/mysqladmin5 -u root --socket=/tmp/mysql.sock'

alias ff='open -a FireFox'
alias safari='open -a Safari'
alias css='open -a CssEdit'

function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g -p $* & } 

compctl -g '*.(jpg|png|gif|tiff|jpeg|pdf)' preview
compctl -g '*.psd' photoshop

# AUTO EXECUTABLE EXTENSIONS
# Set up auto extension stuff
# alias -s rb=/opt/local/bin/ruby

# EXPORT
export EDITOR='mate -w'

export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad 

# KEY BINDINGS
# emacs mode for keys
#bindkey -e
# vi mode for keys
#bindkey -v


bindkey '^K' kill-whole-line
bindkey -s '^L' "|less\n"		# ctrl-L pipes to less
bindkey -s '^B' " &\n"			# ctrl-B runs it in the background
bindkey "\e[1~" beginning-of-line	# Home (console)
bindkey "\e[H" beginning-of-line	# Home (xterm)
bindkey "\e[4~" end-of-line		# End (console)
bindkey "\e[F" end-of-line		# End (xterm)
bindkey "\e[2~" overwrite-mode		# Ins
bindkey "\e[3~" delete-char		# Delete



function gco () {
  git co $*
}

function _gco () {
  reply=(`git branch | ruby -lne 'puts $_.gsub("*", "").gsub(" ", "")'`)
}
compctl -K _gco gco


# cd to the default working directory from iterm
function cdefault { 
  export wdir=`/Users/ehrenmurdick/bin/iterm_default_wd`
  cd $wdir 
}

cdefault

function svn_new () {
  svn st | grep '^?' | awk '{print $2}'
}

git_prompt_info () {
 ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
 echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
}

project_name () {
  name=$(pwd | awk -F'projects/' '{print $2}' | awk -F/ '{print $1}')
  echo "%{\e[0;35m%}${name}%{\e[0m%}"
}

export PROMPT=$'%{\e[0;36m%}%1/%{\e[0m%}/ '
set_prompt () {
  export RPROMPT=$(project_name)$(git_prompt_info)
}


precmd() {
  set_prompt
}

function sr { ./script/runner $* }
