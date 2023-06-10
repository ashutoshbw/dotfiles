setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# Autocomplete hidden files
_comp_options+=(globdots)

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# Enable vi mode
bindkey -v
# Makes the switch between insert and normal mode faster
export KEYTIMEOUT=1

# User <C-g> for clearing instead of <C-l>, since tmux is using <C-l>
# for switching to left pane
#bindkey -r '^l'
#bindkey -r '^g'
#bindkey -s '^g' 'clear\n'


# Load the `complist` module. It gives you access to `menuselect`.
# `menuselect` allows you to customize the way you can move your cursor
# while auto-completing.
zmodload zsh/complist
# Adds vim mapping for completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable editing a command in your preferred editor set in
# `$EDITOR`(Neovim in this case). `vicmd` makes the keystroke `v`
# to only work when you are in NORMAL mode(called COMMAND mode
# in documentation).
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# start i3 automatically
if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

#
# Plugins
#

# Custom scripts
source $DOTFILES/zsh/scripts.sh


# Fish like auto suggestion for zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=($ZDOTDIR/external $fpath)

# Aliases
source "$XDG_CONFIG_HOME/zsh/aliases.sh"

# Includes the completion script from prezto framework
# link: https://raw.githubusercontent.com/sorin-ionescu/prezto/master/modules/completion/init.zsh
source $DOTFILES/zsh/external/completion.zsh

autoload -Uz compinit; compinit

# Changes the cursor to bar style in insert mode in vi mode
# Note that, the blinking rate is determined by terminal emulator's config usually
autoload -Uz cursor_mode && cursor_mode

# Plugin for going to a parent(or grand parent and so on) directory.
# link: https://github.com/Tarrasch/zsh-bd
autoload -Uz bd

# fzf
if [ $(command -v "fzf") ]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi

# zsh-syntax-highlighting plugin 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fnm
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Start starship prompt 
eval "$(starship init zsh)"

alias luamake=/home/ashutosh/Softwares/lua-language-server/3rd/luamake/luamake
