if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=nvim
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
