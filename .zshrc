if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

fpath+=($HOME/Apps/pure)
autoload -U promptinit; promptinit
prompt pure

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

bindkey -e # use emacs keybindings
