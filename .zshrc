if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

fpath+=($HOME/Apps/pure)
autoload -U promptinit; promptinit
prompt pure

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

bindkey '^N' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
