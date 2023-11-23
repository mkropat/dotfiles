#!/bin/sh

set -e

install_link() {
  if [ -f "$HOME/$1" ]; then return; fi
  echo "Installing:   $1"
  mkdir -p "$HOME/$(dirname "$1")"
  ln -fs "$PWD/$1" "$HOME/$1"
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
    if [ -f "$d/user.js" ]; then continue; fi
    echo "Customizing:  $(basename "$d") Firefox profile"
    ln -fs "$PWD/firefox/user.js" "$d/user.js"
  done
}

stub_file() {
  if [ -f "$HOME/$1" ]; then return; fi
  echo "Stubbing:     $1"
  (umask 077; touch "$HOME/$1")
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
