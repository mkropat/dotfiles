" plugins.vim - Install/update a list of vim plugins
"
" 1. Save this file
" 2. Open it in vim
" 3. Execute `:so %`

let s:repos = [
\ "https://github.com/jlanzarotta/bufexplorer.git",
\ "https://github.com/junegunn/fzf.git",
\ "https://github.com/junegunn/fzf.vim.git",
\ "https://github.com/justinmk/vim-dirvish.git",
\ "https://github.com/justinmk/vim-gtfo.git",
\ "https://github.com/kovisoft/paredit.git",
\ "https://github.com/mileszs/ack.vim.git",
\ "https://github.com/mkropat/vim-dwiw2015.git",
\ "https://github.com/mkropat/vim-ezguifont.git",
\ "https://github.com/morhetz/gruvbox.git",
\ "https://github.com/nanotee/zoxide.vim.git",
\ "https://github.com/tpope/vim-projectionist.git",
\ "https://github.com/tpope/vim-sensible.git",
\ "https://github.com/tpope/vim-sleuth.git",
\ "https://github.com/vim-airline/vim-airline-themes.git",
\ "https://github.com/vim-airline/vim-airline.git",
\ ]

if executable('node')
  call add(s:repos, #{ repo_url: "https://github.com/neoclide/coc.nvim.git", branch: "release" })
endif

let s:vimdir = split(&runtimepath, ",")[0]
let s:plugdir = s:vimdir . "/pack/bundle/start"

if !isdirectory(s:plugdir)
  call mkdir(s:plugdir, "p")
endif

for s:name in readdir(s:plugdir)
  let s:path = s:plugdir . "/" . s:name
  if isdirectory(s:path)
    let s:original_dir = chdir(s:path)
    silent !git pull --ff-only
    call chdir(s:original_dir)
  endif
endfor

for s:repo in s:repos
  if type(s:repo) == v:t_string
    let s:repo = #{ repo_url: s:repo }
  endif

  let s:name = fnamemodify(s:repo["repo_url"], ":t:r")
  let s:repodir = s:plugdir . "/" . s:name
  if !isdirectory(s:repodir)
    if has_key(s:repo, "branch")
      execute "silent" "!git" "clone" "--branch" s:repo["branch"] "--depth" "1" "--" shellescape(s:repo["repo_url"]) shellescape(s:repodir)
    else
      execute "silent" "!git" "clone" "--depth" "1" "--" shellescape(s:repo["repo_url"]) shellescape(s:repodir)
    endif
  endif
endfor

helptags ALL
