#!/bin/sh
# shellcheck disable=SC1090

export CDPATH="$HOME/Code"
export LESS="--no-init --quit-if-one-screen --raw-control-chars"
export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias be="bundle exec"

export EDITOR=vim
if command -v nvim >/dev/null; then
  export EDITOR=nvim
fi
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if [ -f ~/.secrets ]; then
  . ~/.secrets
fi

if [ -f ~/Apps/asdf/asdf.sh ]; then
  . ~/Apps/asdf/asdf.sh
fi

if [ -f ~/.cargo/env ]; then
  . ~/.cargo/env
fi
