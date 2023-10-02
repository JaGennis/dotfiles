if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vi-mode
bindkey -v
bindkey -v '^?' backward-delete-char
# set delay to 0.2 seconds after pressing ESC
export KEYTIMEOUT=20

zplugin ice wait lucid
zplugin light zsh-vi-more/vi-increment

zinit snippet OMZ::plugins/git/git.plugin.zsh

zplugin ice pick'init.zsh' blockf
zplugin light laggardkernel/git-ignore
alias gi="git-ignore"

# setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
# setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
# setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_space # ignore entries preceded by a space

# enable colors
# autoload -U colors && colors

# Basic auto/tab complete:
zstyle ':completion:*' menu select
# eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
# autoload -U compinit
# zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

# aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit ice depth=1 atload'!source ~/.config/zsh/p10k.zsh' lucid
zinit light romkatv/powerlevel10k

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
bindkey '^ ' autosuggest-accept

# zplugin ice wait'0' lucid
# zplugin light laggardkernel/zsh-thefuck
# bindkey "\e\e" fuck-command-line

# zsh-syntax-highlighting
zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zplugin ice wait'0' lucid
zinit light agkozak/zsh-z
export ZSHZ_DATA=~/.config/zsh/z


# Load Angular CLI autocompletion.
# source <(ng completion script)
# export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

export PATH="/Users/jannis.geuppert/.rd/bin:$PATH"
