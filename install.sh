#!/bin/sh

set -e

install_link() {
  printf '%-50s' "$1"
  if [ -f "$HOME/$1" ]; then echo "skipping (exists)"; return; fi
  mkdir -p "$HOME/$(dirname "$1")"
  ln -fs "$PWD/$1" "$HOME/$1"
  echo "installed"
}

install_repo() {
  dir_name=$(basename "$1" .git)
  printf '%s... ' "$dir_name"
  if [ -d "$HOME/Apps/$dir_name" ]; then
    (cd "$HOME/Apps/$dir_name"; git pull --ff-only)
  else
    mkdir -p ~/Apps
    (cd ~/Apps; git clone "$1")
  fi
}

configure_firefox() {
  for d in ~/.mozilla/firefox/*.*/; do
    if ! [ -d "$d" ]; then return; fi
    printf '%-50s' "$(basename "$d")"
    if [ -f "$d/user.js" ]; then echo "skipping (exists)"; continue; fi
    ln -fs "$PWD/firefox/user.js" "$d/user.js"
    echo "installed"
  done
}

stub_file() {
  printf '%-50s' "$1"
  if [ -f "$HOME/$1" ]; then echo "skipping (exists)"; return; fi
  (umask 077; touch "$HOME/$1")
  echo "stubbed"
}

install_link .config/nvim/coc-settings.json
install_link .config/nvim/init.vim
install_link .inputrc
install_link .profile
install_link .ripgreprc
install_link .vim/vimrc
install_link .zshenv
install_link .zshrc

stub_file .secrets

configure_firefox

install_repo https://github.com/junegunn/fzf.git
install_repo https://github.com/sindresorhus/pure.git
