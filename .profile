#!/bin/sh
# shellcheck disable=SC1090

export BAT_STYLE=changes,grid,header-filename,snip
export CDPATH="$HOME/Code"
export LESS="--no-init --quit-if-one-screen --raw-control-chars"
export LIBVIRT_DEFAULT_URI=qemu:///system
export PATH="$HOME/.local/bin:$PATH"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/keyring/ssh"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias be="bundle exec"
alias dc="docker compose"

export EDITOR=vi
if command -v nvim >/dev/null; then
  export EDITOR=nvim
elif command -v vim >/dev/null; then
  export EDITOR=vim
fi

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if [ -r ~/.secrets ]; then
  . ~/.secrets
fi

# zsh also reads this file, and zsh stops at a glob that has no match.
if [ -n "${ZSH_VERSION:-}" ]; then
  setopt no_nomatch
fi
for f in "${XDG_CONFIG_HOME:-$HOME/.config}"/secrets.d/*.sh; do
  if [ -r "$f" ]; then
    . "$f"
  fi
done
unset f
if [ -n "${ZSH_VERSION:-}" ]; then
  setopt nomatch
fi

if [ -f ~/.cargo/env ]; then
  . ~/.cargo/env
fi
