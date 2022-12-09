export PATH="$HOME/.local/bin:$PATH"

if hash nvim 2>/dev/null; then
  export EDITOR=nvim
fi
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if hash setxkbmap 2>/dev/null; then
  setxkbmap -option ctrl:nocaps
fi
