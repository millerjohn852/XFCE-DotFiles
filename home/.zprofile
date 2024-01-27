#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|
#
# Filename: .zprofile
# GitLab: https://gitlab.com/ronaldr1985/dot-files
# Maintainer: Ronald1985

# Get files if they don't exist {{{

# AutoSuggestions
[ -f "$HOME/.local/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] || git clone "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.local/zsh/zsh-autosuggestions"

# Syntax Highlighting
[ -f "$HOME/.local/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] || git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.local/zsh/zsh-syntax-highlighting"

# }}}

# Start X {{{

# If on TTY and not already running start X
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

# }}}

# vim:foldmethod=marker:foldlevel=0
