autoload -U compinit && compinit -C
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

if [[ -d $HOME/Apps/pure ]]; then
  fpath+=($HOME/Apps/pure)
  autoload -U promptinit; promptinit
  prompt pure
else
  autoload -Uz colors && colors

  # ---- One-line prompt ----
  PROMPT='%F{cyan}%n%f@%F{cyan}%m%f %F{blue}%1~%f %F{magenta}❯%f '
  RPROMPT='%(?..%F{red}[%?]%f)'

  # ---- Nicer pasting / URL quoting ----
  autoload -Uz bracketed-paste-magic url-quote-magic
  zle -N bracketed-paste bracketed-paste-magic
  zle -N self-insert url-quote-magic
fi

HISTFILE=~/.zsh_history
HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=100000
setopt incappendhistory
setopt sharehistory

bindkey -e # use emacs keybindings

if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

if [[ -f ~/Apps/miniconda3/bin/conda ]]; then
  eval "$("$HOME/Apps/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
fi

if command -v bat >/dev/null; then
  alias cat=bat
elif command -v batcat >/dev/null; then
  alias cat=batcat
fi
