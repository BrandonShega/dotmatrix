scriptencoding utf-8

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \  '%dW %dE',
  \  all_non_errors,
  \  all_errors
  \)
endfunction

if has('statusline')
  set laststatus=2 " Always show the statusline
  " Left Side
  set statusline=
  set statusline+=%#IncSearch#%{&paste?'\ \ PASTE\ ':''}%*
  set statusline+=\ %.50f
  set statusline+=\ %m
  set statusline+=\ %r
  set statusline+=\ %{fugitive#statusline()}
  set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
  set statusline+=%=
  " Right Side
  set statusline+=%y
  set statusline+=\ \ %P
  set statusline+=-%l
  set statusline+=-%c
  set statusline+=\ %{LinterStatus()}
endif
