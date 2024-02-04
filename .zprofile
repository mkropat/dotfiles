# Detect if we're in an interactive SSH session
if [[ -n "$SSH_CONNECTION" && -z "$SSH_ORIGINAL_COMMAND" && -z "$TMUX" ]]; then
  # If so, open tmux by default
  if tmux has-session; then
    exec tmux attach
  else
    exec tmux new
  fi
fi
