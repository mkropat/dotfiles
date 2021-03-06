set guioptions+=k
set guioptions-=T

set expandtab
set shiftwidth=2
set tabstop=2
set wildignorecase

if !exists('g:vimrc')
  let g:vimrc = $MYVIMRC
endif
if !exists('g:vimplugins')
  let g:vimplugins = g:vimrc
endif

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:tt_use_defaults = 1
let g:tt_taskfile = '~/Documents/tasks.md'

if has('win32')
  let g:gtfo#terminals = { 'win': 'powershell -NoLogo -NoExit -Command' }
endif

try
    unmap <C-f>
    unmap! <C-f>
catch
    " oh well
endtry

nnoremap <C-@> :Files<CR>
nnoremap <C-Space> :Files<CR>
nnoremap gb :BufExplorer<CR>
nnoremap gs <plug>(GrepperOperator)
xnoremap gs <plug>(GrepperOperator)
nnoremap gx :Dirvish %:p:h<CR>
nnoremap g. :execute 'edit' g:vimrc<CR>
nnoremap g/ :execute 'edit' g:vimplugins<CR>
autocmd BufReadPost * if expand('%') ==# g:vimrc | nnoremap <buffer> <CR> :update <Bar> source %<CR> | endif
nnoremap <C-^> :A<CR>

xnoremap / y/<C-R>"<CR>

nnoremap <silent> <CR> :wall <Bar> :TestFile<CR>
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
autocmd BufReadPost * if &buftype ==# 'quickfix' | nnoremap <buffer> <CR> <CR> | endif

set foldlevel=99
set foldmethod=indent
nnoremap <Leader>1 :set foldlevel=1<cr>
nnoremap <Leader>2 :set foldlevel=2<cr>
nnoremap <Leader>3 :set foldlevel=3<cr>
nnoremap <Leader>4 :set foldlevel=4<cr>
nnoremap <Leader>0 :set foldlevel=99<cr>

autocmd FileType html nnoremap <buffer> gob :call system('xdg-open ' . expand('%:S'))<cr>

" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd' fnameescape(path)
  endif
endfunction

try
    colorscheme solarized
    set background=light
catch /^Vim\%((\a\+)\)\=:E185/
    " oh well
endtry

try
    set guifont=IBM\ Plex\ Mono\ 11,IBM_Plex_Mono:h10:cANSI:qDRAFT
catch /^E596/
    "oh well
endtry
