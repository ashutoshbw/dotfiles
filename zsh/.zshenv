# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export DOTFILES="$HOME/dotfiles"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Config dir for zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events for internal history
export HISTSIZE=10000

# Maximum events in history file
export SAVEHIST=10000

# The command name to assume if a redirection is specified with no command.
# Defaults to cat.
export NULLCMD=":"

# Make fzf use ripgrep and search for 
# files, hidden ones too, and not .git file or directory
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Starship prompt config location
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"

# Add the path of my local scripts to $PATH
export PATH="$HOME/bin:$PATH"
