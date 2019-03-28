set guioptions-=T
set guioptions+=k

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ackprg = 'rg --vimgrep'

if has('win32')
  let g:gtfo#terminals = { 'win': 'powershell -NoLogo -NoExit -Command' }
endif

try
    colorscheme solarized
    set background=light
catch /^Vim\%((\a\+)\)\=:E185/
    " oh well
endtry

try
    set guifont=IBM_Plex_Mono:h10:cANSI:qDRAFT
catch /^E596/
    "oh well
endtry

nnoremap <C-n> :cnext<cr>

nnoremap <Leader>1 :set foldlevel=1<cr>
nnoremap <Leader>2 :set foldlevel=2<cr>
nnoremap <Leader>3 :set foldlevel=3<cr>
nnoremap <Leader>4 :set foldlevel=4<cr>
nnoremap <Leader>0 :set foldlevel=99<cr>

function! FormatJson()
    %!jq .
    if v:shell_error
        let error=getline(1)
        undo
        echohl WarningMsg | echom error | echohl none
    endif
endfunction
nnoremap <Leader>j :call FormatJson()<cr>

try
    unmap <C-f>
    iunmap <C-f>
    cunmap <C-f>
catch
    " oh well
endtry
