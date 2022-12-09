#!/bin/sh

install() {
  mkdir -p "$HOME/$(dirname "$1")"
  ln -fs "$PWD/$1" "$HOME/$1"
}

install .config/nvim/init.vim
install .inputrc
install .profile
install .vim/vimrc

for d in ~/.mozilla/firefox/*.*/; do
  ln -fs "$PWD/firefox/user.js" "$d/user.js"
done
