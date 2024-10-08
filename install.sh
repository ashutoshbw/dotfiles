#!/bin/bash

#
# X11
#

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

#
# i3
#

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#
# alacritty
#

rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME"

#
# kitty
#

rm -rf "$XDG_CONFIG_HOME/kitty"
ln -s "$DOTFILES/kitty" "$XDG_CONFIG_HOME"

#
# nvim
#

rm -rf "$XDG_CONFIG_HOME/nvim"
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"


#
# ranger
#

rm -rf "$XDG_CONFIG_HOME/ranger"
ln -s "$DOTFILES/ranger" "$XDG_CONFIG_HOME"

#
# zathura
#

rm -rf "$XDG_CONFIG_HOME/zathura"
ln -s "$DOTFILES/zathura" "$XDG_CONFIG_HOME"

#
# gitconfig
#

ln -sf "$DOTFILES/gitconfig" "$HOME/.gitconfig"

#
# zsh
#

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases.sh" "$XDG_CONFIG_HOME/zsh"

rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -s "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#
# Fonts
#

# fontconfig conf
rm -rf "$XDG_CONFIG_HOME/fontconfig"
ln -s "$DOTFILES/fontconfig" "$XDG_CONFIG_HOME"

#
# Picom
#

rm -rf "$XDG_CONFIG_HOME/picom"
ln -s "$DOTFILES/picom" "$XDG_CONFIG_HOME"

#
# i3status-rust
#

rm -rf "$XDG_CONFIG_HOME/i3status-rust"
ln -s "$DOTFILES/i3status-rust" "$XDG_CONFIG_HOME"

#
# Startship prompt
#

rm -rf "$XDG_CONFIG_HOME/starship"
ln -s "$DOTFILES/starship" "$XDG_CONFIG_HOME"

#
# User local scripts
#

rm -rf "$HOME/bin"
ln -s "$DOTFILES/bin" "$HOME/bin"

#
# dunst
#

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

#
# tmux
#

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
