#!/bin/sh

set -e

install_link() {
  mkdir -p "$HOME/$(dirname "$1")"
  ln -fs "$PWD/$1" "$HOME/$1"
}

install_link .config/nvim/init.vim
install_link .inputrc
install_link .profile
install_link .vim/vimrc

for d in ~/.mozilla/firefox/*.*/; do
  ln -fs "$PWD/firefox/user.js" "$d/user.js"
done

mkdir -p ~/Apps

install_repo() {
  dir_name=$(basename "$1" .git)
  printf '%s... ' "$dir_name"
  if [ -d "$HOME/Apps/$dir_name" ]; then
    (cd "$HOME/Apps/$dir_name"; git pull --ff-only)
  else
    (cd ~/Apps; git clone "$1")
  fi
}

install_repo https://github.com/junegunn/fzf.git
install_repo https://github.com/sindresorhus/pure.git
