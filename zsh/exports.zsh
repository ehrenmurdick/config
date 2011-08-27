export PROJECTS=~/Projects
export CDPATH=$PROJECTS:~/ # autocd to projects and home

export CLICOLOR=1 # turns on colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-color

export GREP_COLOR='3;33'
export GREP_OPTIONS='--color=auto' 

export EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"' # edit git commit messages (among other things) in vim

export RUBYOPT='rubygems' # ruby always requires rubygems
