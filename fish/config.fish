set PATH ~/.node_modules/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.yarn/bin $PATH
set PATH ~/.config/yarn/global/node_modules/.bin $PATH

set -gx SHELL /usr/bin/fish
thefuck --alias | source

set PATH ./node_modules/.bin $PATH

# fuck you android studio and everything you stand for
set -x _JAVA_AWT_WM_NONREPARENTING 1

set SUDO_ASKPASS /usr/lib/ssh-askpass

set GPG_TTY (tty)

set -U EDITOR nvim

fish_vi_key_bindings

# fundle plugin 'tuvistavie/fish-ssh-agent'
# fundle plugin 'gretel/fasd'
# fundle init
