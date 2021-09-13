set -p PATH ~/.local/bin
set -p PATH ~/.cargo/bin
set -p PATH (yarn global bin)
set -p PATH ~/.gem/ruby/2.7.0/bin
set -p PATH /var/lib/snapd/snap/bin

set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/rc
set -gx FZF_DEFAULT_COMMAND "fd"

set -gx BC_ENV_ARGS /home/ehren/.config/bc
set -gx EDITOR (which nvim)

set -gx SHELL /usr/bin/fish
thefuck --alias | source

# fuck you android studio and everything you stand for
set -x _JAVA_AWT_WM_NONREPARENTING 1

set SUDO_ASKPASS /usr/lib/ssh-askpass

set GPG_TTY (tty)

set -U EDITOR nvim

fish_vi_key_bindings

# fundle plugin 'tuvistavie/fish-ssh-agent'
# fundle plugin 'gretel/fasd'
# fundle init

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ehren/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/ehren/Downloads/google-cloud-sdk/path.fish.inc'; end

bind -M insert \er __select_from_last

# bind '"\er": redraw-current-line'
# bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
# bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
# bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
# bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
# bind '"\C-g\C-r": "$(gr)\e\C-e\er"'
