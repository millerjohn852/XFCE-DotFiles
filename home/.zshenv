export PATH="$HOME/.local/bin:$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$HOME/.go/bin/:$PATH"

## go
export GOPATH=$HOME/.go

## ls
LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS

## Default Applications
export EDITOR=nvim
export TERM=alacritty
export BROWSER=chromium
export CC=clang
