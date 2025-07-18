export BROWSER="qutebrowser"
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM="xterm-256color"

export LANG="de_DE.UTF-8"
export LC_COLLATE="C"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export XDG_DESKTOP_DIR=$HOME/
export XDG_DOCUMENTS_DIR=$HOME/dox
export XDG_DOWNLOAD_DIR=$HOME/dls
export XDG_MUSIC_DIR=$HOME/audio/music
export XDG_PICTURES_DIR=$HOME/pix
export XDG_VIDEOS_DIR=$HOME/vids

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE=$ZDOTDIR/zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export CLICOLOR=1

if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -f $XDG_CONFIG_HOME/aliasrc.sh ]]; then
    source $XDG_CONFIG_HOME/aliasrc.sh
fi
