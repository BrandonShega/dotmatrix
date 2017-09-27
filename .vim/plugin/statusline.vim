scriptencoding utf-8

if has('statusline')
  set laststatus=2 " Always show the statusline
  " Left Side
  set statusline=
  set statusline+=%#IncSearch#%{&paste?'\ \ PASTE\ ':''}%*
  set statusline+=\ %.50f
  set statusline+=\ %m
  set statusline+=\ %r
  set statusline+=\ %{fugitive#statusline()}
  set statusline+=%=
  " Right Side
  set statusline+=%y
  set statusline+=\ \ %P
  set statusline+=-%l
  set statusline+=-%c
  set statusline+=\ %#ErrorMsg#%{SyntasticStatuslineFlag()}%*
endif
