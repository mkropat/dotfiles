#!/bin/sh

set -e

install_link() {
  printf '%-50s' "$1"
  if [ -L "$HOME/$1" ]; then echo "\033[2mskipping (exists)\033[0m"; return; fi
  if [ -f "$HOME/$1" ]; then echo "skipping (\033[93mwarning: not a link\033[0m)"; return; fi
  mkdir -p "$HOME/$(dirname "$1")"
  ln -fs "$PWD/$1" "$HOME/$1"
  echo "installed"
}

install_repo() {
  dir_name=$(basename "$1" .git)
  printf 'Updating %s.git… ' "$dir_name"
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
    if [ -f "$d/user.js" ]; then echo "\033[2mskipping (exists)\033[0m"; continue; fi
    ln -fs "$PWD/firefox/user.js" "$d/user.js"
    echo "installed"
  done
}

configure_git() {
  printf 'Configuring git… '
  git config --global --replace-all --type=bool push.autoSetupRemote true
  git config --global --type=bool rebase.autoStash true
  git config --global --type=bool rebase.updateRefs true
  git config --global core.autocrlf input
  git config --global core.commentChar auto
  git config --global init.defaultBranch main
  git config --global pull.ff only
  git config --global oh-my-zsh.hide-info 1

  git config --global alias.ca 'commit --amend --no-edit'
  git config --global alias.ci 'commit --verbose'
  git config --global alias.dc 'diff --cached'
  git config --global alias.di diff
  git config --global alias.fp 'push --force-with-lease'
  git config --global alias.fpstack "\!git log --decorate=short --pretty='format:%D' origin/main.. | sed 's/, /\\n/g; s/HEAD -> //'  | grep -Ev '/|^$' | xargs git push --force-with-lease origin"
  git config --global alias.l 'log --oneline'
  git config --global alias.pullrb 'pull --rebase'
  git config --global alias.rb '!f() { if [ $# -eq 0 ]; then set -- origin/main; git fetch origin main; fi && git rebase "$@"; }; f'
  git config --global alias.rc 'rebase --continue'
  git config --global alias.ri '!f() { if [ $# -eq 0 ]; then set -- origin/main; fi; git rebase --interactive --keep-base "$@"; }; f'
  git config --global alias.st 'status --short'
  git config --global alias.sw '!f() { if [ $# -gt 0 ]; then git switch "$@"; else git branch --sort=-committerdate | fzf | xargs git switch; fi; }; f'
  echo 'done'
}

stub_file() {
  printf '%-50s' "$1"
  if [ -f "$HOME/$1" ]; then echo "\033[2mskipping (exists)\033[0m"; return; fi
  if [ ! -d "$(dirname -- "$HOME/$1")" ]; then mkdir -p -- "$(dirname -- "$HOME/$1")"; fi
  touch "$HOME/$1"
  echo "stubbed"
}

cd "$(dirname "$0")"

stub_file .ssh/authorized_keys
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -f ~/.ssh/id_ed25519 -N '' -t ed25519
fi

install_link .config/atuin/config.toml
install_link .config/espanso/match/mlk.yml
install_link .config/nvim/coc-settings.json
install_link .config/nvim/init.vim
install_link .inputrc
install_link .local/bin/dotfiles
install_link .local/bin/newdroplet
install_link .profile
install_link .ripgreprc
install_link .tmux.conf
install_link .vim/vimrc
install_link .zprofile
install_link .zshenv
install_link .zshrc

(umask 077; stub_file .secrets)

configure_firefox
configure_git

install_repo https://github.com/junegunn/fzf.git
install_repo https://github.com/sindresorhus/pure.git
