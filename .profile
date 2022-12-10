export PATH="$HOME/.local/bin:$PATH"

if command -v nvim >/dev/null; then
  export EDITOR=nvim
fi
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

. "$HOME/.cargo/env"
