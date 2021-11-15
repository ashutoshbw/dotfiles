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
# nvim
#

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

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
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh"

rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#
# Fonts
#

# Install manually installed fonts
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"


# fontconfig conf
rm -rf "$XDG_CONFIG_HOME/fontconfig"
ln -s "$DOTFILES/fontconfig" "$XDG_CONFIG_HOME"

