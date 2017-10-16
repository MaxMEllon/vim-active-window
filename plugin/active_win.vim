"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin file
"
" Maintainer: MaxMEllon <maxmellon1994@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight InactiveWindow ctermfg=244

if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for l:i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ''
      if l:i != winnr()
        let l:width = 256 " max
        let l:range = join(range(1, l:width), ',')
        call setwinvar(l:i, '&colorcolumn', l:range)
      else
        call setwinvar(l:i, '&colorcolumn', '80,120')
      endif
    endfor
  endfunction

  augroup DimInactiveWindows
    autocmd!
    autocmd WinEnter * call s:DimInactiveWindows()
  augroup END
endif
