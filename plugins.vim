" plugins.vim - Install/update a list of vim plugins
"
" 1. Save this file
" 2. Open it in vim
" 3. Execute `:so %`

let s:repos = '
\ https://github.com/dense-analysis/ale.git
\ https://github.com/jlanzarotta/bufexplorer.git
\ https://github.com/junegunn/fzf.git
\ https://github.com/junegunn/fzf.vim.git
\ https://github.com/justinmk/vim-dirvish.git
\ https://github.com/justinmk/vim-gtfo.git
\ https://github.com/mhinz/vim-grepper.git
\ https://github.com/mkropat/vim-dwiw2015.git
\ https://github.com/morhetz/gruvbox.git
\ https://github.com/nanotee/zoxide.vim.git
\ https://github.com/tpope/vim-projectionist.git
\ https://github.com/tpope/vim-sensible.git
\ https://github.com/tpope/vim-sleuth.git
\ https://github.com/vim-airline/vim-airline-themes.git
\ https://github.com/vim-airline/vim-airline.git
\'

let s:vimdir = split(&runtimepath, ',')[0]
let s:plugdir = s:vimdir . '/pack/bundle/start'

if !isdirectory(s:plugdir)
  call mkdir(s:plugdir, 'p')
endif

for s:url in split(s:repos)
  let s:name = fnamemodify(s:url, ':t:r')
  let s:repodir = s:plugdir . '/' . s:name
  if isdirectory(s:repodir)
    let s:original_dir = chdir(s:repodir)
    if !empty(s:original_dir)
      silent !git pull --ff-only
      call chdir(s:original_dir)
    endif
  else
    execute 'silent' '!git' 'clone' '--' shellescape(s:url) shellescape(s:repodir)
  endif
endfor

helptags ALL
