set guioptions-=T

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ackprg='ag'

if has('win32')
  let g:gtfo#terminals = { 'win': 'powershell -NoLogo -NoExit -Command' }
endif

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    " oh well
endtry

nnoremap <C-n> :cnext<cr>
