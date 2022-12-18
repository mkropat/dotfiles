if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

fpath+=($HOME/Apps/pure)
autoload -U promptinit; promptinit
prompt pure

HISTFILE=~/.zsh_history
HISTFILESIZE=100000
HISTSIZE=100000

bindkey -e # use emacs keybindings

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

if [[ -f ~/.rbenv/bin/rbenv ]]; then
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
fi
