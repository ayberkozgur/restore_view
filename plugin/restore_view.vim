"          FILE: restore_view.vim
"       Version: 1.2
"      Language: vim script
"    Maintainer: Yichao Zhou (broken.zhou AT gmail dot com)

if exists("g:loaded_restore_view")
    finish
endif
let g:loaded_restore_view = 1


if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! s:Check()
    if has('quickfix') && &buftype =~ 'nofile' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre ?* if s:Check() | silent! mkview   | endif
    autocmd BufWinLeave ?* if s:Check() | silent! mkview   | endif
    autocmd BufWinEnter ?* if s:Check() | silent! loadview | endif
augroup END
