export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias be="bundle exec"

if command -v nvim >/dev/null; then
  export EDITOR=nvim
fi
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

. "$HOME/.cargo/env"
