if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

fpath+=($HOME/Apps/pure)
autoload -U promptinit; promptinit
prompt pure

HISTFILE=~/.zsh_history
HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=100000
setopt incappendhistory
setopt sharehistory

bindkey -e # use emacs keybindings

if command -v atuin >/dev/null; then
  eval "$(atuin init zsh)"
fi

if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

if [[ -f ~/Apps/miniconda3/bin/conda ]]; then
  eval "$("$HOME/Apps/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
fi
