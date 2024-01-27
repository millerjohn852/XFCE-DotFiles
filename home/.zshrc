#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# Filename: .zshrc
# GitLab: https://gitlab.com/ronaldr1985/dot-files
# Maintainer: Ronald1985

# Version Control Stuff {{{

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'

# }}}

# Prompt {{{

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT='%B %F{white}%m %F{green}%2~${vcs_info_msg_0_}%F{white} %# %f%b'

# }}}

# Look and colors {{{

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
LS_COLORS=$LS_COLORS:'di=0;32:';
export LS_COLORS

# }}}

# Autocomplete {{{

# Include hidden files in autocomplete:
_comp_options+=(globdots)

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Keybindings for autocomplete tab in keybindings section

# }}}

# History {{{

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# }}}

# Behaviour {{{

autoload -U edit-command-line

# }}}

# Keybindings {{{

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Reverse Search
bindkey -v
bindkey '^R' history-incremental-search-backward

# Enable ctrl-w delete word
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# Eliminate delays when pressing ESC
export KEYTIMEOUT=1

zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# }}}

# Cursor {{{

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# }}}

# Sourcing files {{{

# Aliases
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/fzf_colours" ] && source "$HOME/.config/shell/fzf_colours"

# Syntax Highlighting
source "$HOME/.local/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# AutoSuggetions
source "$HOME/.local/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# }}}

# vim:foldmethod=marker:foldlevel=0
